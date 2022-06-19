# Dotfiles
---

## Dependencies
* python3-pip
* apt-transport-https
* curl
* Rust (Cargo)

```bash
sudo apt install -y python3-pip apt-transport-https curl
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
```

## Installation
> **WARNING**: Backup your HOME directory or use a disposable VM before proceeding.

First, clone the repository:
```bash
git clone --recursive https://github.com/pietrotavares/dotfiles
```

To install all packages:

```bash
./install-packages
```

To install a specific profile:

```bash
./install-profile <profile_name>
```

To apply a specific config:

```bash
./install-standalone [configs...]
```
> see `meta/configs/` for more info

All of the commands aboves are idem-potent. You can safely run them multiple times if you wish.

## Contents (Overview)

### Dotbot configurations

```
meta/configs/
├── bash.yaml
├── custom-dirs.yaml
├── fonts.yaml
├── git.yaml
├── i3.yaml
├── kubernetes.yaml
├── nvim.yaml
├── passwords.yaml
├── scripts.yaml
├── smerge.yaml
├── subl.yaml
└── terminal.yaml
```

### Dotfiles
```
.
├── editors
│   ├── nvim
│   └── sublime-text
├── gui
│   ├── fonts
│   └── i3
├── install-packages
├── install-profile
├── install-standalone
├── meta
│   ├── base.yaml
│   ├── configs
│   ├── dotbot
│   └── dotbot_plugins
├── misc
│   ├── crypto
│   ├── custom-dirs
│   ├── git
│   ├── passwords
│   └── scripts
├── shell
│   ├── bash
│   └── profile
└── terminal
    ├── st
    ├── tmux
    └── util
```
