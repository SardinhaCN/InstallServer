#!/bin/bash
clear
echo "Atualizando dependências do sistema..."
sudo apt update && sudo apt upgrade -y
clear

# Função para exibir o menu
mostrar_menu() {
    echo "======================================"
    echo "        MENU DE APLICAÇÕES"
    echo "======================================"
    echo "1) Preparar ambiente Node.js"
    echo "2) Instalar o CasaOS"
    echo "3) Configurar IP Estático"
    echo "0) Sair"
    echo "======================================"
}

# Mostrar menu
mostrar_menu
read -rp "Escolha uma opção: " opcao

# Executar ação de acordo com a opção
case $opcao in
    1)
        clear
        echo "Instalando Node.js e NPM..."
        sudo apt install -y nodejs npm

        echo "Versões instaladas:"
        node -v
        npm -v

        echo "Instalando pacotes globais com npm..."
        sudo npm install -g pm2 express express-generator ejs nodemon

        echo "Criando projeto Express..."
        mkdir -p ~/projeto-node
        cd ~/projeto-node || exit
        express --view=ejs --css=stylus --git

        echo "Projeto criado em ~/projeto-node"
        ;;
    2)
        clear
        echo "Instalando CasaOS via script oficial..."
        curl -fsSL https://get.casaos.io | sudo bash
        ;;
    3)
        clear
        echo "Clonando repositório InstallServer..."
        cd ~ || exit
        git clone https://github.com/SardinhaCN/InstallServer.git

        echo "Aplicando configuração de IP estático..."
        sudo mv -i ~/InstallServer/50-cloud-init.yaml /etc/netplan/
        sudo netplan apply

        echo "IP Estático configurado com sucesso!"
        ;;
    0)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida! Tente novamente."
        ;;
esac
