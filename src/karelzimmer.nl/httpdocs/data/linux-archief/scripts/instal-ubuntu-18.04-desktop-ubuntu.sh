# shellcheck shell=bash
# ##############################################################################
# Bestand:  instal-ubuntu-18.04-desktop-ubuntu.sh
# Doel:     instalatiebestand voor Ubuntu18.04 LST desktop op ubuntu *Live*
# Gebruik:  In het terminalvenster met script instal (aanbevolen):
#           instal /usr/local/bin/instal-ubuntu-18.04-desktop-ubuntu.sh
#      of:  Direct in het terminalvenster:
#           bash /usr/local/bin/instal-ubuntu-18.04-desktop-ubuntu.sh
#      of:  Kopieer een opdrachtregel en plak deze in het terminalvenster,
#           bijvoorbeeld via opdracht:
#           instal -s /usr/local/bin/instal-ubuntu-18.04-desktop-ubuntu.sh
# Auteur:   Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=04.01.05
# REL_DAT=2019-12-07
# REL_MSG='Invoering changelog in pakket scripts'

# ------------------------------------------------------------------------------
# Software installeren
# ------------------------------------------------------------------------------
#@bluefish
#1 Bluefish web en programmeurs-editor
sudo apt-get install --yes bluefish
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove bluefish

#@clamav
#1 ClamAV/ClamTK antivirus
sudo apt-get install --yes clamtk
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove clamtk

#@filezilla
#1 FileZilla ftp-programma
sudo apt-get install --yes filezilla
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove filezilla

#@gedit
#1 Gedit teksteditor
sudo apt-get install --yes gedit gedit-plugins
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove gedit gedit-plugins

#@icaclient
#1 Citrix Workspace app (v/h Citrix Receiver, aka ICA Client) telewerken
wget --output-document=/tmp/LATEST 'https://karelzimmer.nl/apps/icaclient/LATEST'
wget --output-document=/tmp/icaclient.deb "https://karelzimmer.nl/apps/icaclient/icaclient_$(cat /tmp/LATEST)_amd64.deb"
echo 'icaclient icaclient/accepteula select true' | sudo debconf-set-selections
sudo apt-get install --yes /tmp/icaclient.deb
sudo ln --symbolic --force /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts
sudo rm /tmp/LATEST /tmp/icaclient.deb
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove icaclient

#@meld
#1 Meld grafisch bestanden vergelijken en combineren
sudo apt-get install --yes meld
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove meld

#@nautilus-admin
#1 Nautilus Admin open map of wijzig bestand als admin
sudo apt-get install --yes nautilus-admin
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove nautilus-admin

#@nautilus-hide
#1 Nautilus Hide bestanden en mappen verbergen
sudo apt-get install --yes nautilus-hide
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove nautilus-hide

#@vim
#1 Vi IMproved verbeterde vi editor
sudo apt-get install --yes vim
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove vim
# ------------------------------------------------------------------------------
# Systeeminstellingen wijzigen
# ------------------------------------------------------------------------------
#1 Voeg gebruiker karel toe aan groep adm (voor o.a. journalctl)
sudo adduser karel adm
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    sudo deluser karel adm

# Einde installatiebestand
