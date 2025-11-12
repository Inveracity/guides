---
title: "Node"
icon: fontawesome/brands/node
hide:
  - toc
---

## Install Node

```sh
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
```

check it

```sh
node -v
npm -v
```

configure

```sh
mkdir ~/.node
npm config set prefix ~/.node
```

Add the node binaries to PATH by putting the following content into `~/.profile`

```sh
export PATH=~/.node/bin:$PATH
```

and then update the environment

```sh
source ~/.profile
```
