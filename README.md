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

 |Tag|Bukkit Version|
 |:-------------:|:-------------:|
 |latest|1.15.2|
 |1.15.2|1.15.2|
 |1.15.1-R0.1-SNAPSHOT|1.15.1-R0.1-SNAPSHOT|
 |1.15-R0.1-SNAPSHOT|1.15-R0.1-SNAPSHOT|
 |1.14.4-R0.1-SNAPSHOT|1.14.4-R0.1-SNAPSHOT|
 |1.14.3-R0.1-SNAPSHOT|1.14.3-R0.1-SNAPSHOT|
 |1.14.2-R0.1-SNAPSHOT|1.14.2-R0.1-SNAPSHOT|
 |1.14.1-R0.1-SNAPSHOT|1.14.1-R0.1-SNAPSHOT|
 |1.14-R0.1-SNAPSHOT|1.14-R0.1-SNAPSHOT|
 |1.13.2|1.13.2|
 |1.13.1|1.13.1|
 |1.13|1.13|
 |1.12.2|1.12.2|
 |1.12.1|1.12.1|
 |1.12|1.12|
 |1.11.2|1.11.2|
 |1.11.1|1.11.1|
 |1.11|1.11|
 |1.10.2-R0.1-SNAPSHOT-latest|1.10.2-R0.1-SNAPSHOT-latest|
 |1.10-R0.1-SNAPSHOT-latest|1.10-R0.1-SNAPSHOT-latest|
 |1.9.4-R0.1-SNAPSHOT-latest|1.9.4-R0.1-SNAPSHOT-latest|
 |1.9.2-R0.1-SNAPSHOT-latest|1.9.2-R0.1-SNAPSHOT-latest|
 |1.9-R0.1-SNAPSHOT-latest|1.9-R0.1-SNAPSHOT-latest|
 |1.8.8-R0.1-SNAPSHOT-latest|1.8.8-R0.1-SNAPSHOT-latest|
 |1.8.7-R0.1-SNAPSHOT-latest|1.8.7-R0.1-SNAPSHOT-latest|
 |1.8.6-R0.1-SNAPSHOT-latest|1.8.6-R0.1-SNAPSHOT-latest|
 |1.8.5-R0.1-SNAPSHOT-latest|1.8.5-R0.1-SNAPSHOT-latest|
 |1.8.4-R0.1-SNAPSHOT-latest|1.8.4-R0.1-SNAPSHOT-latest|
 |1.8.3-R0.1-SNAPSHOT-latest|1.8.3-R0.1-SNAPSHOT-latest|
 |1.8-R0.1-SNAPSHOT-latest|1.8-R0.1-SNAPSHOT-latest|
 |1.7.10-R0.1-20140808.005431-8|1.7.10-R0.1-20140808.005431-8|
 |1.7.9-R0.2-SNAPSHOT|1.7.9-R0.2-SNAPSHOT|
 |1.7.8-R0.1-SNAPSHOT|1.7.8-R0.1-SNAPSHOT|
 |1.7.5-R0.1-20140402.020013-12|1.7.5-R0.1-20140402.020013-12|
 |1.7.2-R0.4-20140216.012104-3|1.7.2-R0.4-20140216.012104-3|
 |1.6.4-R2.0|1.6.4-R2.0|
 |1.6.2-R0.1-SNAPSHOT|1.6.2-R0.1-SNAPSHOT|
 |1.6.1-R0.1-SNAPSHOT|1.6.1-R0.1-SNAPSHOT|
 |1.5.2-R1.0|1.5.2-R1.0|
 |1.5.1-R0.2-SNAPSHOT|1.5.1-R0.2-SNAPSHOT|
 |1.5-R0.1-20130317.180842-21|1.5-R0.1-20130317.180842-21|
 |1.4.7-R1.1-SNAPSHOT|1.4.7-R1.1-SNAPSHOT|
 |1.4.6-R0.4-SNAPSHOT|1.4.6-R0.4-SNAPSHOT|
 |1.4.5-R1.1-SNAPSHOT|1.4.5-R1.1-SNAPSHOT|
 |1.4.2-R0.3-SNAPSHOT|1.4.2-R0.3-SNAPSHOT|
 |1.3.2-R2.1-SNAPSHOT|1.3.2-R2.1-SNAPSHOT|
 |1.3.1-R2.1-SNAPSHOT|1.3.1-R2.1-SNAPSHOT|
 |1.2.5-R5.1-SNAPSHOT|1.2.5-R5.1-SNAPSHOT|
 |1.2.4-R1.1-SNAPSHOT|1.2.4-R1.1-SNAPSHOT|
 |1.2.3-R0.3-SNAPSHOT|1.2.3-R0.3-SNAPSHOT|
 |1.2.2-R0.1-SNAPSHOT|1.2.2-R0.1-SNAPSHOT|
 |1.1-R5-SNAPSHOT|1.1-R5-SNAPSHOT|
 |1.0.0-SNAPSHOT|1.0.0-SNAPSHOT|

## Automatic Update

This repository is automatically update with the lastest versions of Craftbukkit using a Travis cronjob.
You can see details on this cronjob [here](https://github.com/chimanos/minecraft-bukkit-dockerfile/tree/cronjob).
 
