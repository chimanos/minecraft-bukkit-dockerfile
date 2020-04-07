#!/bin/bash

#Define URL of craftbukkit versions list TODO: ERROR GESTION
craftbukkit_versions_url="https://getbukkit.org/download/craftbukkit"
github_project_url=https://github.com/chimanos/minecraft-bukkit-dockerfile.git
github_project_name=minecraft-bukkit-dockerfile

echo "**********************************"
echo "**CRONJOB SCRIPT FOR CRAFTBUKKIT**"
echo "**********************************"

echo "-> URL Craftbukkit : $craftbukkit_versions_url"

echo "-> Launching curl..."

#Save the HTML content in tmp_file
curl $craftbukkit_versions_url > tmp_raw_versions_list_html

echo "-> Raw HTML save in tmp file : tmp_raw_versions_list_html"

echo "-> Start parsing the list of urls..."

#Save a list of urls for versions pages in tmp file
cat tmp_raw_versions_list_html | grep "<a href=\"https://getbukkit.org/get/" | cut -d'"' -f2 > tmp_raw_list_urls

echo "-> List of urls save in tmp file : tmp_rw_list_urls"

echo "-> Start parsing every urls..."

#Parse all urls
while read url; do
    echo "-> Raw HTML for $url save in : tmp_raw_version_html"

    #Save the HTML content in tmp file
    curl $url > tmp_raw_version_html

    echo "-> Start parsing the version name..."

    #Parse the version name
    versionName=`cat tmp_raw_version_html | grep "<h1>craftbukkit-" | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'-' -f2,3,4,5`

    #Save the list of versions in file
    version="${versionName%.*}"

    echo $version >> craftbukkit-versions

    echo "Version $version added in the file"
done < tmp_raw_list_urls

echo "Delete tmp files..."

# Delete all tmp files
rm tmp_raw_versions_list_html
rm tmp_raw_list_urls
rm tmp_raw_version_html

echo "Create request body from versions..."

envs=""

# Parse versions
while read version; do
    if [ "$envs" = "" ]
    then
        envs="\"TAG=$version\""
    else
        envs="$envs,
        \"TAG=$version\""
    fi
done < craftbukkit-versions

# Travis API Body
body='{
 "request": {
     "message": "[Cronjob] - Check for new craftbukkit versions...",
     "branch":"master",
     "config": {
       "merge_mode": "deep_merge_append",
       "env": [
         '"$envs"'
       ]
     }
 }
}'

echo "Launch jobs on master branch using Travis API..."

# Start jobs with the versions list
curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Travis-API-Version: 3" \
 -H "Authorization: token $API_TOKEN" \
 -d "$body" \
 https://api.travis-ci.com/repo/chimanos%2Fminecraft-bukkit-dockerfile/requests

#Cloning repository
#git clone $github_project_url
#
#cd $github_project_name
#
#git fetch
#git checkout feat/testcron #Change to master
#git pull

echo "Delete craftbukkit-versions file..."

# Delete craftbukkit-versions file
rm craftbukkit-versions








