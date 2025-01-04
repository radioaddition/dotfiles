#!/usr/bin/env bash
command -v brew &> /dev/null || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
/home/linuxbrew/.linuxbrew/bin/brew install chezmoi age
