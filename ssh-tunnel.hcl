tunnel {
	user = "root"
	name = "traefik"
	local {
		port = 8080
	}
	remote {
		host = "linode:22"
		port = 8080
	}
}
