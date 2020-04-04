#!/bin/bash

#Define URL of craftbukkit versions list TODO: ERROR GESTION
craftbukkit_versions_url="https://getbukkit.org/download/craftbukkit"

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

    echo "Version $version add in the file"
done < tmp_raw_list_urls
