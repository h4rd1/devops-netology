#!/bin/bash


echo "Installing Prerequisites for Docker"

sudo apt-get update && apt-get install apt-transport-https ca-certificates curl software-properties-common -y

sudo apt-get install gnupg lsb-release -y

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adding APT Lists"

echo \

 "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \

 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo ## Update and Install

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo apt-get upgrade -y

pause 2

echo # install docker-compose

sudo systemctl status docker containerd

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo # Restart docker.

sudo systemctl daemon-reload

sudo systemctl restart docker

sudo systemctl is-enabled docker

sudo systemctl is-enabled containerd

echo #docker installed and running
