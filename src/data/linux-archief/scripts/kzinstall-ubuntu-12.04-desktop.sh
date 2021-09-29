# shellcheck shell=bash
###############################################################################
# Installatiebestand voor Ubuntu 12.04 LTS desktop.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# Auteursrecht (c) 2020-2021 Karel Zimmer.
# GNU Algemene Publieke Licentie <https://www.gnu.org/licenses/gpl.html>.
#
# RelNum=06.17.02
# RelDat=2021-05-03
###############################################################################

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

## Als 1e uitvoeren! ##
#1 apport-disablen
#2 Crashrapporten stoppen "installeren"
sudo service apport stop || true
sudo rm --force /var/crash/*
sudo sed --in-place --expression='s/enabled=1/enabled=0/' /etc/default/apport
#4
#4 Start Terminalvenster en voer uit:
#4    sudo sed --in-place --expression='s/enabled=0/enabled=1/' /etc/default/apport
#4    sudo systemctl enable --now apport.service
## Als 1e uitvoeren! ##


#1 bitwarden
#2 Bitwarden installeren
:
#3
#3  1. Start Firefox webbrowser.
#3  2. Ga naar https://bitwarden.com/
#3  3. Klik op Download.
#3  4. Klik op Linux.
#3  5. Open Bestanden.
#3  6. Ga naar de map Downloads.
#3  7. Rechtsklik op Bitwarden-....AppImage en kies Eigenschappen.
#3  8. Klik op Rechten (tab).
#3  9. Achter Uitvoeren vink aan Uitvoeren van bestand toestaan.
#3 10. Sluit scherm Eigenschappen van Bitwarden-....AppImage.
#3 11. Dubbelklik op Bitwarden-....AppImage.
#3 12. Volg de aanwijzingen op het scherm.
#4
#4  1. Open Bestanden.
#4  2. Ga naar de map Downloads.
#4  3. Verwijder Bitwarden-....AppImage.


#1 icaclient
#2 Citrix Workspace app installeren
## Citrix Receiver, ICA Client
wget --output-document=/tmp/icaclient-LATEST 'https://karelzimmer.nl/apps/icaclient/LATEST'
wget --output-document=/tmp/icaclient.deb "https://karelzimmer.nl/apps/icaclient/icaclientWeb_$(cat /tmp/icaclient-LATEST)_amd64.deb"
sudo DEBIAN_FRONTEND=noninteractive dpkg --install /tmp/icaclient.deb || sudo apt-get --fix-broken --yes install
sudo ln --symbolic --force /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts
rm /tmp/icaclient-LATEST /tmp/icaclient.deb
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes icaclient


#1 google-chrome
#2 Google Chrome installeren
## Maakt zelf /etc/apt/sources.list.d/google-chrome.list aan, tenzij eerder
## zelf aangemaakt, dan /etc/default/google-chrome:repo_add_once="false".
wget --output-document=/tmp/google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
sudo dpkg --install /tmp/google-chrome.deb || sudo apt-get --fix-broken --yes install
rm /tmp/google-chrome.deb
sudo apt-get install --yes gnome-contacts gnome-gmail
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes google-chrome-stable gnome-contacts gnome-gmail


#1 libreoffice
#2 LibreOffice installeren
sudo apt-get install --yes libreoffice libreoffice-help-nl libreoffice-l10n-nl
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes libreoffice libreoffice-help-nl libreoffice-l10n-nl


#1 private-home
#2 Veilige persoonlijke mappen "installeren"
## https://ubuntu.com//blog/private-home-directories-for-ubuntu-21-04
## make all existing home directories private
sudo chmod 0750 /home/*
## ensure any users created by either the adduser(8) or useradd(8)
## commands have their home directories private by default
sudo sed --in-place --expression='s/DIR_MODE=0755/DIR_MODE=0750/' /etc/adduser.conf
sudo sed --in-place --expression='/^HOME_MODE 0750/d' /etc/login.defs
echo 'HOME_MODE 0750' | sudo tee --append /etc/login.defs
#4
#4 Start Terminalvenster en voer uit:
#4    sudo chmod 0755 /home/*
#4    sudo dpkg-reconfigure adduser
#4    sudo sed --in-place --expression='s/^\(HOME_MODE\s\+0750\)/#\1/' /etc/login.defs


#1 skype
#2 Skype installeren
wget --output-document=/tmp/skype.deb 'https://repo.skype.com/latest/skypeforlinux-64.deb'
sudo dpkg --install /tmp/skype.deb || sudo apt-get --fix-broken --yes install
rm /tmp/skype.deb
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt remove --yes skype


#1 teamviewer
#2 TeamViewer installeren
wget --output-document=/tmp/teamviewer.deb 'https://download.teamviewer.com/download/linux/teamviewer_amd64.deb'
sudo dpkg --install /tmp/teamviewer.deb || sudo apt-get --fix-broken --yes install
rm /tmp/teamviewer.deb
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes teamviewer
#4    sudo rm /etc/apt/sources.list.d/teamviewer.list*
#4    sudo apt update


#1 ubuntu-restricted
#2 Niet-vrije pakketten voor Ubuntu installeren
## Geen ubuntu-restricted-extras i.v.m. onbetrouwbare installatie van
## ttf-mscorefonts-installer, wel libavcodec-extra uit dat metapakket.
sudo apt-get install --yes ubuntu-restricted-addons
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes ubuntu-restricted-addons
#4    sudo apt-get autoremove --yes


#1 wallpapers
#2 Ubuntu-achtergronden installeren
sudo apt-get install --yes ubuntu-wallpapers-*
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes ubuntu-wallpapers-*
#4    sudo apt-get autoremove --yes


#1 zoom
#2 Zoom installeren
wget --output-document=/tmp/zoom.deb https://zoom.us/client/5.4.53391.1108/zoom-1_amd64.deb
sudo dpkg --install /tmp/zoom.deb || sudo apt-get --fix-broken --yes install
rm /tmp/zoom.deb
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt-get remove --yes zoom


# EOF
