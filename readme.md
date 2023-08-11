# What
Basic PHP docker-compose setup

## How: 
> docker-compose up -d

## PHP.Dockerfile adds support for:
```
- imagemagick
- composer
- git
```
## Use with Traefik: 
Enable traefik in docker-compose.yml all services + mount Traefik container to Docker: 
> "traefik.enable=true"