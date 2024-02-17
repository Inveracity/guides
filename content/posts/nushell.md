+++
title = "Nushell"
categories = ["Coding"]
+++


## Installation

Download and install Nushell in linux (WSL)

```sh
NUVERSION="0.90.1"
curl -L -O https://github.com/nushell/nushell/releases/download/${NUVERSION}/nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz # Download
tar -C ~/ -xzf nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz # Extract
mv ~/nu-${NUVERSION}-x86_64-linux-gnu-full ~/nu # Rename extracted folder
rm -f nu-${NUVERSION}-x86_64-linux-gnu-full.tar.gz # Cleanup
```

Add nushell to your `PATH` via `~/.profile`

```sh
# ~/.profile
export PATH=$PATH:"$HOME}/nu"
```
