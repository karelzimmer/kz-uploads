#############################################################################
# Bestand:  install-ubuntu-17.10-desktop-PC10.sh                            #
# Doel:     Installatiebestand voor Xubuntu 17.10 LTS desktop op PC10.      #
# Gebruik:  In het terminalvenster met script install (aanbevolen):         #
#           install [~/bin/install-ubuntu-17.10-desktop-PC10.sh]            #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-ubuntu-17.10-desktop-PC10.sh                 #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           install -s [~/bin/install-ubuntu-17.10-desktop-PC10.sh]         #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-10-28  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.6.2
# RELEASE_DATE=2018-01-18

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#

#@bluefish
#1 [ 1/7 ] Installeer Bluefish - web en programmeurs-editor
##=========================================================
sudo apt-get install --yes bluefish

#@gedit
#1 [ 2/7 ] Installeer gedit - teksteditor
##=======================================
## Installeer (plug-ins voor) gedit. 
sudo apt-get install --yes gedit gedit-plugins

#@icaclient
#1 [ 3/7 ] Installeer Citrix Receiver - telewerken
##================================================
## Versienummerbestand downloaden. Inhoud bijvoorbeeld: 13.4.0.10109380
wget --output-document=/tmp/LATEST http://karelzimmer.nl/downloads/apps/icaclient/LATEST

## Pakket downloaden.
wget --output-document=/tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb http://karelzimmer.nl/downloads/apps/icaclient/$(cat /tmp/LATEST)/icaclient_$(cat /tmp/LATEST)_amd64.deb

## Controlebestand downloaden.
wget --output-document=/tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb.sha256sum http://karelzimmer.nl/downloads/apps/icaclient/$(cat /tmp/LATEST)/icaclient_$(cat /tmp/LATEST)_amd64.deb.sha256sum

## Pakket controleren.
sha256sum --check /tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb.sha256sum

## EULA accepteren.
echo 'icaclient icaclient/accepteula select true' | sudo debconf-set-selections

## GDebi installeren.
sudo apt-get install --yes gdebi-core

## Pakket installeren.
sudo gdebi --non-interactive /tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb

## SSL-certificaten toevoegen (1 van 2).
sudo ln --symbolic --force /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts

## SSL-certificaten toevoegen (2 van 2).
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts

## Opruimen.
rm /tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb /tmp/icaclient_$(cat /tmp/LATEST)_amd64.deb.sha256sum /tmp/LATEST

#@filezilla
#1 [ 4/7 ] Installeer FileZilla - FTP-programma
##=============================================
sudo apt-get install --yes filezilla

#@gradio
#1 [ 5/7 ] Installeer Gradio - desktop internetradio-speler
##=========================================================
## Flatpak PPA installeren.
## Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:alexlarsson/flatpak

## Pakketbronnen verversen.
sudo aptget update

## Flatpak installeren.
sudo apt-get install --yes flatpak

## Gradio installeren.
flatpak info de.haeckerfelix.gradio || sudo flatpak install --assumeyes --from https://flathub.org/repo/appstream/de.haeckerfelix.gradio.flatpakref
#3
#3 Verwijder Gradio - desktop internetradio-speler
## -----------------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo flatpak uninstall de.haeckerfelix.gradio
#3   sudo add-apt-repository --yes --remove ppa:alexlarsson/flatpak
#3   sudo apt update

#@vim
#1 [ 6/7 ] Installeer Vi IMproved - verbeterde vi editor
##======================================================
sudo apt-get install --yes vim

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#

#1 [ 7/7 ] Wijzig koppelpunt / koppelopties (noatime) i.v.m. eMMC
##===============================================================
## Voeg mountoptie noatime toe.
sudo sed --in-place --expression='s/errors=remount-ro /errors=remount-ro,noatime /' /etc/fstab

## Activeer nieuwe mount-optie.
sudo mount -o remount /

# Einde installatiebestand.
