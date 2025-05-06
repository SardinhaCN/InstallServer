#!/bin/bash
clear
echo "Atualizar dependencias"
sudo apt update
sudo apt upgrade -y

# Função para exibir o menu
mostrar_menu() {
    echo "===== MENU DE APP ====="
    echo "1) Preparando Anbiente Develope NodeJS!"
    echo "2) Instalar o CasaOS!"
    echo "3) Teste de velocidade da internet (speedtest-cli)"
    echo "4) S-Tui - Monitor de CPU gráfico via terminal"
    echo "0) Sair"
    echo "==========================="
}

# Mostra o menu uma vez
mostrar_menu
read -p "Escolha uma opção: " opcao

# Executa a opção selecionada
case $opcao in
    2)
        clear
        echo "instalação do nodejs e npm"
        cd ..
        cd ..
        sudo apt install -y nodejs npm
        node -v
        npm -v
        echo "Preparando Anbiente Develope!"
        sudo npm i -g -y pm2 express express-generator ejs nodemon
        echo "Montando o Projeto"
        mkdir projeto
        ls -d
        cd ./projeto
        sudo express --ejs --view=ejs --css=stylus --git
        cd ..
      ;;
    3)
        clear
        echo "Instalando CasaOS!"
        curl -fsSL https://get.casaos.io | sudo bash
      ;;
    3)
        clear
        echo "Clonando repositorio 'InstallServer'"
        cd ..
        cd ..
        git clone https://github.com/SardinhaCN/InstallServer.git
        clear
        echo "Configurando IP Static"
        mv -i /InstallServer/50-cloud-init.yaml /etc/netplan/
        netplan apply
      ;;
    
    *)
        echo "Opção inválida! Tente novamente."
        ;;
esac
