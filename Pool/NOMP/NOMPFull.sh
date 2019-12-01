#!/bin/bash
# Copyright (c) 2019 Node_Install. Released under the MIT License.

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


# Install guide https://medium.com/forbole/a-step-by-step-guide-to-join-cosmos-hub-testnet-e591a3d2cb41

###############
# Colors Keys #
###############
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

############################
# Bring in the coins specs #
############################
source ./specs.sh

    read -e -p "Install Fail2ban? [Y/n] : " install_fail2ban
    read -e -p "Install UFW and configure ports? [Y/n] : " UFW


	###################
	# Install Depends #
	###################
	cd
	cd $DEPENDS_PATH
	bash NompDepends.sh
	clear
	echo NOMP depends installed.

	#######################
	# Install Nomp Portal #
	#######################
    # Installing Nope Portal

	cd
	git clone $NOMP

	#######################
	# Install Pool Portal #
	#######################
    # Installing Pool Portal

	cd
	git clone $POOL

	######################
	# Install Fail 2 Ban #
	######################
    # Installing Fail2Ban & UFW
    output " "
    output "Some optional installs (Fail2Ban & UFW)"
    output " "
    sleep 3
    
    
    if [[ ("$install_fail2ban" == "y" || "$install_fail2ban" == "Y" || "$install_fail2ban" == "") ]]; then
    sudo aptitude -y install fail2ban
    fi
    if [[ ("$UFW" == "y" || "$UFW" == "Y" || "$UFW" == "") ]]; then
    sudo apt-get install ufw
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow https
    sudo ufw allow 3333/tcp
    sudo ufw allow 3339/tcp
    sudo ufw allow 3334/tcp
    sudo ufw allow 3433/tcp
    sudo ufw allow 3555/tcp
    sudo ufw allow 3556/tcp
    sudo ufw allow 3573/tcp
    sudo ufw allow 3535/tcp
    sudo ufw allow 3533/tcp
    sudo ufw allow 3553/tcp
    sudo ufw allow 3633/tcp
    sudo ufw allow 3733/tcp
    sudo ufw allow 3636/tcp
    sudo ufw allow 3737/tcp
    sudo ufw allow 3739/tcp
    sudo ufw allow 3747/tcp
    sudo ufw allow 3833/tcp
    sudo ufw allow 3933/tcp
    sudo ufw allow 4033/tcp
    sudo ufw allow 4133/tcp
    sudo ufw allow 4233/tcp
    sudo ufw allow 4234/tcp
    sudo ufw allow 4333/tcp
    sudo ufw allow 4433/tcp
    sudo ufw allow 4533/tcp
    sudo ufw allow 4553/tcp
    sudo ufw allow 4633/tcp
    sudo ufw allow 4733/tcp
    sudo ufw allow 4833/tcp
    sudo ufw allow 4933/tcp
    sudo ufw allow 5033/tcp
    sudo ufw allow 5133/tcp
    sudo ufw allow 5233/tcp
    sudo ufw allow 5333/tcp
    sudo ufw allow 5433/tcp
    sudo ufw allow 5533/tcp
    sudo ufw allow 5733/tcp
    sudo ufw allow 5743/tcp
    sudo ufw allow 3252/tcp
    sudo ufw allow 5755/tcp
    sudo ufw allow 5766/tcp
    sudo ufw allow 5833/tcp
    sudo ufw allow 5933/tcp
    sudo ufw allow 6033/tcp
    sudo ufw allow 5034/tcp
    sudo ufw allow 6133/tcp
    sudo ufw allow 6233/tcp
    sudo ufw allow 6333/tcp
    sudo ufw allow 6433/tcp
    sudo ufw allow 7433/tcp
    sudo ufw allow 8333/tcp
    sudo ufw allow 8463/tcp
    sudo ufw allow 8433/tcp
    sudo ufw allow 8533/tcp
    sudo ufw --force enable    
    fi

##########################
# Head back to selection #
##########################
cd 
bash Node_Install/Scripts/OS/Ubuntu-Debian/install.sh
  