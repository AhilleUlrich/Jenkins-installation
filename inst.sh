#!/bin/bash
sudo chmod +x *.sh
./Docker-script.sh
sleep 5
./Docker-compose-script.sh
sleep 5
./Jenkins-scritp.sh
#
echo "--------------------- YOU CAN USE JENKINS ------------------------"
