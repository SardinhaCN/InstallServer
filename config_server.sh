#!/bin/bash
echo "Atualizar dependencias"
sudo apt update
sudo apt upgrade -y

clear
echo "Clonando repositorio 'InstallServer'"
cd ..
cd ..
git clone https://github.com/SardinhaCN/InstallServer.git

clear

echo "instalação do nodejs e npm"
sudo apt install -y nodejs npm
node -v
npm -v

clear

echo "Preparando Anbiente Develope!"
sudo npm i -g -y pm2 express express-generator ejs nodemon
echo "Montando o Projeto"
mkdir projeto
ls -d
cd ./projeto
sudo express --ejs --view=ejs --css=stylus --git
cd ..

clear
echo "Instalando CasaOS!"
curl -fsSL https://get.casaos.io | sudo bash

clear
echo "Configurando IP Static"
mv -i /InstallServer/50-cloud-init.yaml /etc/netplan/
netplan apply
