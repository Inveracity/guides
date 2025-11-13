---
title: Nushell
icon: lucide/square-chevron-right
hide:
  - toc
---

## Installation

Download and install Nushell in linux (WSL)

```sh title="shell"
NUVERSION="0.108.0"
curl -L -O https://github.com/nushell/nushell/releases/download/${NUVERSION}/nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz
tar -C ~/ -xzf nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz
mv ~/nu-${NUVERSION}-x86_64-linux-gnu-full ~/nu
rm -f nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz
```

Add nushell to your `PATH` via `~/.profile`

```sh title="~/.profile"
export PATH=$PATH:"$HOME/nu"
```
