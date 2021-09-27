# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc04.sh
# Doel:    Installatiebestand voor Ubuntu 18.04 LTS desktop op pc04
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=03.04.01
# REL_DAT=2020-04-22
# REL_MSG='Installatie Google Earth en Wine gewijzigd'

#@calibre
#1 Calibre e-boek bibliotheekbeheer
sudo apt-get install --yes calibre
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove calibre

#@dropbox
#1 Dropbox bestanden synchroniseren via het web
sudo apt-get install --yes nautilus-dropbox
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove nautilus-dropbox

#@google-earth
#1 Google Earth Pro verken de planeet
## Maakt zelf /etc/apt/sources.list.d/google-earth-pro.list aan, tenzij eerder
## zelf aangemaakt, dan /etc/default/google-earth-pro:repo_add_once="false".
wget --output-document=/tmp/google-earth-pro-stable_current_amd64.deb 'https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb'
sudo apt-get install --yes /tmp/google-earth-pro-stable_current_amd64.deb
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove google-earth-pro-stable

#@wine
#1 Wine Windows-apps op Linux
sudo apt-get install --yes wine winetricks playonlinux
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove wine winetricks playonlinux

# Einde installatiebestand
