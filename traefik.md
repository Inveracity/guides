# Traefik

Install

```sh
curl -L https://github.com/traefik/traefik/releases/download/v3.0.0-beta2/traefik_v3.0.0-beta2_linux_amd64.tar.gz -o traefik_v3.0.0-beta2.tar.gz

tar -zxvf traefik_v3.0.0-beta2.tar.gz traefik

mv traefik /usr/local/bin/
```

`/etc/systemd/system/traefik.service`

```r
[Unit]
Description=traefik proxy
After=network-online.target
Wants=network-online.target systemd-networkd-wait-online.service

[Service]
Restart=on-abnormal
ExecStart=/usr/local/bin/traefik --api.insecure=true --api.dashboard=true --entrypoints.web.address=:80 --entrypoints.traefik.address=:8080 --providers.docker=true --providers.docker.exposedbydefault=false
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
```

```sh
sudo systemctl daemon-reload
sudo systemctl start traefik.service
sudo systemctl enable traefik.service
```

```
ssh -L 8080:127.0.0.1:8080 <user>@<ip> -N
```
