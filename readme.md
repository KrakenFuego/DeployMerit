# DeployMerit

This script allows near "One Click" deployment of the Merit (command line) Miner. [On Debian Like OSes] It will also create an autostart on boot service.

It builds a full from source copy of the miner.

# Requirements

Known Working on Ubuntu 16.04 & Ubuntu 18.04
Should work on any Debian Like OS with Bash Version >4.4

# Usage

Download the Script
```sh
wget https://raw.githubusercontent.com/KrakenFuego/DeployMerit/master/deployMerit.sh
```

Give the script execution Permissions
```sh
chmod +x deployMerit.sh
```

Run the Script
```sh
./deployMerit.sh
```

Follow the Instructions, you may get a grub prompt - if so either continue without installing grub or setup to your requirements.

# Changing the Miner Parameters

If you want to change any miner parameters, like address, cores/threads (add -t X -C X) - You can find them in /opt/merit-miner/merit-cpu.sh
Once changed run

```
sudo service merit-cpu restart
```

and the miner should restart in the background with the changed parameters.

# Donations

If you found this setup script useful feel free to send me a donation.

ETH: 0x6CF0110b2538DbE929AD4472FcF13b8cf5640A20

MRT: @Fuego

XMR: 88N6LKb2YYbPFSB1C6RSCo3TjFqRe2DuoAbemNvKFjpc7kXUrxFGorFSBAan73RuqLHvZicXNx7SfJY3n49bcaqkRceLpck

# License
MIT License

