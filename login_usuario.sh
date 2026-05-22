#!/bin/bash

# ------------------------------------------------------------------------------
# login_usuario.sh
# ------------------------------------------------------------------------------

ARQUIVO="usuarios.db"
read -p "Login: " USU_LOGIN
read -sp "Senha: " SENHA_LOGIN
echo -e "\n"
HASH_GUARDADO=$(grep "^${USU_LOGIN}:" "$ARQUIVO" | cut -d':' -f2)
if [ -z "$HASH_GUARDADO" ]; then
    echo "Acesso negado: Usuário não encontrado."
    exit 1
fi
HASH_TENTATIVA=$(echo "$SENHA_LOGIN" | openssl dgst -sha256 | awk '{print $2}')
if [ "$HASH_TENTATIVA" == "$HASH_GUARDADO" ]; then
    echo "Bem-vindo, $USU_LOGIN! Acesso concedido."
else
    echo "Acesso negado: Senha incorreta."
    exit 1
fi
