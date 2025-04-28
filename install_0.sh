#!/bin/bash
#Atualizar dependencias
apt update
apt upgrade -y

#instalação do nodejs e npm
apt install -y nodejs npm
node -v
npm -v

#Preparando Anbiente Develope!
npm i -g -y pm2 express express-generator ejs nodemon
#Montando o Projeto
mkdir projeto
ls -d
cd ./projeto
express --ejs --view=ejs --css=stylus --git
