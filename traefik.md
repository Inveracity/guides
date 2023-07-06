# Traefik

Install

```sh
curl -L https://github.com/traefik/traefik/releases/download/v3.0.0-beta2/traefik_v3.0.0-beta2_linux_amd64.tar.gz -o traefik_v3.0.0-beta2.tar.gz

tar -zxvf traefik_v3.0.0-beta2.tar.gz traefik

mv traefik /usr/local/bin/
```

Create a service file: `/etc/systemd/system/traefik.service`

```r
[Unit]
Description=traefik proxy
After=network-online.target
Wants=network-online.target systemd-networkd-wait-online.service

[Service]
# optional environment variables
# Environment=SOMEKEY=SOMEVALUE # This could be your DNS provider user and api key for DNS challenges
Restart=on-abnormal
ExecStart=/usr/local/bin/traefik --configfile /etc/traefik.d/traefik.yml
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
```

Create a config file in `/etc/traefik.d/traefik.yml`

and also create the directory `/var/lib/traefik` to store certificates in

```yaml
log:
  level: INFO

api:
  insecure: true
  dashboard: true

entryPoints:
  web:
    address: ":80"

  websecure:
    address: ":443"

providers:
  nomad:
    exposedbydefault: false
    endpoint:
      address: "http://127.0.0.1:4646"
      token: "<nomad token here>"

certificatesResolvers:
  myresolver:
    acme:
      certificatesDuration: 2160 # default
      email: "test@example.com"
      storage: "/var/lib/traefik/acme.json"
      dnsChallenge:
        provider: <your dns provider>
        delayBeforeCheck: 10
        resolvers:
        - "1.1.1.1:53"
        - "8.8.8.8:53"
```

> *note*: see the [traefik docs on dns challenges](https://doc.traefik.io/traefik/https/acme/#dnschallenge)

Enable the service

```sh
sudo systemctl daemon-reload
sudo systemctl start traefik.service
sudo systemctl enable traefik.service
```

read logs

```sh
journalctl -f -u traefik.service
```

Open an SSH tunnel to see the dashboard

```
ssh -L 8080:127.0.0.1:8080 <user>@<ip> -N
```
