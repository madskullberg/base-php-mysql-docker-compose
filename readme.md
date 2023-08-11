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
Set in docker-compose.yml in all services: 
> "traefik.enable=true"
And mount a Traefik container
