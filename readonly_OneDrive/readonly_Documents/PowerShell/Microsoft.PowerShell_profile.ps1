
# sshd runs as a Windows service, and services get their PATH from an
# environment snapshot cached at service-start/boot time — they don't pick
# up new registry PATH entries the way an interactive logon does, even
# after `Restart-Service sshd`. Winget/most installers only ever write to
# the registry, so anything installed since that snapshot (herdr, codex,
# etc.) resolves fine in a normal terminal but "not recognized" over SSH.
# Rebuild PATH fresh from the registry every session to sidestep this.
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

# PowerShell's $HOME automatic variable is never exported as an OS env var,
# so external POSIX-y tools (direnv, etc.) that read $env:HOME see nothing
# and fail with cryptic errors like "couldn't find a configuration directory".
if (-not $env:HOME) { $env:HOME = $HOME }

# wsl.exe defaults to UTF-16LE output when stdout isn't a real console (e.g.
# piped through an SSH-invoked non-interactive shell), which shows up as
# garbled/random characters. WSL_UTF8 forces UTF-8 output in that case.
if (-not $env:WSL_UTF8) { $env:WSL_UTF8 = '1' }

# Prioritize Git Bash over the legacy C:\WINDOWS\system32\bash.exe WSL stub,
# which direnv would otherwise pick up first and use to evaluate .envrc files.
$gitBashDir = "C:\Program Files\Git\bin"
if ((Test-Path "$gitBashDir\bash.exe") -and ($env:PATH -notlike "$gitBashDir;*")) {
    $env:PATH = "$gitBashDir;$env:PATH"
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# ListView's popup needs the terminal to answer cursor-position queries (ESC[6n);
# Herdr's PTY doesn't, so the dropdown silently fails to render there. Fall back
# to InlineView (single-line, no cursor query) inside Herdr panes.
$predictionView = if ($env:HERDR_ENV -eq '1') { 'InlineView' } else { 'ListView' }
if ($Host.UI.SupportsVirtualTerminal -and -not [Console]::IsOutputRedirected) {
    Set-PSReadLineOption -PredictionSource History -PredictionViewStyle $predictionView -EditMode Windows
} else {
    Set-PSReadLineOption -EditMode Windows
}

### Shell integrations (ported from dot_zshrc)
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
}
if (Get-Command direnv -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (direnv hook pwsh | Out-String) })
}
if (Get-Command atuin -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (atuin init powershell | Out-String) })
}
if ((Get-Command fzf -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable PSFzf)) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}

### Replacements (eza)
if (Get-Command eza -ErrorAction SilentlyContinue) {
    Remove-Item Alias:\ls -Force -ErrorAction SilentlyContinue
    function ls { eza --icons --group-directories-first @args }
    function ll { eza -l --icons --git --group-directories-first @args }
    function lt { eza --tree --level=2 --icons @args }
}

### AI (ported from dot_zshrc's _codex/ask/askc/wtf/fixit/gcm)
# Everything below runs through `codex exec`, which is already authenticated.
function _codex {
    param([Parameter(ValueFromRemainingArguments)][string[]]$Prompt)
    $out = New-TemporaryFile
    try {
        & codex exec --ephemeral --skip-git-repo-check --color never -s read-only -o $out.FullName ($Prompt -join ' ') *>$null
        if ((Get-Item $out.FullName).Length -gt 0) { Get-Content $out.FullName -Raw }
    } finally {
        Remove-Item $out.FullName -ErrorAction SilentlyContinue
    }
}

function ask { _codex @args }                       # ask "question", or `cmd | ask "question"`
function askc { codex @args }                        # drop into an interactive codex session

# Explain why the last command failed, using its real output.
# WARNING: this RE-RUNS the last command to capture output. Never use it after
# something with side effects (rm, git push, a migration) that partially succeeded.
function wtf {
    $cmd = (Get-History -Count 1).CommandLine
    if (-not $cmd) { Write-Host "No previous command in history."; return }
    $out = Invoke-Expression $cmd 2>&1 | Out-String
    _codex "This shell command failed. Explain concisely why, then give the fix.`n`nCommand: $cmd`nOutput:`n$out"
}

# Propose a corrected version of the last command. Does not run anything.
function fixit {
    $cmd = (Get-History -Count 1).CommandLine
    if (-not $cmd) { Write-Host "No previous command in history."; return }
    _codex "Output ONLY a corrected shell command, no prose, no backticks: $cmd"
}

# Draft a conventional-commit message from the staged diff, then open $EDITOR to review.
Remove-Item Alias:\gcm -Force -ErrorAction SilentlyContinue
function gcm {
    $diff = git diff --cached
    if (-not $diff) { Write-Host "nothing staged"; return }
    $msg = $diff | _codex "Write a conventional-commit message for this diff. Subject line under 72 chars. Body only if the change is non-obvious. Output only the message."
    git commit -e -m $msg
}
