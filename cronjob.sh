#!/bin/bash

#Define URL of craftbukkit versions list
craftbukkit_versions_url="https://getbukkit.org/download/craftbukkit"

echo "**********************************"
echo "**CRONJOB SCRIPT FOR CRAFTBUKKIT**"
echo "**********************************"

echo -e "-> URL Craftbukkit : $craftbukkit_versions_url\n"

echo -e "-> Launching curl...\n"

#Save the HTML content in tmp_file
curl $craftbukkit_versions_url > tmp_raw_versions_list_html

echo -e "-> Raw HTML save in tmp file : tmp_raw_versions_list_html\n"

echo -e "-> Start parsing the list of urls...\n"

#Save a list of urls for versions pages in tmp file
cat tmp_raw_versions_list_html | grep "<a href=\"https://getbukkit.org/get/" | cut -d'"' -f2 > tmp_raw_list_urls

echo -e "-> List of urls save in tmp file : tmp_rw_list_urls\n"

echo -e "-> Start parsing every urls...\n"

#Parse all urls
while read url; do
    echo -e "-> Raw HTML for $url save in : tmp_raw_version_html\n"

    #Save the HTML content in tmp file
    curl $url > tmp_raw_version_html

    echo -e "-> Start parsing the version name...\n"

    #Parse the version name
    versionName=`cat tmp_raw_version_html | grep "<h1>craftbukkit-" | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'-' -f2,3,4,5`

    #Save the list of versions in file
    version="${versionName%.*}"

    echo $version >> craftbukkit-versions

    echo -e "-> Version $version added in the file\n"
done < tmp_raw_list_urls

echo -e "-> Delete tmp files...\n"

# Delete all tmp files
rm tmp_raw_versions_list_html
rm tmp_raw_list_urls
rm tmp_raw_version_html

echo -e "-> Create request body from versions...\n"

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

echo -e "-> Launch jobs on master branch using Travis API...\n"

# Start jobs with the versions list
curl -s -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Travis-API-Version: 3" \
 -H "Authorization: token $API_TOKEN" \
 -d "$body" \
 https://api.travis-ci.com/repo/chimanos%2Fminecraft-bukkit-dockerfile/requests

echo -e "-> Create markdown array with tags and versions\n"

#Loop on craftbukkit-versions and create array
nbLine=0

tab="\n
|Tag|Bukkit Version|\n
|:-------------:|:-------------:|\n"

#Create lines of tags and versions
while read version; do
    if [ $nbLine = 0 ]
    then
        tab="
        $tab
        |latest|$version|\n
        |$version|$version|\n"
    else
        tab="
        $tab
        |$version|$version|\n"
    fi

    ((nbLine=nbLine+1))
done < craftbukkit-versions

echo -e "-> Delete craftbukkit-versions file...\n"

# Delete craftbukkit-versions file
rm craftbukkit-versions

echo -e "-> Checkout on branche master ...\n"

#Git checkout on master
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_NAME}

git fetch

git checkout master

git pull

echo -e "-> Replace existing tags...\n"

#Replace existing tags
lead='^## Tags$'
tail='^## Automatic Update$'

echo -e $tab >> tmp_tab

replaceContent=$(sed -e "/$lead/,/$tail/{ /$lead/{p; r tmp_tab
        }; /$tail/p; d }" README.md)

#Update README
echo "$replaceContent" > README.md

echo -e "-> Delete tmp_tab file...\n"

#Delete tmp_tab file
rm tmp_tab

echo -e "-> Git push of the README...\n"

#Commit and push the update of the README
git add .
git commit -m "Travis CI - $TRAVIS_BUILD_NUMBER: auto-update the README with the latest versions of craftbukkit"

git remote set-url origin https://${GIT_TOKEN}@github.com/chimanos/minecraft-bukkit-dockerfile.git

git push origin master

echo -e "-> End of the script\n"
