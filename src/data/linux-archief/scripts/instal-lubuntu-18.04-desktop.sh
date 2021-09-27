# ###############################################################################
# Bestand:  instal-lubuntu-18.04-desktop.sh
# Doel:     Installatiebestand voor Lubuntu 18.04 LTS desktop
# Gebruik:  1. In het terminalvenster met script instal (aanbevolen):
#              instal /usr/local/bin/instal-lubuntu-18.04-desktop.sh
#           2. Direct in het terminalvenster:
#              bash /usr/local/bin/instal-lubuntu-18.04-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst te
#              kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              instal -s /usr/local/bin/instal-lubuntu-18.04-desktop.sh
# Auteur:   Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# -------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -------------------------------------------------------------------------------
# Versies:  1.0.0   2018-05-02  Eerste versie
#           2.0.0   2018-11-11  Hernoemd (install -> instal)
# ###############################################################################
# VERSION_NUMBER=2.5.3
# RELEASE_DATE=2019-02-03

# shellcheck shell=bash
# shellcheck disable=2005

# -------------------------------------------------------------------------------
# Software installeren
# -------------------------------------------------------------------------------

#@firefox
#1 Installeer/update Firefox webbrowser
## ====================================
# Installeer pakket
sudo apt-get install --yes firefox

#3 Verwijder Firefox webbrowser
#3 ----------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove firefox

# Installeer de Firefox add-ons per-machine/systemwide; geen site-wide installatie voorzien.
# Verwijder de per-user add-ons, deze zijn per-machine/systemwide geïnstalleerd.
# Bepaal id van add-on: unzip -o *.xpi -d /tmp/ff/, check /tmp/ff/manifest.json

: # [ 1/3 ] Video DownloadHelper (Firefox add-on)
# -----------------------------------------------
# id={b9db16a4-6edc-47ec-a1f4-b86292ed211d}
# Download add-on
sudo wget --output-document='/usr/lib/firefox-addons/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi' 'https://addons.mozilla.org/firefox/downloads/file/811286/video_downloadhelper-latest-linux.xpi'

: # [ 2/3 ] Video DownloadHelper mede-app vdhcoapp
# ------------------------------------------------
# Bepaal download-url
sudo wget --spider --no-verbose --output-file=/tmp/vdhcoapp.url 'https://github.com/mi-g/vdhcoapp/releases/latest'

# Maak versienummerbestand
sudo sudo echo "$(awk -F/tag/v '{print $2}' '/tmp/vdhcoapp.url' | awk '{print $1}')" | sudo tee /tmp/vdhcoapp.latest

# Download pakket
sudo wget --output-document=/tmp/vdhcoapp.deb "https://github.com/mi-g/vdhcoapp/releases/download/v$(cat /tmp/vdhcoapp.latest)/net.downloadhelper.coapp-$(cat /tmp/vdhcoapp.latest)-1_$(dpkg --print-architecture).deb"

# Installeer GDebi.
sudo apt-get install --yes gdebi-core

# Installeer pakket
sudo gdebi --non-interactive /tmp/vdhcoapp.deb

# Ruim op
sudo rm /tmp/vdhcoapp.url /tmp/vdhcoapp.latest /tmp/vdhcoapp.deb

# Verwijder per-user add-on
sudo rm --force /home/*/.mozilla/firefox/*/extensions/'{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi'

#3 Verwijder Video DownloadHelper (Firefox add-on)
#3 -----------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm '/usr/lib/firefox-addons/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi'
#3    sudo apt remove net.downloadhelper.coapp

: # [ 3/3 ] Adblock Plus (Firefox add-on)
# ---------------------------------------
# Download add-on
sudo wget --output-document='/usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi' 'https://addons.mozilla.org/firefox/downloads/file/808841/adblock_plus-latest.xpi'

# Verwijder per-user add-on
sudo rm --force /home/*/.mozilla/firefox/*/extensions/'{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi'

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm '/usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi'

#@flatpak
#1 Installeer flatpak bouw, installeer, en draai apps en runtimes
## ==============================================================
# Voeg pakketbron toe
sudo add-apt-repository --yes 'ppa:alexlarsson/flatpak'

# Installeer pakket
sudo apt-get install --yes flatpak

# Voeg Flathub-pakketbron toe
sudo flatpak remote-add --if-not-exists flathub 'https://flathub.org/repo/flathub.flatpakrepo'

#3 Verwijder flatpak bouw, installeer, en draai apps en runtimes
#3 -------------------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove flatpak
#3    sudo flatpak-remote-delete flathub 'https://flathub.org/repo/flathub.flatpakrepo'
#3    sudo add-apt-repository --yes --remove ppa:alexlarsson/flatpak

#@google-chrome
#1 Installeer Google Chrome webbrowser (alleen 64-bit)
## ===================================================
# [arch=amd64] omdat anders fout 'missende i386-pakketten' op Lubuntu 64-bit
# Voeg pakketbron toe
[[ $(dpkg --print-architecture) != 'amd64' ]] || sudo echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Voeg sleutel toe
[[ $(dpkg --print-architecture) != 'amd64' ]] || sudo wget --output-document=- 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | sudo apt-key add -

# Ververs pakketbronnen
[[ $(dpkg --print-architecture) != 'amd64' ]] || sudo apt-get update

# Installeer pakket
[[ $(dpkg --print-architecture) != 'amd64' ]] || sudo apt-get install --yes google-chrome-stable

#3 Verwijder Google Chrome webbrowser
#3 ----------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove google-chrome-stable
#3    sudo rm /etc/apt/sources.list.d/google-chrome.list*
#3    sudo apt update

#@keepass
#1 Installeer KeePassXC wachtwoordkluis
## ====================================
# Installeer pakket
sudo snap install keepassxc

#3 Verwijder KeePassXC wachtwoordkluis
#3 -----------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo snap remove keepassxc

#@libreoffice
#1 Installeer LibreOffice kantoorpakket
## ====================================
# Installeer pakketten
sudo apt-get install --yes libreoffice libreoffice-help-nl libreoffice-l10n-nl

#3 Verwijder LibreOffice kantoorpakket
#3 -----------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove libreoffice libreoffice-help-nl libreoffice-l10n-nl

#@skype
#1 Installeer Skype beeldbellen over internet (alleen 64-bit)
## ==========================================================
[[ $(dpkg --print-architecture) != 'amd64' ]] || sudo snap install --classic skype

#3 Verwijder Skype beeldbellen over internet (alleen 64-bit)
#3 ---------------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo snap remove skype

#@teamviewer
#1 Installeer TeamViewer computer op afstand bedienen
## ==================================================
# Download pakket
sudo wget --output-document=/tmp/teamviewer.deb 'https://download.teamviewer.com/download/linux/teamviewer_amd64.deb'

# Accepteer EULA
sudo echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# Installeer GDebi.
sudo apt-get install --yes gdebi-core

# Installeer pakket
sudo gdebi --non-interactive /tmp/teamviewer.deb

# Ruim op
sudo rm /tmp/teamviewer.deb

#3 Verwijder TeamViewer computer op afstand bedienen
#3 -------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove teamviewer
#3    sudo rm /etc/apt/sources.list.d/teamviewer.list*
#3    sudo apt update

#@thunderbird
#1 Installeer/update Thunderbird e-mail/nieuws/agenda
## ==================================================

# Activeren van de extensies in setup

# Installeer pakket
sudo apt-get install --yes thunderbird xul-ext-lightning

#3 Verwijder Thunderbird e-mail/nieuws/agenda
#3 ------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove thunderbird xul-ext-lightning

# Verwijder onnodige authenticatie-verzoeken
sudo rm --force /home/*/.config/evolution/sources/*

#@vlc
#1 Installeer VLC mediaspeler en multimedia-ondersteuning
## ======================================================
# Voor libdvdcss, onderdeel van het VideoLAN-project
# Voeg pakketbron toe
sudo echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee /etc/apt/sources.list.d/vlc.list

# Voeg sleutel toe
sudo wget --output-document=- 'http://download.videolan.org/pub/debian/videolan-apt.asc' | sudo apt-key add -

# Ververs pakketbronnen
sudo apt-get update

# Accepteer EULA
sudo echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# Installeer libdvdcss2 i.p.v. libdvd-pkg, want libdvd-pkg blijft interactief
# Installeer pakketten
sudo apt-get install --yes lubuntu-restricted-extras libavcodec-extra libdvdread4 libdvdcss2 vlc winff

#3 Verwijder VLC mediaspeler en multimedia-ondersteuning
#3 -----------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt remove libavcodec-extra libdvdread4 libdvdcss2 vlc winff
#3    sudo rm /etc/apt/sources.list.d/vlc.list*
#3    sudo apt update

#@wallpapers
#1 Installeer bureaubladachtergronden
## ==================================
# Eigenlijk iets meer dan alleen wallpapers
sudo apt-get install --yes lubuntu-artwork-*

#3 Verwijder bureaubladachtergronden
#3 ---------------------------------
#3 N.v.t.

# -------------------------------------------------------------------------------
# Systeeminstellingen wijzigen
# -------------------------------------------------------------------------------

#1 Wijzig foutrapportage
## =====================
# Pas configuratiebestand aan
sudo sed --in-place --expression='s/enabled=1/enabled=0/' /etc/default/apport

# Zet service uit
sudo systemctl disable --now apport.service

#1 Wijzig opstartwachttijd
## =======================
# Wijzig GRUB-configuratie (oud)
sudo sed --in-place --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=1/' /etc/default/grub

# Wijzig GRUB-configuratie (nieuw)
sudo sed --in-place --expression='s/GRUB_TIMEOUT=0/GRUB_TIMEOUT=1/' /etc/default/grub

# Pas wijziging toe
sudo update-grub

#@drivers
#1 Installeer extra stuurprogramma's
## =================================
# Geen opdracht
: # Geen opdracht; gebruik optie '--instal-info' voor meer informatie

#2 Installeer extra stuurprogramma's
#2 ---------------------------------
#2 1. Zoek Software & Updates.
#2 2. Ga naar Extra stuurprogramma's.
#2 3. Selecteer de aanwezige niet-vrije stuurprogramma's en klik op
#2    Wijzigingen doorvoeren.

# Einde installatiebestand
