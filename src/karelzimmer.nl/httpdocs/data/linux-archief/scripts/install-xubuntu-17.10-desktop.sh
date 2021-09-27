###############################################################################
# Bestand:  install-xubuntu-17.10-desktop.sh
# Doel:     Installatiebestand voor Xubuntu 17.10 desktop.
# Gebruik:  1. In het terminalvenster met script install (aanbevolen):
#              install ~/bin/install-xubuntu-17.10-desktop.sh
#           2. Direct in het terminalvenster:
#              bash ~/bin/install-xubuntu-17.10-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst
#              te kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              install -s ~/bin/install-xubuntu-17.10-desktop.sh
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)
# -----------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -----------------------------------------------------------------------------
# Versies:  1.0.0   2017-11-21  Eerste versie.
###############################################################################
# VERSION_NUMBER=1.3.1
# RELEASE_DATE=2018-04-29

#@firefox
#1 Installeer/update Firefox webbrowser 
## ====================================
sudo apt-get install --yes firefox

# Installeer de Firefox add-ons per-machine/system-wide; geen site-wide installatie voorzien.
# Bepaal id van add-on: unzip -o *.xpi -d /tmp/ff/, check /tmp/ff/manifest.json

: # [ 1/3 ] Video DownloadHelper (Firefox add-on)
# -----------------------------------------------
# Of via https://addons.mozilla.org/nl/firefox/, zoek video.
# id={b9db16a4-6edc-47ec-a1f4-b86292ed211d}
sudo wget --output-document=/usr/lib/firefox-addons/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi 'https://addons.mozilla.org/firefox/downloads/file/811286/video_downloadhelper-latest-linux.xpi'

: # [ 2/3 ] Video DownloadHelper mede-app vdhcoapp
# ------------------------------------------------
# URL met versienummer downloaden.
sudo wget --spider --no-verbose --output-file=/tmp/vdhcoapp.url 'https://github.com/mi-g/vdhcoapp/releases/latest'

# Versienummerbestand maken.
echo "$(awk -F/tag/v '{print $2}' '/tmp/vdhcoapp.url' | awk '{print $1}')" | sudo tee /tmp/vdhcoapp.latest

# Pakket downloaden.
sudo wget --output-document=/tmp/vdhcoapp.deb "https://github.com/mi-g/vdhcoapp/releases/download/v$(cat /tmp/vdhcoapp.latest)/net.downloadhelper.coapp-$(cat /tmp/vdhcoapp.latest)-1_$(dpkg --print-architecture).deb"

# GDebi installeren.
sudo apt-get install --yes gdebi-core

# Pakket installeren.
sudo gdebi --non-interactive /tmp/vdhcoapp.deb

# Opruimen.
sudo rm /tmp/vdhcoapp.url /tmp/vdhcoapp.latest /tmp/vdhcoapp.deb

#3 Verwijder Video DownloadHelper (Firefox add-on)
#3 -----------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/firefox-addons/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi
#3    sudo apt purge net.downloadhelper.coapp

: # [ 3/3 ] Adblock Plus (Firefox add-on)
# ---------------------------------------
# Of via https://addons.mozilla.org/nl/firefox/, zoek adblock.
# id={d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
sudo wget --output-document=/usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi 'https://addons.mozilla.org/firefox/downloads/file/808841/adblock_plus-latest.xpi'

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi

: # GNOME Shell integratie (Firefox add-on) [3/3]
# -----------------------------------------------
# Of via https://addons.mozilla.org/nl/firefox/, zoek gnome.
# id=chrome-gnome-shell@gnome.org
sudo wget --output-document=/usr/lib/firefox-addons/extensions/chrome-gnome-shell@gnome.org.xpi 'https://addons.mozilla.org/firefox/downloads/file/615929/gnome_shell_integration-latest-linux.xpi'

#3 Verwijder GNOME Shell integratie (Firefox - add-on)
#3 ---------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/firefox-addons/extensions/chrome-gnome-shell@gnome.org.xpi

#@flatpak
#1 Installeer flatpak bouw, installeer, en draai apps en runtimes
## ==============================================================
# Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:alexlarsson/flatpak

# Pakketbronnen verversen.
sudo apt-get update

# Flatpak installeren, incl. plugin.
sudo apt-get install --yes flatpak gnome-software-plugin-flatpak

# Flathub pakketbron toevoegen.
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#@gedit
#1 Installeer gedit teksteditor
## ============================
# Installeer (plug-ins voor) gedit.
sudo apt-get install --yes gedit gedit-plugins

#@google-chrome
#1 Installeer Google Chrome webbrowser
## ===================================
# Pakketbron toevoegen, [arch=amd64] omdat anders fout 'missende i386-pakketten' op Ubuntu.
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Sleutel toevoegen.
wget --output-document=- 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | sudo apt-key add -

# Pakketbronnen verversen.
sudo apt-get update

# Pakket installeren.
sudo apt-get install --yes google-chrome-stable

#@keepassx
#1 Installeer KeePassX  wachtwoordkluis
## ====================================
sudo apt-get install --yes keepassx

#@skype
#1 Installeer Skype beeldbellen over internet
## ==========================================
# Pakketbron toevoegen.
echo 'deb https://repo.skype.com/deb stable main' | sudo tee /etc/apt/sources.list.d/skype-stable.list

# Sleutel toevoegen.
wget --output-document=- 'https://repo.skype.com/data/SKYPE-GPG-KEY' | sudo apt-key add -

# Pakketbronnen verversen.
sudo apt-get update

# Pakket installeren.
sudo apt-get install --yes skypeforlinux

#@thunderbird
#1 Installeer/update Thunderbird e-mail/nieuws
## ===========================================
sudo apt-get install --yes thunderbird

# Installeer de Thunderbird add-ons per-machine/system-wide; geen site-wide installatie voorzien.
# Bepaal id van add-on: unzip -o *.xpi -d /tmp/ff/, check /tmp/ff/manifest.json

: # [ 1/2 ] Provider for Google Agenda (Thunderbird add-on)
# ---------------------------------------------------------
# Of via menu > Add-ons > Add-ons-verkrijgen > Meer info, zoek agenda.
# id={a62ef8ec-5fdc-40c2-873c-223b8a6925cc}
sudo wget --output-document=/usr/lib/thunderbird-addons/extensions/{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}.xpi 'https://addons.mozilla.org/thunderbird/downloads/latest/provider-for-google-calendar/addon-4631-latest.xpi'

#3 Verwijder Provider for Google Agenda (Thunderbird add-on)
#3 ---------------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/thunderbird-addons/extensions/{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}.xpi

: # [ 2/2 ] Manually sort folders (Thunderbird add-on)
# ----------------------------------------------------
# Of via menu > Add-ons > Add-ons-verkrijgen > Meer info, zoek sort.
# id=tbsortfolders@xulforum.org
sudo wget --output-document=/usr/lib/thunderbird-addons/extensions/tbsortfolders@xulforum.org.xpi 'https://addons.mozilla.org/thunderbird/downloads/latest/manually-sort-folders/addon-15102-latest.xpi'

#3 Verwijder Manually sort folders (Thunderbird add-on)
#3 ----------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/thunderbird-addons/extensions/tbsortfolders@xulforum.org.xpi

#@vlc
#1 Installeer VLC mediaspeler en multimedia-ondersteuning
## ======================================================
# Pakketbron toevoegen; voor libdvdcss, onderdeel van het VideoLAN-project.
echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee /etc/apt/sources.list.d/vlc.list

# Sleutel toevoegen.
wget --output-document=- 'http://download.videolan.org/pub/debian/videolan-apt.asc' | sudo apt-key add -

# Pakketbronnen verversen.
sudo apt-get update

# EULA accepteren.
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true' | sudo debconf-set-selections

# Pakketten installeren; pakket libdvdcss2 i.p.v. libdvd-pkg, want libdvd-pkg blijft interactief.
sudo apt-get install --yes ubuntu-restricted-extras libavcodec-extra libdvdread4 libdvdcss2 vlc winff

#3 Verwijder VLC mediaspeler en multimedia-ondersteuning
#3 -----------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo apt purge libavcodec-extra libdvdread4 libdvdcss2 vlc winff
#3    sudo rm /etc/apt/sources.list.d/vlc.list*
#3    sudo apt update

#@taalondersteuning
#1 Installeer taalondersteuning
## ============================
sudo apt-get install --yes "$(check-language-support)"

#@drivers
#1 Installeer extra stuurprogramma's
## =================================
: # Geen opdracht; gebruik optie '--info-install' voor informatie.

#2 Installeer extra stuurprogramma's
#2 ---------------------------------
#2 1. Zoek Software & Updates.
#2 2. Ga naar Extra stuurprogramma's.
#2 3. Selecteer de aanwezige niet-vrije stuurprogramma's en klik op
#2    Wijzigingen doorvoeren.

#------------------------------------------------------------------------------
# Systeeminstellingen wijzigen
#------------------------------------------------------------------------------

#1 Wijzig foutrapportage
## =====================
# Configuratiebestand aanpassen.
sudo sed --in-place --expression='s/enabled=1/enabled=0/' /etc/default/apport

# Service uitzetten.
sudo systemctl disable --now apport.service

#1 Wijzig opstartwachttijd
## =======================
# Opstartlader toont 2 seconden het opstartmenu (was 10 seconden).
sudo sed --in-place --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=2/' /etc/default/grub

# Wijziging toepassen.
sudo update-grub

# Einde installatiebestand.
