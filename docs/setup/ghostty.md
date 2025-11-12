---
title: Ghostty
icon: lucide/terminal
hide:
  - toc
---

## Install Ghostty (linux)

```sh title="shell" linenums="1"
GHOSTTY_VERSION="1.2.3"
curl -L https://github.com/mkasberg/ghostty-ubuntu/releases/download/${GHOSTTY_VERSION}-0-ppa1/ghostty_${GHOSTTY_VERSION}-0.ppa1_amd64_24.04.deb -O
sudo apt install ./ghostty_${GHOSTTY_VERSION}-0.ppa1_amd64_24.04.deb
```

## Configurations

Set a theme, a shell and Enable ++ctrl+c++ and ++ctrl+v++ for copy and paste

```ini title="~/.config/ghostty/config"
theme = One Half Dark
shell-integration = bash
keybind = performable:ctrl+c=copy_to_clipboard
keybind = ctrl+v=paste_from_clipboard
```

save it and restart ghostty
