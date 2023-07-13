+++
title = "VSCode"
categories = ["Setup"]
+++

In the root of a project add the contents below to `.vscode/settings.json`

```json
{
  "files.eol": "\n",
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.detectIndentation": false,
  "editor.insertSpaces": true,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "files.associations": {
    "*.nomad": "hcl"
  },
  "css.lint.unknownAtRules": "ignore",

  "[svelte]": {
    "editor.defaultFormatter": "svelte.svelte-vscode"
  },

  "[go]": {
    "editor.tabSize": 4,
    "editor.snippetSuggestions": "top",
    "editor.insertSpaces": false,
    "editor.codeActionsOnSave": {
      "source.organizeImports": true
    },
    "editor.suggest.snippetsPreventQuickSuggestions": false
  },

  "[python]": {
    "editor.tabSize": 4,
    "python.linting.pylintEnabled": true,
    "python.formatting.provider": "black",
    "python.linting.enabled": true,
  },

  "[markdown]": {
    "editor.formatOnSave": false
  }
}
```
