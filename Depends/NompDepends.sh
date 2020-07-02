  
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
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y
sudo apt update && apt install build-essential checkinstall zlib1g-dev libtemplate-perl -y
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

#Start installing programs for nomp
sudo apt-get install python g++ make -y
sudo apt-get install libdb5.3++-dev -y
sudo apt-get update -y
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt-get install nodejs-legacy -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
bash install_nvm.sh
apt install nvm v0.10.36
nvm ls-remote
nvm install 0.10.36
sudo apt-get install build-essential -y

#Install Redis
cd
cd /usr/src
wget -c http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make & make install -y
cd utils
bash install_server.sh

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

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}$0 must be run as root.${NC}"
   exit 1
fi




clear