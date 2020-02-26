#!/bin/bash

if [ -f ../functions.sh ]; then
    . ../functions.sh

elif [ -f ~/Scripts/functions.sh ]; then
    . ~/Scripts/functions.sh;

elif [ -f ~/Scripts/apps/functions.sh ]; then
    . ~/Scripts/apps/functions.sh;
fi

echo "";
echo "WARNING: Google adds proprietary code to Chrome that may contain privacy-violating \"features\" such as usage behavior tracking and other telemetry data."
echo "Google Chrome is based on the open-source project Chromium and the two are nearly identical except that Google adds non-open code on top."
echo "";
echo "While on Windows Chromium doesn't provide an auto-update service, on Linux you don't have to worry as you will get updates automatically through your package manager.";
echo "";
echo "If you value your privacy, it is highly recommended to install and use Chromium instead.";
echo "";
read -rsp $'Press enter to continue installing chrome or Ctrl+C to abort ...\n';

# add key
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -;

# add repo
addCustomSource google-chrome "deb http://dl.google.com/linux/chrome/deb/ stable main";

# update local apt cache
sudo apt update 2>&1 >/dev/null;

# install package
sudo apt install -y google-chrome-stable;
