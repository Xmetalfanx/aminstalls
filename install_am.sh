#!/bin/bash

echo "Downloading am"
wget -q https://raw.githubusercontent.com/ivan-hc/AM/main/AM-INSTALLER

echo "Setting script to be executable"
chmod a+x ./AM-INSTALLER

echo "Running installer"
./AM-INSTALLER

echo "Opening Config file - type desired location of installed apps"
micro ~/.config/appman/appman-config