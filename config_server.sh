#!/bin/bash
#Atualizar dependencias
sudo apt update
sudo apt upgrade -y

#instalação do nodejs e npm
sudo apt install -y nodejs npm
node -v
npm -v

#Preparando Anbiente Develope!
sudo npm i -g -y pm2 express express-generator ejs nodemon
#Montando o Projeto
mkdir projeto
ls -d
cd ./projeto
sudo express --ejs --view=ejs --css=stylus --git

cd ..

curl -fsSL https://get.casaos.io | sudo bash
clear
mv ./InstallServer/50-cloud-init.yaml ./etc/netplan/50-cloud-init.yaml
netplan apply
ip a | grep 192
