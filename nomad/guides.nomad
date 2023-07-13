job "guides" {
  datacenters = ["linode"]
  type        = "service"
  namespace   = "default"

  group "guides" {
    count = 1

    network {
      port "http" {
        to = 80
      }
    }

    service {
      name     = "guides"
      provider = "nomad"
      port     = "http"
      tags = [
        "traefik.enable=true",
        # Router settings
        "traefik.http.routers.guides.rule=Host(`christopherbaklid.com`)",
        "traefik.http.routers.guides.entrypoints=websecure",
        "traefik.http.routers.guides.tls.certresolver=myresolver",
        "traefik.http.routers.guides.tls=true",
      ]
    }

    task "server" {
      driver = "docker"

      config {
        image = "inveracity/guides:latest"
        ports = ["http"]
        force_pull = true
      }
      resources {
        cpu    = 100
        memory = 50
      }
    }
  }
}
