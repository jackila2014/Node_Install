#!/bin/bash
# Copyright (c) 2019 Node_Install. Released under the MIT License.

########################################################################################################
# COPY THIS FILE AND CHANGE ONLY THE SPECS BELOW FOR YOUR COIN                                         #
# Must use exact repo name: Example github https://github.com/altbet/abet Example repo name: altbet    #
########################################################################################################

RPC_PORT=11116
COIN_PORT=11115
COIN_NAME='Beacon Crypto'
REPO_NAME='beacon'
COIN_DAEMON='beacond'
COIN_CLI='beacon-cli'
COIN_QT='beacon-qt'
GITHUB=https://github.com/beaconcrypto/beacon

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