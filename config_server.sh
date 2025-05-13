#!/bin/bash
clear
echo "Atualizando dependências..."
sudo apt update
sudo apt upgrade -y
clear

# Função para exibir o menu
mostrar_menu() {
    echo "===== MENU DE APP ====="
    echo "1) Preparar Ambiente NodeJS"
    echo "2) Instalar CasaOS"
    echo "3) Configurar IP Estático"
    echo "0) Sair"
    echo "========================="
}

# Mostrar menu
mostrar_menu
read -p "Escolha uma opção: " opcao

# Executar opção
case $opcao in
    1)
        clear
        echo "Instalando NodeJS e NPM..."
        sudo apt install -y nodejs npm

        echo "Versões instaladas:"
        node -v
        npm -v

        echo "Instalando pacotes globais..."
        sudo npm install -g pm2 express express-generator ejs nodemon

        echo "Criando projeto..."
        mkdir -p ~/projeto
        cd ~/projeto || exit
        express --view=ejs --css=stylus --git
        echo "Projeto criado em ~/projeto"
        ;;
    2)
        clear
        echo "Instalando CasaOS..."
        curl -fsSL https://get.casaos.io | sudo bash
        ;;
    3)
        clear
        echo "Clonando repositório InstallServer..."
        cd ~ || exit
        git clone https://github.com/SardinhaCN/InstallServer.git

        echo "Configurando IP Estático..."
        sudo mv -i ~/InstallServer/50-cloud-init.yaml /etc/netplan/
        sudo netplan apply
        ;;
    0)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida! Tente novamente."
        ;;
esac
