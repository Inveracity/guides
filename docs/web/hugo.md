---
title: "Hugo"
icon: fontawesome/brands/html5
---

## Install hugo

This particular website is powered by Hugo.

!!! info "Go"
    Before installing Hugo, [install Go](../coding/golang)

Installing Hugo via Go ensures it's compiled for the environment. But it can take a minute to complete.

```sh
go install -tags extended github.com/gohugoio/hugo@latest
```

### Creating a new website

```sh
hugo new site my-site
```

Installing the [m10c](https://github.com/vaga/hugo-theme-m10c) theme

```sh
cd my-site
git clone https://github.com/vaga/hugo-theme-m10c.git themes/m10c
```

Remove some of the things that aren't necessary

```sh
rm -rf themes/m10c/.git
rm -rf themes/m10c/exampleSite
rm -rf themes/m10c/images/*
```

### Run it

```sh
hugo serve
```

and open <http://localhost:1313>

### Add some content

```sh
hugo new posts/my-first-post.md
```
