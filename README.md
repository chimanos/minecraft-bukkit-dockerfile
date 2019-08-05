# Minecraft Bukkit Dockerfile
[![Build Status](https://api.travis-ci.org/chimanos/minecraft-bukkit-dockerfile.svg?branch=master)](https://travis-ci.org/chimanos/minecraft-bukkit-dockerfile)

A Dockerfile for build bukkit minecraft server. 

You can find images on Docker Hub: [chimanos/mc-bukkit](https://cloud.docker.com/repository/docker/chimanos/mc-bukkit/)

The build jar of Craftbukkit came from  [GetBukkit](https://getbukkit.org/download/craftbukkit).

## Tags: 
| Tag        | Bukkit Version | 
| ------------- |:-------------:| 
| latest      | 1.14.4-R0.1-SNAPSHOT | 
| 1.14.4-R0.1-SNAPSHOT      | 1.14.4-R0.1-SNAPSHOT |
| 1.14.3-R0.1-SNAPSHOT      | 1.14.3-R0.1-SNAPSHOT |   

## Run

You can run the container with the following command:

`
    docker run -v /data:/data -p 25565:25565 -e EULA=true --name mc-bukkit chimanos/mc-bukkit
`

If you want to run a specific version of bukkit, simply add the version after the docker tag:

`
    docker run -v /data:/data -p 25565:25565 -e EULA=true --name mc-bukkit chimanos/mc-bukkit:1.14.4-R0.1-SNAPSHOT
`

All of the config files are in the volume **/data**.
 
