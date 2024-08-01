[![dockeri.co](https://dockerico.blankenship.io/image/reth01/alist-proxy)](https://hub.docker.com/r/reth01/alist-proxy)

- docker-cli
```
docker run -d --restart=unless-stopped -e address='<alist地址>' -e token='<token>' -p 5243:5243 --name="alist-proxy" reth01/alist-proxy:latest
```

- docker-compose
```
version: '3.3'
services:
    alist-proxy:
        image: 'reth01/alist-proxy:latest'
        container_name: alist-proxy
        ports:
            - '5243:5243'
        environment:
            - address=https://alist.xxx.com
            - token=token      
        restart: unless-stopped
```