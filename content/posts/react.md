+++
title = "React"
categories = ["Web"]
+++

## Setup React 18

> **Important**: Install [Node](/posts/node) first

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
