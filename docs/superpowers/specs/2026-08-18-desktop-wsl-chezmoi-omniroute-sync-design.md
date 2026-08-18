# Local-to-desktop-wsl Chezmoi and OmniRoute Sync Design

## Goal

Make the local machine's Chezmoi repository the merged source of truth, apply it to `desktop-wsl`, and give OpenCode on `desktop-wsl` the same OmniRoute capability as the local machine.

## Configuration merge

Review live drift on both machines. Incorporate useful target-only settings into portable Chezmoi source files while retaining local changes. Resolve host-specific paths through Chezmoi templates or `$HOME`; do not copy generated caches, logs, databases, or machine-specific runtime state.

The WSL btop configuration is host-specific because it exposes WSL/GPU capabilities. Preserve it conditionally rather than forcing it onto Fedora.

## OmniRoute

Manage the OmniRoute OpenCode plugin artifacts through Chezmoi so both machines receive the same plugin version. Keep the existing portable OpenCode template and OmniRoute endpoint. Do not store credentials in Git or Chezmoi.

Transfer only the `opencode-omniroute` authentication entry from the local OpenCode auth store to `desktop-wsl` over SSH. Preserve any target credentials and enforce mode `0600`.

## Deployment flow

1. Merge live local and WSL drift into Chezmoi source.
2. Add the OmniRoute plugin files to Chezmoi.
3. Validate templates, JSON, shell syntax, and repository diff.
4. Commit and push the dotfiles repository.
5. Back up target drift, update the target repository, and apply Chezmoi.
6. Transfer the OmniRoute credential securely over SSH.
7. Restart OpenCode by launching a fresh process on `desktop-wsl`.

## Verification

Confirm both Chezmoi repositories are on the same commit, target managed files have no unintended drift, OpenCode accepts its configuration, OmniRoute is reachable, `opencode models opencode-omniroute` discovers models, and a non-interactive prompt using the configured OmniRoute model succeeds.

## Rollback and safety

Create a timestamped target backup before applying. Never add auth files or secrets to Git. If validation fails, restore target files from the backup and leave the target repository at its prior commit.
