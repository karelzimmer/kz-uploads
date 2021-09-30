# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc01.sh
# Doel:    Installatiebestand voor Ubuntu 18.04 LTS desktop op pc01
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=03.11.01
# REL_DAT=2020-03-27
# REL_MSG='Teksten gewijzigd'

#1 Vervang Firefox door Chrome en Thunderbird door Gmail
sudo apt-get remove --purge --yes firefox* thunderbird*
sudo apt-get install --yes gnome-contacts gnome-gmail

#@clamav
#1 ClamAV antivirus
sudo apt-get install --yes clamtk
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove clamtk

#@gparted
#1 GParted partitiebewerker
sudo apt-get install --yes gparted
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove gparted

#@openssh
#1 OpenSSH secure shell-connectiviteitsprogramma
sudo apt-get install --yes ssh
sudo sed --in-place --expression='s/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
grep --quiet --regexp='PermitRootLogin no' /etc/ssh/sshd_config
sudo systemctl restart ssh.service
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove ssh

#@spotify
#1 Spotify online muziekservice
sudo snap install spotify
#3 Start Terminalvenster en voer uit:
#3    sudo snap remove spotify

#1 Gastgebruiker toevoegen
if ! id gast &> /dev/null; then sudo useradd --create-home --shell /bin/bash --comment 'Gast' gast; sudo passwd --delete gast; fi
#3 Start Terminalvenster en voer uit:
#3    sudo userdel --remove gast

#1 Systeemgebruiker toevoegen
## Voor toegang op afstand/systeembeheer.
if ! id karel &> /dev/null; then sudo useradd --create-home --shell /bin/bash --comment 'Karel Zimmer (systeemgebruiker)' --groups sudo karel; fi
#3 Start Terminalvenster en voer uit:
#3    sudo userdel --remove karel

#1 Interne Bluetooth uitschakelen
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="03f3", ATTRS{idProduct}=="231d", ATTR{authorized}="0"' | sudo tee /etc/udev/rules.d/81-bluetooth-hci.rules
#reboot
#3 1. Start Terminalvenster en voer uit:
#3    sudo rm /etc/udev/rules.d/81-bluetooth-hci.rules
#3    reboot

# Einde installatiebestand
