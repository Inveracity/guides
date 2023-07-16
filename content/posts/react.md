+++
title = "React"
categories = ["Web"]
+++

## Setup React 18

{{< admonition type="info" title="Node" >}}
**Important**: Install [Node](/posts/node) first
{{< /admonition >}}

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

## UI library (MUI)

Add a UI library to get started quickly

```sh
npm install --save @mui/material @mui/icons-material @emotion/react @emotion/styled
```

{{< admonition type="info" title="MUI" >}}
- More info at **[MUI.com](https://mui.com/)**
- Example project **[MUI Example](https://github.com/mui/material-ui/tree/master/examples/material-vite-ts)**
{{< /admonition >}}

## Run it

```sh
npm start
```
