+++
title = "Install Go"
categories = ["Coding"]
+++

## Install Golang

### Install Golang (Windows)

> **note**: Don't install with the msi installer. It requires Admin Privileges and is annoying when using an IDE without admin privileges, like VSCode.

- Create the folder `C:\Users\<username>\go`

- Download the zip for [Go 1.20 win amd64](https://go.dev/dl/go1.20.windows-amd64.zip)

- Extract the zip into `C:\Users\<username>\go`

Add the following environment variables via _Edit the System Environment Variables_

| Variable | Value |
|----------|-------|
| PATH | `C:\Users\<username>\go\bin` |
| GOBIN | `C:\Users\<username>\go\bin` |
| GOPATH | `C:\Users\<username>\go` |

This ensures Go can be run from the command line and that dependencies land in the right folders.

When upgrading Go simply delete `C:\Users\<username>\go` and create a new folder to extract the new version in.

### Install Golang (Linux or WSL)

```sh
curl -sSL https://go.dev/dl/go1.20.linux-amd64.tar.gz -o go1.20.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.linux-amd64.tar.gz
```

add the following to `~/.profile`

```sh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/<USERNAME>/go/bin
```
