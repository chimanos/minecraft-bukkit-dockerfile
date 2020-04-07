# Minecraft Bukkit Dockerfile
[![Build Status](https://api.travis-ci.com/chimanos/minecraft-bukkit-dockerfile.svg?branch=master)](https://travis-ci.com/chimanos/minecraft-bukkit-dockerfile)

A Dockerfile for build Craftbukkit Minecraft server. 

You can find images on Docker Hub: [chimanos/mc-bukkit](https://cloud.docker.com/repository/docker/chimanos/mc-bukkit/)

The build jar of Craftbukkit came from [GetBukkit](https://getbukkit.org/download/craftbukkit).

## Run

You can run the container with the following command (Remove -d if you don't want to execute the container in background):

`
    docker run -d -v /data:/data -p 25565:25565 -e EULA=true --name mc-bukkit chimanos/mc-bukkit
`

If you want to run a specific version of bukkit, simply add the version after the docker tag:

`
    docker run -d -v /data:/data -p 25565:25565 -e EULA=true --name mc-bukkit chimanos/mc-bukkit:1.14.4-R0.1-SNAPSHOT
`

All of the config files are in the volume **/data**.

## Tags

| Tag        | Bukkit Version | 
| ------------- |:-------------:| 
| latest      | 1.15.2 |  

## Automatic Update

This repository is automatically update with the lastest versions of Craftbukkit using a Travis cronjob.
You can see details on this cronjob [here](https://github.com/chimanos/minecraft-bukkit-dockerfile/tree/cronjob).
 
