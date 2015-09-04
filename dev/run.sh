#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NO_COLOR='\033[0m'

cd /var/www/APP_NAME

# Checks whether NPM dependencies are already installed then installs if is the case
NPM_FOLDER="srci"
if [ -d "$NPM_FOLDER" ]
then
    printf "${YELLOW}NPM dependencies already installed!${NO_COLOR}\n"
else
    printf "${YELLOW}Installing NPM dependencies...${NO_COLOR}\n"

    npm install gulp -g
    npm install browserify -g
    npm install

    printf "${GREEN}NPM dependencies successfully installed!${NO_COLOR}\n"
fi

printf "${GREEN}Container successfully started!${NO_COLOR}\n"

printf "${YELLOW}Press [CTRL + C] to stop...${NO_COLOR}\n"
while [ 1 ]; do tail -f /dev/null; test $? -gt 128 && break; done