# Bash on Windows (Git Bash / MSYS2)

Shell configuration for Git Bash on Windows.

## What's included

- `.bashrc` - Main shell config: PATH setup, aliases, and starship prompt initialization.

## Prerequisites

- Git Bash — bundled with [GitHub Desktop](https://desktop.github.com/) (or standalone via [Git for Windows](https://gitforwindows.org/))

## Setup

Run the setup script from this repo:

```bash
bash setup.sh
```

This will:
1. Install [starship](https://starship.rs/) prompt to `~/bin` if not already present
2. Copy `.bash_profile` and `.bashrc` into your home directory (backs up existing ones)

After setup, restart your terminal or run `source ~/.bashrc`.

## Manual setup

If you prefer not to use the script:

```bash
ln -sf "$(pwd)/.bashrc" ~/.bashrc
```
