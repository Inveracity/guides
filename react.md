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

install react scripts

```sh
npm install --location=global react-scripts@latest
```

create React scaffolding

```sh
mkdir my_new_app
cd my_new_app
npx create-react-app . --template cra-template-typescript
```

install react router dom and the typescript additions

```sh
npm install --save react-router-dom @types/react-router-dom
```

## Settings

open up `tsconfig.json`

and change `es5` to `es6`

```diff
{
  "compilerOptions": {
-    "target": "es5",
{
  "compilerOptions": {
+    "target": "es6",
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
    "[typescriptreact]": {
        "editor.tabSize": 2,
    },
    "[typescript]": {
        "editor.tabSize": 2,
    }
}
```
