# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc07.sh
# Doel:    Installatiebestand voor Ubuntu18.04 LST desktop op pc07
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ------------------------------------------------------------------------------
# Versie:   03.00.00    2018-11-11  Hernoemd (install -> instal)
# ##############################################################################
# REL_NUM=03.10.01
# REL_DAT=2020-04-16
# REL_MSG='TLP gewijzigd'

#1 Vervang Firefox door Chrome en Thunderbird door Gmail
sudo apt-get remove --purge --yes firefox* thunderbird*
sudo apt-get install --yes gnome-contacts gnome-gmail

#@bluefish
#1 Bluefish web en programmeurs-editor
sudo apt-get install --yes bluefish
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove bluefish

#@gedit
#1 Gedit teksteditor
sudo apt-get install --yes gedit gedit-plugins
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove gedit gedit-plugins

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

#@terminator
#1 Terminator meerdere GNOME terminals in één venster
sudo apt-get install --yes terminator
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove terminator

#@tlp
#@tlp
#1 TLP laptop energiebesparende instellingen
sudo apt-get install --yes tlp
## Nodig voor Lenovo ThinkPad X220:
if [[ $HOSTNAME = 'pc07' ]]; then sudo apt-get install --yes tp-smapi-dkms acpi-call-dkms; fi
#2 Check status:
#2 Start Terminalvenster en voer uit:
#2    sudo tlp-stat --battery
#2 Mogelijk extra te installeren, zie uitvoer tlp-stat:
#2    sudo apt-get install --yes tp-smapi-dkms acpi-call-dkms
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove tlp tp-smapi-dkms acpi-call-dkms

#@vim
#1 Vi IMproved verbeterde vi editor
sudo apt-get install --yes vim
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove vim

#1 Gastgebruiker toevoegen
if ! id gast &> /dev/null; then sudo useradd --create-home --shell /bin/bash --comment 'Gast' gast; sudo passwd --delete gast; fi
#3 Start Terminalvenster en voer uit:
#3    sudo userdel --remove gast

# Einde installatiebestand
