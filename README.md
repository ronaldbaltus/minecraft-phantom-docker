# Minecraft Phantom docker
Minecraft Phantom is an app that acts like a proxy between online dedicated Minecraft Bedrock servers and Consoles.
Read more here: https://github.com/jhead/phantom

## Running
Run from cli like so: `docker run -e MCSERVER=my-server:19132 --rm -it ronaldbaltus/minecraft-phantom:latest-arm32v7`

## Docker compose
```
version: '2.2'
services:
  minecraftphantom:
    image: ronaldbaltus/minecraft-phantom:latest-arm32v7
    container_name: minecraftphantom
    environment:
      - MCSERVER=my-server:19132
    network_mode: host
```
