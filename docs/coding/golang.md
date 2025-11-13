---
title: Go
icon: lucide/panda
hide:
  - toc
---

### Install Golang (Windows)

!!! warning "Be aware"
    I **do not** recommend installing Golang using the MSI installer as it requires administrative privileges and can become problematic when installing dependencies for projects. With the approach below Golang will be installed in your user-space.

- Create the folder `C:\Users\<username>\go`

- Download the zip for [Go 1.25 win amd64](https://go.dev/dl/go1.25.windows-amd64.zip)

- Extract the zip into `C:\Users\<username>\go`

Add the following environment variables via _Edit the System Environment Variables_

| Variable | Value |
|----------|-------|
| PATH     | `C:\Users\<username>\go\bin` |
| GOBIN    | `C:\Users\<username>\go\bin` |
| GOPATH   | `C:\Users\<username>\go`     |

This ensures Go can be run from the command line and that dependencies land in the right folders.

When upgrading Go simply delete `C:\Users\<username>\go` and create a new folder to extract the new version in.

### Install Golang (Linux or WSL)


```sh title="shell"
GOVERSION="1.25.4"
curl -sSL https://go.dev/dl/go${GOVERSION}.linux-amd64.tar.gz -o go${GOVERSION}.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go${GOVERSION}.linux-amd64.tar.gz
```

add the following to `~/.profile`

```sh title="~/.profile"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:"$HOME/go/bin"
```
