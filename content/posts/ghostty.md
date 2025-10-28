+++
title = "Install Ghostty"
categories = ["Setup"]
+++

## Install Ghostty (linux)

```sh
curl -L https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.2.3-0-ppa1/ghostty_1.2.3-0.ppa1_amd64_24.04.deb -O
sudo apt install ./ghostty_1.2.3-0.ppa1_amd64_24.04.deb
```

## Configurations

Set a theme, a shell and Enable ctrl+c and ctrl+v for copy and paste

`~/.config/ghostty/config`

```ini
theme = One Half Dark
shell-integration = bash
keybind = performable:ctrl+c=copy_to_clipboard
keybind = ctrl+v=paste_from_clipboard  
```

save it and restart ghostty
