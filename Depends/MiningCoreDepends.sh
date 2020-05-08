#!/bin/bash
# Copyright (c) 2019 - 2020 Node_Install. Released under the MIT License.

# .-----------------. .----------------.  .----------------.  .----------------.                                                             
#| .--------------. || .--------------. || .--------------. || .--------------. |                                                            
#| | ____  _____  | || |     ____     | || |  ________    | || |  _________   | |                                                            
#| ||_   \|_   _| | || |   .'    `.   | || | |_   ___ `.  | || | |_   ___  |  | |                                                            
#| |  |   \ | |   | || |  /  .--.  \  | || |   | |   `. \ | || |   | |_  \_|  | |                                                            
#| |  | |\ \| |   | || |  | |    | |  | || |   | |    | | | || |   |  _|  _   | |                                                            
#| | _| |_\   |_  | || |  \  `--'  /  | || |  _| |___.' / | || |  _| |___/ |  | |                                                            
#| ||_____|\____| | || |   `.____.'   | || | |________.'  | || | |_________|  | |                                                            
#| |              | || |              | || |              | || |              | |                                                            
#| '--------------' || '--------------' || '--------------' || '--------------' |                                                            
# '----------------'  '----------------'  '----------------'  '----------------'                                                             
# .----------------.  .-----------------. .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
#| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
#| |     _____    | || | ____  _____  | || |    _______   | || |  _________   | || |      __      | || |   _____      | || |   _____      | |
#| |    |_   _|   | || ||_   \|_   _| | || |   /  ___  |  | || | |  _   _  |  | || |     /  \     | || |  |_   _|     | || |  |_   _|     | |
#| |      | |     | || |  |   \ | |   | || |  |  (__ \_|  | || | |_/ | | \_|  | || |    / /\ \    | || |    | |       | || |    | |       | |
#| |      | |     | || |  | |\ \| |   | || |   '.___`-.   | || |     | |      | || |   / ____ \   | || |    | |   _   | || |    | |   _   | |
#| |     _| |_    | || | _| |_\   |_  | || |  |`\____) |  | || |    _| |_     | || | _/ /    \ \_ | || |   _| |__/ |  | || |   _| |__/ |  | |
#| |    |_____|   | || ||_____|\____| | || |  |_______.'  | || |   |_____|    | || ||____|  |____|| || |  |________|  | || |  |________|  | |
#| |              | || |              | || |              | || |              | || |              | || |              | || |              | |
#| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
# '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 


echo Starting the install process.
echo Checking and installing VPS server prerequisites. Please wait.

sudo apt update -y
sudo apt upgrade -y
sudo apt install build-essential libtool autotools-dev automake pkg-config bsdmainutils curl git -y
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y
sudo apt update && apt install build-essential checkinstall zlib1g-dev libtemplate-perl -y
sudo apt-get install libqt4-dev libprotobuf-dev protobuf-compiler -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update -y
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y
sudo apt-get install libzmq3-dev -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install libgmp3-dev libevent-dev bsdmainutils libboost-all-dev openssl -y
sudo apt-get install libssl1.0-dev -y
sudo apt-get install -y autoconf g++ make openssl libssl-dev libcurl4-openssl-dev -y
sudo apt-get install -y libcurl4-openssl-dev pkg-config -y
sudo apt-get install -y libsasl2-dev -y


#Start installing ASP.NET Core runtime and .NET Core runtime
sudo wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb -y
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install dotnet-sdk-3.1 -y

#Install the ASP.NET Core runtime
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install aspnetcore-runtime-3.1 -y

#Install the .NET Core runtime
sudo add-apt-repository universe -y
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install dotnet-runtime-3.1 -y

#Install Apache2
sudo apt install apache2 -y

#Install Fail2ban and UFW
sudo aptitude -y install fail2ban
sudo apt-get install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw --force enable  

#Installing PostgreSQL
sudo apt update -y
sudo apt install postgresql postgresql-contrib -y
sudo -u postgres psql << EOF
CREATE DATABASE miningcore;
create user miningcore with encrypted password 'miningcore';
ALTER ROLE miningcore REPLICATION;
ALTER ROLE miningcore Superuser;
ALTER ROLE miningcore Create role;
ALTER ROLE miningcore Create DB;
ALTER ROLE miningcore Bypass RLS;
EOF
sudo wget https://raw.githubusercontent.com/coinfoundry/miningcore/master/src/Miningcore/Persistence/Postgres/Scripts/createdb.sql
sudo -u postgres psql miningcore < 'createdb.sql'

#Create the pool account
echo Now lets create our user and not use the root account.
sudo adduser pool
echo Please input your pool users password you wish to use.
sudo psswd pool
usermod -aG sudo pool

#Install Screen
apt install screen 
clear

echo -e "Checking if swap space is needed."
PHYMEM=$(free -g|awk '/^Mem:/{print $2}')
SWAP=$(swapon -s)
if [[ "$PHYMEM" -lt "2" && -z "$SWAP" ]];
  then
    echo -e "${GREEN}Server is running with less than 2G of RAM, creating 2G swap file.${NC}"
    dd if=/dev/zero of=/swapfile bs=1024 count=2M
    chmod 600 /swapfile
    mkswap /swapfile
    swapon -a /swapfile
else
  echo -e "${GREEN}The server running with at least 2G of RAM, or SWAP exists.${NC}"
fi
if [[ $(lsb_release -d) != *16.04* || != *18.04*]]; then
  echo -e "${RED}You are not running Ubuntu 16.04 or 18.04. Installation is cancelled.${NC}"
  exit 1
fi

clear