# Setup React

## Install Node

```sh
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
```

```sh
# ~/.profile OR ~/.bashrc
export NODE_MODULES=~/.node/node_modules
source ~/.bashrc # or ~/.profile
```

check it

```sh
node -v
npm -v
```

## React 18

install react scripts

```sh
npm install -g react-scripts@latest
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
npm install --save npm install @mui/material @emotion/react @emotion/styled
```

> More info at **[MUI.com](https://mui.com/)**

## Git Ignore

Add a `.gitignore` using facebooks template

- [React .gitignore template](https://github.com/facebook/react/blob/main/.gitignore)

## Run it

```
npm start
```
