# Nomad

```sh
apt install unzip
curl -L https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_linux_amd64.zip -o nomad_1.5.6_linux_amd64.zip
unzip nomad_1.5.6_linux_amd64.zip
sudo mv ./nomad /usr/local/bin/
```

`/etc/systemd/system/nomad.service`

```r
[Unit]
Description=Nomad
Documentation=https://www.nomadproject.io/docs/
Wants=network-online.target
After=network-online.target

[Service]
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/nomad agent -bind 0.0.0.0 -config /etc/nomad.d
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

```sh
sudo systemctl daemon-reload
sudo systemctl start nomad.service
sudo systemctl enable nomad.service
```

```sh
mkdir -p /etc/nomad.d
touch /etc/nomad.d/nomad.hcl
```

`/etc/nomad/nomad.hcl`:

```hcl
acl {
  enabled = true
}
```

```sh
sudo systemctl restart nomad.service

```

```sh
nomad acl bootstrap
# ...
# Secret ID    = 9184ec35-65d4-9258-61e3-0c066d0a45c5
# ...

echo "<SECRET_ID>" > bootstrap.token
export NOMAD_TOKEN=$(cat bootstrap.token)

nomad acl token create -type="client" -name="username"
```



```sh
ssh -L 4646:127.0.0.1:4646 <user>@<ip> -N
```
