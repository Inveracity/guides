+++
title = "Hugo"
tags = ["website", "blog"]
+++

## Install hugo

This particular website is powered by Hugo.

> Before installing Hugo, [install Go](/posts/golang)

```sh
go install -tags extended github.com/gohugoio/hugo@latest
```

### Creating a new website

```sh
hugo new site mysite
```

Installing the [m10c](https://github.com/vaga/hugo-theme-m10c) theme

```sh
cd mysite
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
