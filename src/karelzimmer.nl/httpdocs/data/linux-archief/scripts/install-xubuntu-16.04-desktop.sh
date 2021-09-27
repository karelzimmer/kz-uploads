#############################################################################
# Bestand:  install-xubuntu-16.04-desktop.sh                                #
# Doel:     Installatiebestand voor Xubuntu 16.04 LTS desktop.              #
# Gebruik:  In het terminalvenster met script install (aanbevolen):         #
#           install [~/bin/install-xubuntu-16.04-desktop.sh]                #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-xubuntu-16.04-desktop.sh                     #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           install -s [~/bin/install-xubuntu-16.04-desktop.sh]             #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-11-18  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.0
# RELEASE_DATE=2017-11-18

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#

#@multimedia-ondersteuning
#1 [ 1/10] Installeer multimedia-ondersteuning
##============================================
## Pakketbron toevoegen (voor libdvdcss, onderdeel van het VideoLAN-project).
echo 'deb http://download.videolan.org/pub/debian/stable/ /' | \
sudo tee /etc/apt/sources.list.d/vlc.list

## Sleutel toevoegen.
wget --quiet --output-document=- \
http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -

## Pakketbronnen verversen.
sudo apt-get update

## EULA accepteren.
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true" | sudo debconf-set-selections

## Pakketten installeren.
## Pakket libdvdcss2 i.p.v. libdvd-pkg, want libdvd-pkg blijft interactief.
sudo apt-get install --yes ubuntu-restricted-extras libavcodec-extra \
libdvdread4 libdvdcss2 winff
#3
#3 Verwijder multimedia-ondersteuning
## ----------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge ubuntu-restricted-extras
#3   sudo apt purge libavcodec-extra libdvdread4 libdvdcss2 winff
#3   sudo rm /etc/apt/sources.list.d/vlc.list*
#3   sudo apt update

#@google-chrome
#1 [ 2/10] Installeer Google Chrome 64-bit - webbrowser
##=====================================================
## Pakketbron toevoegen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | \
sudo tee /etc/apt/sources.list.d/google-chrome.list || true

## Pakketbron wijzigen.
## Voorkom fouten a.g.v. missende i386-pakketten op Ubuntu/Debian 64-bit.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
sudo sed --in-place --expression='s/deb http/deb [arch=amd64] http/' \
/etc/apt/sources.list.d/google-chrome.list || true

## Sleutel toevoegen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
wget --quiet --output-document=- \
https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
 || true

## Pakketbronnen verversen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && sudo apt-get update || true

## Pakket installeren.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
sudo apt-get install --yes google-chrome-stable || true
#3
#3 Verwijder Google Chrome 64-bit - webbrowser
## -------------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge google-chrome-stable
#3   sudo rm /etc/apt/sources.list.d/google-chrome.list*
#3   sudo apt update

#@keepassx
#1 [ 3/10] Installeer KeePassX - wachtwoordkluis
##==============================================
sudo apt-get install --yes keepassx

#@skype
#1 [ 4/10] Installeer Skype - (beeld)bellen over het internet
##===========================================================
## Verwijder oude versie (kwam uit partner repo).
## Als niet aanwezig zorgt opdracht true voor afsluitwaarde 0.
sudo apt-get remove --purge --yes skype skype-bin || true

## Pakketbron toevoegen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
echo 'deb https://repo.skype.com/deb stable main' | \
sudo tee /etc/apt/sources.list.d/skype-stable.list || true

## Sleutel toevoegen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
wget --quiet --output-document=- \
https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - || true

## Pakketbronnen verversen.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
sudo apt-get update || true

## Pakket installeren.
[[ $(dpkg --print-architecture) = 'amd64' ]] && \
sudo apt-get install --yes skypeforlinux || true

#@thunderbird
#1 [ 5/10] Installeer Thunderbird - e-mail/nieuws
##===============================================
## Installeer (agenda voor) Thunderbird.
sudo apt-get install --yes thunderbird xul-ext-lightning

#@vlc
#1 [ 6/10] Installeer VLC - multimediaspeler
##==========================================
sudo apt-get install --yes vlc

#1 [ 7/10] Installeer extra stuurprogramma's
##==========================================
: # Geen opdracht. Gebruik optie '--info-install' (-i) voor informatie.
#2
#2 Installeer extra stuurprogramma's
## ---------------------------------
#2 1. Zoek Software & Updates.
#2 2. Ga naar Extra stuurprogramma's.
#2 3. Selecteer de aanwezige niet-vrije stuurprogramma's en klik op
#2    Wijzigingen doorvoeren.

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#

#@taalondersteuning
#1 [ 8/10] Wijzig taalondersteuning
##=================================
sudo apt-get install --yes $(check-language-support)

#1 [ 9/10] Wijzig foutrapportage
##==============================
## Configuratiebestand aanpassen.
sudo sed --in-place --expression='s/enabled=1/enabled=0/' /etc/default/apport

## Service uitzetten.
sudo systemctl disable --now apport.service

#1 [10/10] Wijzig opstartwachttijd
##================================
## Opstartlader toont 2 seconden het opstartmenu (was 10 seconden).
sudo sed --in-place --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=2/' \
/etc/default/grub

## Wijziging toepassen.
sudo update-grub

# Einde installatiebestand.
