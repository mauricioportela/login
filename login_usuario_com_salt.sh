#!/bin/bash

# ------------------------------------------------------------------------------
# login_usuario_com_salt.sh
# ------------------------------------------------------------------------------

read -p "Login: " USU_LOGIN
read -sp "Senha: " SENHA_TENTATIVA
echo -e "\n"
LINHA=$(grep "^${USU_LOGIN}:" usuarios_pro.txt)
if [ -z "$LINHA" ]; then
    echo "Usuário não existe."
    exit 1
fi
SALT_DB=$(echo "$LINHA" | cut -d':' -f2)
HASH_DB=$(echo "$LINHA" | cut -d':' -f3)
HASH_TENTATIVA=$(echo "${SENHA_TENTATIVA}${SALT_DB}" | openssl dgst -sha256 | awk '{print $2}')
if [ "$HASH_TENTATIVA" == "$HASH_DB" ]; then
    echo "Acesso Autorizado!"
else
    echo "Senha Incorreta!"
fi
