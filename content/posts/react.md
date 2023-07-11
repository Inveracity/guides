+++
title = "React"
categories = ["Web"]
+++

# Setup React

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

Add the node binaries to PATH

```sh
#~/.profile
export PATH=~/.node/bin:$PATH
```

```sh
source ~/.profile
```

## React 18

Use Vite to create a new React project

```sh
npm init vite@latest MY_NEW_APP -- --template react-ts
cd MY_NEW_APP
npm install
npm run dev
```

install react-router-dom

```sh
npm install --save react-router-dom @types/react-router-dom
```

## UI kits (MUI)

```
npm install --save @mui/material @mui/icons-material @emotion/react @emotion/styled
```

> More info at **[MUI.com](https://mui.com/)**

> example project **[MUI Example](https://github.com/mui/material-ui/tree/master/examples/create-react-app-with-typescript)**

## Run it

```
npm start
```

## VScode settings

`.vscode/settings.json`

```json
{
  "editor.formatOnSave": true,
  "editor.detectIndentation": false,
  "[typescriptreact]": {
    "editor.tabSize": 2,
  },
  "[typescript]": {
    "editor.tabSize": 2,
  }
}
```
