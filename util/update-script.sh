#!/bin/bash
mkdir /jarvis-temp

# First, get the zip file
cd /jarvis-temp && wget -O projectmaster.zip -q https://github.com/andrelago13/jarvis.git

# Second, unzip it, if the zip file exists
if [ -f /jarvis-temp/projectmaster.zip ]; then
    # Unzip the zip file
    unzip -q /jarvis-temp/projectmaster.zip

    # Delete zip file
    rm /jarvis-temp/projectmaster.zip

    # Delete previous dir
    rm -rf /jarvis

    # Rename project directory to desired name
    mv -f website-master app

    # Delete current directory
    rm -rf /www/website-enei/app

    # Replace with new files
    cp -rf /www/website-enei/temp-zip/app /www/website-enei/app

    (cd /www/website-enei/app/app && npm install && pm2 reload app)

    # Delete unziped files
    rm -rf /www/website-enei/temp-zip/website-master


    # Perhaps call any other scripts you need to rebuild assets here
    # or set owner/permissions
    # or confirm that the old site was replaced correctly
fi
