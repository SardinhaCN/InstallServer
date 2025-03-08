#!/bin/bash
#Atualizar dependencias
sudo apt update
sudo apt upgrade -y

#instalação do nodejs e npm
sudo install -y nodejs npm
Versão nodejs:
node -v
Versão npm:
npm -v

#Preparando Anbiente Develope!
npm i -y -g pm2 express express-generator ejs nodemon

#Montando o Projeto
mkdir projeto
cd ./projeto
express --ejs --view=ejs --css=stylus --git
