#!/bin/bash

set -e  # Encerra o script em caso de erro
clear

# Verificar se git está instalado
if ! command -v git &> /dev/null; then
    echo "Git não está instalado. Deseja instalar? (s/n)"
    read -r resposta
    if [[ "$resposta" == "s" || "$resposta" == "S" ]]; then
        sudo apt update
        sudo apt install -y git
    else
        echo "Git é necessário para continuar. Saindo..."
        exit 1
    fi
fi

echo "Atualizando dependências do sistema..."
sudo apt update && sudo apt upgrade -y
clear

# Função para instalar Node.js da fonte oficial
instalar_node() {
    echo "Instalando Node.js e NPM..."

    sudo apt remove -y nodejs npm || true

    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs

    echo "Versões instaladas:"
    node -v
    npm -v

    echo "Instalando pacotes globais com npm..."
    sudo npm install -g pm2 express-generator ejs nodemon

    echo "Criando projeto Express..."
    mkdir -p ~/projeto-node
    cd ~/projeto-node || exit
    express --view=ejs --css=stylus --git

    echo "Instalando dependências do projeto..."
    npm install

    echo "Projeto criado em ~/projeto-node"
}

# Função para instalar o CasaOS
instalar_casaos() {
    echo "Instalando CasaOS via script oficial..."
    curl -fsSL https://get.casaos.io | sudo bash
}

# Função para configurar IP Estático
configurar_ip_estatico() {
    echo "Clonando repositório InstallServer..."
    cd ~ || exit
    git clone https://github.com/SardinhaCN/InstallServer.git

    echo "Aplicando configuração de IP estático..."
    sudo mv -i ~/InstallServer/50-cloud-init.yaml /etc/netplan/
    sudo netplan apply

    echo "IP Estático configurado com sucesso!"
}

# Menu simples (sem loop)
echo "======================================"
echo "        MENU DE APLICAÇÕES"
echo "======================================"
echo "1) Preparar ambiente Node.js"
echo "2) Instalar o CasaOS"
echo "3) Configurar IP Estático"
echo "0) Sair"
echo "======================================"
read -rp "Escolha uma opção: " opcao

case $opcao in
    1)
        clear
        instalar_node
        ;;
    2)
        clear
        instalar_casaos
        ;;
    3)
        clear
        configurar_ip_estatico
        ;;
    0)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida! Saindo..."
        exit 1
        ;;
esac
