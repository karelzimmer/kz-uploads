# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc06.sh
# Doel:    Installatiebestand voor Ubuntu 18.04 LTS desktop
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=02.41.00
# REL_DAT=2020-04-27
# REL_MSG='Mlocate toegevoegd'

#1 Vervang Firefox door Chrome en Thunderbird door Gmail
sudo apt-get remove --purge --yes firefox* thunderbird*
sudo apt-get install --yes gnome-contacts gnome-gmail

#1 Check RootKit detecteer bekende rootkits en malware
sudo apt-get install --yes chkrootkit
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove chkrootkit rkhunter

#@backintime
#1 BackInTime back-upprogramma (snapshots)
sudo apt-get install --yes backintime-gnome
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove backintime-gnome

#@bluefish
#1 Bluefish web en programmeurs-editor
sudo apt-get install --yes bluefish
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove bluefish

#@calibre
#1 Calibre e-boek bibliotheekbeheer
sudo apt-get install --yes calibre
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove calibre

#@fakeroot
#1 Fakeroot draai opdracht als superuser voor bestandsmanipulatie
sudo apt-get install --yes fakeroot
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove fakeroot

#@gedit
#1 Gedit teksteditor-plugins
sudo apt-get install --yes gedit-plugins
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove gedit-plugins

#@git
#1 git revisie controle systeem (SCM = source code management)
sudo apt-get install --yes git git-gui
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove git git-gui

#@kvm
#1 KVM virtualisatieprogramma
## Images staan in /var/lib/libvirt/images/.
sudo apt-get install --yes cpu-checker qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove cpu-checker qemu-kvm libvirt-bin
#3    sudo apt remove ubuntu-vm-builder bridge-utils virt-manager
#3    sudo delgroup libvirtd-dnsmasq
#3    sudo deluser $USER libvirtd
#3    sudo delgroup libvirtd

#@lftp
#1 Geavanceerd bestand ontvang en verzend programma
sudo apt-get install --yes lftp
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove lftp

#@locate
#1 Mlocate vind bestanden overal in het bestandssysteem
sudo apt-get install --yes mlocate
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove mlocate

#@meld
#1 Meld grafisch bestanden vergelijken en combineren
sudo apt-get install --yes meld
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove meld

#@nautilus-admin
#1 Nautilus Admin open map of wijzig bestand als admin
sudo apt-get install --yes nautilus-admin
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove nautilus-admin

#@nautilus-hide
#1 Nautilus Hide bestanden en mappen verbergen
sudo apt-get install --yes nautilus-hide
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove nautilus-hide

#@odio
#1 Odio desktop internetradio-speler
sudo snap install odio
#3 Start Terminalvenster en voer uit:
#3    sudo snap remove odio

#@spotify
#1 Spotify online muziekservice
sudo snap install spotify
#3 Start Terminalvenster en voer uit:
#3    sudo snap remove spotify

#@terminator
#1 Terminator meerdere GNOME terminals in één venster
sudo apt-get install --yes terminator
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove terminator

#1 Interne Bluetooth uitschakelen
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="413c", ATTRS{idProduct}=="8187", ATTR{authorized}="0"' | sudo tee /etc/udev/rules.d/81-bluetooth-hci.rules
#reboot
#3 1. Start Terminalvenster en voer uit:
#3    sudo rm /etc/udev/rules.d/81-bluetooth-hci.rules
#3    reboot

# Einde installatiebestand
