[![dockeri.co](https://dockerico.blankenship.io/image/reth01/alist-proxy)](https://hub.docker.com/r/reth01/alist-proxy)

# Koyeb
[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?type=docker&name=proxy&ports=5243;http;/&env[ADDRESS]=&env[TOKEN]=&env&image=docker.io/reth01/alist-proxy)

# render
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

# Docker
## Docker-cli
```
docker run -d --restart=unless-stopped -e ADDRESS='<alist地址>' -e TOKEN='<token>' -p 5243:5243 --name="alist-proxy" reth01/alist-proxy:latest
```

## Docker-compose
```
version: '3.3'
services:
    alist-proxy:
        image: 'reth01/alist-proxy:latest'
        container_name: alist-proxy
        ports:
            - '5243:5243'
        environment:
            - ADDRESS=https://alist.xxx.com
            - TOKEN=token      
        restart: unless-stopped
```