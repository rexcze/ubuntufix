#!/bin/bash

# Set the log file name
LOG_FILE="script_output.log"

touch $LOG_FILE
echo "" > $LOG_FILE

# Redirect all output (stdout and stderr) to the log file
exec &> >(tee -a "$LOG_FILE")

# ---------------------------

# Try updating packages and finish update
sudo apt clean || true
sudo apt update || true
sudo apt install --fix-broken -y || true
sudo apt upgrade -y || true

# do the upgrade
sudo apt install ubuntu-release-upgrader-core -y || true
#sudo do-release-upgrade

# ---------------------------
# Upload logs
sudo apt install netcat -y || true
sudo apt install netcat-traditional -y || true
cat $LOG_FILE | nc termbin.com 9999


