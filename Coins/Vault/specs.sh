#!/bin/bash

########################################################################################################
# COPY THIS FILE AND CHANGE ONLY THE SPECS BELOW FOR YOUR COIN                                         #
# Must use exact repo name: Example github https://github.com/altbet/abet Example repo name: altbet    #
########################################################################################################

RPC_PORT=17174
COIN_PORT=14147
COIN_NAME='Vault'
REPO_NAME='VAULT-Core'
COIN_DAEMON='vaultd'
COIN_CLI='vault-cli'
COIN_QT='vault-qt'
GITHUB=https://github.com/vault-investments/VAULT-Core.git

########################################
# DO NOT CHANGE BELOW STATIC VARIABLES #
########################################

COIN_PATH=/root/.$REPO_NAME
DAEMON=$REPO_NAME/src/$COIN_DAEMON
CLI=$REPO_NAME/src/$COIN_CLI

DEPENDS_PATH="Node_Install/Depends/"
DEPENDS_SCRIPT="install.sh"
EXTIP=`curl -s4 icanhazip.com`
RPCUSER=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
RPCPASSWORD=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)