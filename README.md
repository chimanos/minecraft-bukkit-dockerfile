# Minecraft Bukkit Dockerfile
[![Build Status](https://api.travis-ci.com/chimanos/minecraft-bukkit-dockerfile.svg?branch=cronjob)](https://travis-ci.com/chimanos/minecraft-bukkit-dockerfile)

## Cronjob

The travis cronjob is use for fetch latest versions of Craftbukkit from [GetBukkit](https://getbukkit.org/download/craftbukkit). 

The bash script [cronjob.sh](https://github.com/chimanos/minecraft-bukkit-dockerfile/blob/cronjob/cronjob.sh) scroll the website and get all the Craftbukkit versions and use Travis api for start a new job on the master branche 
for build docker images for all versions.


## Resources

- Travis API: [Start jobs using API](https://docs.travis-ci.com/user/triggering-builds)


