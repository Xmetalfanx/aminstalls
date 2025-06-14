#!/bin/bash

amconfigdir=/home/$USER/.config/appman/

echo "Downloading am"
#wget -q https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER
sleep 2

echo "Setting script to be executable"
chmod a+x ./AM-INSTALLER

echo "Running installer"
sleep 2
./AM-INSTALLER

echo "Creating am config location"
mkdir $amconfigdir


echo "Opening Config file - type desired location of installed apps"
micro ~/.config/appman/appman-config

# removes installer
rm AM-INSTALLER