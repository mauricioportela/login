#!/bin/bash

# ------------------------------------------------------------------------------
# cadastro_usuario.sh
# ------------------------------------------------------------------------------

read -p "Usuário: " USUARIO
read -sp "Senha: " SENHA
echo -e "\n"
HASH=$(echo "$SENHA" | openssl dgst -sha256 | awk '{print $2}')
echo "$USUARIO:$HASH" >> usuarios.db
echo "Usuário $USUARIO cadastrado com sucesso!"
