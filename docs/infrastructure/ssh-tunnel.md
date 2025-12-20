---
title: ssh-tunnel
icon: lucide/square-chevron-right
---

# ssh-tunnel

- <https://github.com/inveracity/ssh-tunnel>

## Install

```sh title="terminal" linenums="1"
curl -sSLO https://github.com/Inveracity/ssh-tunnel/releases/download/v0.0.4/ssh-tunnel_linux_amd64.zip
unzip ssh-tunnel_linux_amd64.zip
cp ssh-tunnel ~/.local/bin/ssh-tunnel
rm -f ssh-tunnel_linux_amd64.zip
rm -f ssh-tunnel
```

ensure `~/.profile` contains

```sh title="~/.profile"
# set PATH to include local bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
```

and then source it

```sh
. ~/.profile
```

and run it

```sh
ssh-tunnel --help
```
