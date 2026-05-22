#!/bin/bash

# ------------------------------------------------------------------------------
# cadastro_usuario_com_salt.sh
# ------------------------------------------------------------------------------

read -p "Novo Usuário: " USUARIO
read -sp "Nova Senha: " SENHA
echo -e "\n"
SALT=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 8)
HASH=$(echo "${SENHA}${SALT}" | openssl dgst -sha256 | awk '{print $2}')
echo "${USUARIO}:${SALT}:${HASH}" >> usuarios_pro.txt
echo "Usuário cadastrado com Salt: $SALT"
