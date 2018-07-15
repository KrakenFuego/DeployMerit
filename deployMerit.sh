# Merit Miner AutoDeployment Script by @KrakenFuego
# Released Under MIT License
# Version 1.0.0

echo "Merit Miner Setup Script by @KrakenFuego 
	This Script should be run as a root/sudo user"
	
echo "Checking System is Up To Date..."

# Update the System
sudo apt update
sudo apt upgrade -y
	
deployType="CPU"
read -e -i $deployType -p "What type of miner would you like to deploy?: [CPU/None]" deploy
deploy=${deploy:-CPU}

if [ "$deploy" = "CPU" ]; then

	echo "Deploying CPU Miner....
		Please Wait..."
	
	# Install Merit CPU Miner Deps
	sudo apt install -y build-essential libtool automake autotools-dev libcurl4-openssl-dev libboost-dev git
	
	echo "Merit Miner Setup Script by @KrakenFuego 
		This Script should be run as a root/sudo user"

	# Clone the Repo & build the miner
	cd /opt
	git clone https://github.com/meritlabs/merit-miner.git
	cd merit-miner
	./autogen.sh
	./nomacro.pl
	./configure
	make

	# Pull down the start miner script
	wget https://raw.githubusercontent.com/KrakenFuego/DeployMerit/master/merit-cpu.sh
	chmod +x merit-cpu.sh

	# Create a shell that will run on boot
	cd /usr/local/bin
	wget https://raw.githubusercontent.com/KrakenFuego/DeployMerit/master/start-merit-cpu.sh
	sudo chmod +x start-merit-cpu.sh

	# Create the Service
	cd /etc/systemd/system
	wget https://raw.githubusercontent.com/KrakenFuego/DeployMerit/master/merit-cpu.service
	sudo chmod +x merit-cpu.service
	sudo systemctl enable merit-cpu.service
	sudo systemctl daemon-reload
	
	# Capture User Config & Apply
	walletDefault="Fuego"
	read -e -i $walletDefault -p "Enter your Wallet Nick/Address {without @} and press [ENTER]:" wallet
	wallet=${wallet:-Fuego}

	poolDefault="pool.merit.me:3333"
	read -e -i $poolDefault -p "Enter your Wallet Nick/Address {without @} and press [ENTER]:" pool
	pool=${pool:-pool.merit.me:3333}

	sed -i 's/Fuego/'$wallet'/g' /opt/merit-miner/merit-cpu.sh
	sed -i 's/pool.merit.me:3333/'$pool'/g' /opt/merit-miner/merit-cpu.sh
	
elif [ "$deploy" = "GPU" ]; then
        echo "Not Currently Supported"

else
        echo "Failed.... Exiting"

fi

# Clean Up
cd ~
rm -rf deployMerit.sh

echo "Installation Complete... Rebooting"	
		
# Reboot the System		
sudo reboot
