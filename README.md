# Dotfiles

## Dependencies
* git
* python3-pip
* apt-transport-https
* curl

Install dependencies with:
```bash
sudo apt install -y git python3-pip apt-transport-https curl
```

## Installation
> **WARNING**: Backup your HOME directory or use a disposable VM before proceeding.

Clone the repository:
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
├── k8s.yaml
└── terminal.yaml
```

### Dotfiles
```
.
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
│   ├── custom-dirs
│   └── git
├── shell
│   ├── .bash_aliases
│   ├── .bash_logout
│   ├── .bash_profile
│   ├── .bashrc
│   └── .profile
└── terminal
    └── tmux.conf
```
