#!/bin/bash
mkdir /jarvis-temp

# First, get the zip file
#git clone https://github.com/andrelago13/jarvis.git /jarvis-temp
sudo ssh-agent bash -c 'git clone git@github.com:andrelago13/jarvis.git /jarvis-temp'

# Second, unzip it, if the zip file exists
if [ -d /jarvis-temp ]; then
    #Bring docker down
    (cd /jarvis && docker-compose down)
    (cd /jarvis && docker-compose rm)

    # Delete previous dir
    rm -rf /jarvis
    mkdir /jarvis

    # Rename project directory to desired name
    mv -f /jarvis-temp/* /jarvis

    #Restart docker
    (cd /jarvis && docker-compose up --build -d)

    #Remove temp dir
    rm -rf /jarvis-temp

    # Delete current directory
    # rm -rf /www/website-enei/app

    # Replace with new files
   #cp -rf /www/website-enei/temp-zip/app /www/website-enei/app

    #(cd /www/website-enei/app/app && npm install && pm2 reload app)

    # Delete unziped files
    #rm -rf /www/website-enei/temp-zip/website-master


    # Perhaps call any other scripts you need to rebuild assets here
    # or set owner/permissions
    # or confirm that the old site was replaced correctly
fi
