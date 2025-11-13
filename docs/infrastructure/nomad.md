---
title: Nomad
icon: lucide/container
---

## Installation

!!! info "Nomad installation docs"
    [https://developer.hashicorp.com/nomad/downloads](https://developer.hashicorp.com/nomad/downloads)


My preferred way to install Nomad:

```bash
apt install unzip
NOMAD_VERSION="1.10.2"
curl -L https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad_${NOMAD_VERSION}_linux_amd64.zip
unzip nomad_${NOMAD_VERSION}_linux_amd64.zip
sudo mv ./nomad /usr/local/bin/
```

Create a systemd service `/etc/systemd/system/nomad.service`

```ini
[Unit]
Description=Nomad
Documentation=https://www.nomadproject.io/docs/
Wants=network-online.target
After=network-online.target

[Service]
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/nomad agent -config /etc/nomad.d
KillMode=process
KillSignal=SIGINT
LimitNOFILE=65536
LimitNPROC=infinity
Restart=on-failure
RestartSec=2

TasksMax=infinity
OOMScoreAdjust=-1000

[Install]
WantedBy=multi-user.target
```

Apply and start the service

```sh
sudo systemctl daemon-reload
sudo systemctl start nomad.service
sudo systemctl enable nomad.service
```

## Configuration

Create a configuration file to create a bootstrapping token

```sh
mkdir -p /etc/nomad.d
touch /etc/nomad.d/nomad.hcl
```

create a config file that enables both server and client `/etc/nomad/nomad.hcl`:

!!! tip "Optional volume"
    Create a data volume with

    ```sh
    mkdir -p /mnt/data
    ```

    and add it to the configuration.

    Volumes are necessary for stateful workloads like databases.

```hcl
datacenter = "dc1"
data_dir   = "/var/lib/nomad"
bind_addr  = "0.0.0.0"

acl {
  enabled = true
}

client {
  enabled = true

  # Optional volume
  host_volume "data" {
      path      = "/mnt/data"
      read_only = false
  }
}

server {
  enabled = true
  bootstrap_expect = 1
}
```

Restart nomad

```sh
sudo systemctl restart nomad.service
```

Create a bootstrap token

```sh
nomad acl bootstrap
# ...
# Secret ID = 9184ec35-65d4-9258-61e3-0c066d0a45c5
# ...

echo "<SECRET_ID>" > bootstrap.token
export NOMAD_TOKEN=$(cat bootstrap.token)
```

> **note**: Add it to `~/.profile` for more ease

## ACL

Create a policy file: `~/policy.hcl`

```hcl
namespace "default" {
  policy = "write"

  variables {
    path "*" {
      capabilities = ["write", "read", "destroy"]
    }
  }
}

namespace "*" {
  policy = "read"
}

node {
  policy = "read"
}

agent {
  policy = "read"
}

operator {
  policy = "read"
}

quota {
  policy = "read"
}
```

Apply the policy

```sh
nomad acl policy apply default ./policy.hcl
```

Create a token for the policy

```sh
nomad acl token create -type="client" -name="default" -policy="default"
# ...
# Secret ID = 9184ec35-65d4-9258-61e3-0c066d0a45c5
# ...
```

## Logs

read logs

```sh
journalctl -f -u nomad.service
```

## Using Nomad

Open an SSH tunnel to the server running Nomad

!!! tip
    see my custom ssh tunnel tool [github.com/inveracity/ssh-tunnel](https://github.com/inveracity/ssh-tunnel)


```sh
ssh -L 4646:127.0.0.1:4646 <user>@<server> -N
```

set env

```sh
export NOMAD_TOKEN="the new token"
export NOMAD_ADDR="http://127.0.0.1:4646"

nomad job status
```

!!! tip
    Add the environment variables to the `~/.profile` file


## Deploy

!!! info "Traefik"
    see the [Traefik page](./traefik) for setting up Traefik and then deploy this demo

Create the file `whoami.nomad` with the following contents:

```hcl
job "whoami" {
  datacenters = ["dc1"]
  type        = "service"
  namespace   = "default"

  group "whoami" {
    count = 1

    network {
      port "http" {
        to = 80
      }
    }

    service {
      name     = "whoami-http"
      provider = "nomad"
      port     = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.whoami.rule=Host(`mydomain`)",
        "traefik.http.routers.whoami.entrypoints=websecure",
        "traefik.http.routers.whoami.tls=true",
        "traefik.http.routers.whoami.tls.certresolver=myresolver",
      ]
    }

    task "server" {
      driver = "docker"
      config {
        image = "traefik/whoami:latest"
        ports = ["http"]
      }
    }
  }
}
```

deploy it with the Nomad CLI

```sh
nomad job run whoami.nomad
nomad job status
```
