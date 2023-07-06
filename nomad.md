# Nomad

Install Nomad

> [official docs](https://developer.hashicorp.com/nomad/downloads)

```sh
apt install unzip
curl -L https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_linux_amd64.zip -o nomad_1.5.6_linux_amd64.zip
unzip nomad_1.5.6_linux_amd64.zip
sudo mv ./nomad /usr/local/bin/
```

Create a systemd service `/etc/systemd/system/nomad.service`

```r
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

Create a configuration file to create a bootstrapping token

```sh
mkdir -p /etc/nomad.d
touch /etc/nomad.d/nomad.hcl
```

create a config file that enables both server and client `/etc/nomad/nomad.hcl`:

```hcl
datacenter = "dc1"
data_dir   = "/var/lib/nomad"
bind_addr  = "0.0.0.0"

acl {
  enabled = true
}

client {
  enabled = true
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

> *note*: Add it to `~/.profile` for more ease

Create a policy file: `~/policy.hcl`

```hcl
namespace "default" {
  policy = "write"
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

read logs

```sh
journalctl -f -u nomad.service
```


Open an ssh tunnel to the server running Nomad

```sh
ssh -L 4646:127.0.0.1:4646 <user>@<server> -N
```

set env

```sh
export NOMAD_TOKEN="the new token"
export NOMAD_ADDR="http://127.0.0.1:4646"

nomad job status
```

> *note*: Add it to `~/.profile` for more ease


## Traefik

see [traefik](./traefik.md) for setting up traefik

and then deploy this demo

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
