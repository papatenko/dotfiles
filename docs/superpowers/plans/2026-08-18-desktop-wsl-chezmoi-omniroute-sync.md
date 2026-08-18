# Desktop WSL Chezmoi and OmniRoute Sync Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Merge local and `desktop-wsl` configuration into portable Chezmoi source, deploy it to WSL, and verify OpenCode can use OmniRoute.

**Architecture:** The local Chezmoi Git repository remains the source of truth. Portable shell and application configuration is templated, desktop-only KDE/Konsave data is excluded on WSL, and versioned OmniRoute plugin artifacts are managed by Chezmoi while authentication is transferred separately over SSH.

**Tech Stack:** Chezmoi 2.x, Git, Bash/Zsh, SSH, JSON, OpenCode 1.18.15, OmniRoute OpenCode plugin 0.2.1.

## Global Constraints

- Never store OpenCode authentication or other secrets in Git or Chezmoi.
- Preserve target-only useful configuration and back up target drift before applying.
- Resolve portable home paths with `$HOME` in shell files and `{{ .chezmoi.homeDir }}` in Chezmoi templates.
- Keep WSL-specific btop/GPU configuration off Fedora.
- Restart OpenCode after configuration changes.

---

### Task 1: Portable merged Chezmoi source

**Files:**
- Modify: `.chezmoiignore`
- Modify: `dot_bash_profile`
- Modify: `dot_bashrc`
- Modify: `dot_zshrc`
- Modify: `dot_claude/private_settings.json.tmpl`
- Modify or template: `dot_config/btop/btop.conf`
- Modify/template KDE and Konsave files containing `/home/jkondratenko`

**Interfaces:**
- Consumes: local and `desktop-wsl` output from `chezmoi diff --no-pager`.
- Produces: portable source that renders valid files for `/home/jkondratenko` and `/home/dev`.

- [ ] Merge useful local and WSL shell drift, replacing hardcoded home directories.
- [ ] Preserve WSL btop 1.4.7/GPU settings conditionally.
- [ ] Exclude Fedora desktop-only Konsave/KDE files on WSL or template their home paths where portable.
- [ ] Render templates for both machines and scan rendered output for the other machine's home path.
- [ ] Run `bash -n` and `zsh -n` against rendered shell files.

### Task 2: Reproducible OmniRoute plugin

**Files:**
- Create: `dot_config/opencode/plugins/omniroute/package.json`
- Create: `dot_config/opencode/plugins/omniroute/dist/index.js`
- Create: `dot_config/opencode/plugins/omniroute/dist/index.d.ts`
- Verify: `dot_config/opencode/opencode.json.tmpl`

**Interfaces:**
- Consumes: local OmniRoute plugin 0.2.1 artifacts.
- Produces: identical plugin files under `~/.config/opencode/plugins/omniroute` on each machine.

- [ ] Add the three non-secret plugin artifacts through Chezmoi.
- [ ] Verify the rendered OpenCode JSON parses and includes the portable OpenViking path.
- [ ] Run local `opencode models opencode-omniroute` and confirm model discovery.

### Task 3: Repository validation and publication

**Files:**
- Modify: `docs/superpowers/plans/2026-08-18-desktop-wsl-chezmoi-omniroute-sync.md`
- Modify: all files from Tasks 1 and 2.

**Interfaces:**
- Consumes: validated merged source.
- Produces: pushed `main` commit available to `desktop-wsl`.

- [ ] Inspect `git status`, `git diff`, and recent commit style.
- [ ] Run `chezmoi execute-template`, shell syntax checks, JSON parsing, `chezmoi diff`, and `git diff --check`.
- [ ] Confirm no auth files, API keys, or tokens are staged.
- [ ] Commit intended changes and push `main` to `origin`.

### Task 4: Safe WSL deployment

**Files:**
- Back up: WSL live files reported by `chezmoi diff`.
- Apply: WSL Chezmoi managed destinations.

**Interfaces:**
- Consumes: pushed dotfiles commit.
- Produces: `desktop-wsl` at the same source commit with merged configuration applied.

- [ ] Create a timestamped WSL backup containing source status, live diff, and changed destination files.
- [ ] Update the WSL Chezmoi repository to the pushed commit.
- [ ] Preview `chezmoi diff --no-pager`, then apply.
- [ ] Verify shell syntax, rendered JSON, source commit equality, and expected remaining host-local drift.

### Task 5: Secure OmniRoute authentication and runtime verification

**Files:**
- Modify securely: `/home/dev/.local/share/opencode/auth.json`

**Interfaces:**
- Consumes: local `opencode-omniroute` auth entry and deployed plugin.
- Produces: functional OmniRoute provider in a fresh WSL OpenCode process.

- [ ] Merge only the `opencode-omniroute` entry into WSL auth JSON over SSH without printing its value.
- [ ] Set auth file mode to `0600` and verify its keys without exposing values.
- [ ] Verify OmniRoute endpoint reachability and plugin artifact checksums.
- [ ] Run `opencode models opencode-omniroute` on WSL and confirm models are discovered.
- [ ] Run a non-interactive prompt using `opencode-omniroute/auto/cheap` and confirm successful output.
- [ ] If runtime validation fails, restore the WSL backup and report the exact failing check.
