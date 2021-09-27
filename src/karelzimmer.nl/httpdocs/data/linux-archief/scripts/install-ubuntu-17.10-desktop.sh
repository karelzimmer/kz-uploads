###############################################################################
# Bestand:  install-ubuntu-17.10-desktop.sh
# Doel:     Installatiebestand voor Ubuntu 17.10 desktop.
# Gebruik:  1. In het terminalvenster met script install (aanbevolen):
#              install ~/bin/install-ubuntu-17.10-desktop.sh
#           2. Direct in het terminalvenster:
#              bash ~/bin/install-ubuntu-17.10-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst
#              te kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              install -s ~/bin/install-ubuntu-17.10-desktop.sh
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)
# -----------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -----------------------------------------------------------------------------
# Versies:  1.0.0   2017-10-28  Eerste versie.
###############################################################################
# VERSION_NUMBER=1.11.0
# RELEASE_DATE=2018-04-30

#------------------------------------------------------------------------------
# Software installeren
#------------------------------------------------------------------------------

#@afstelhulp
#1 Installeer Afstelhulp uitgebreide instellingen voor Gnome 3
## ===========================================================
sudo apt-get install --yes gnome-tweak-tool

#@firefox
#1 Installeer/update Firefox webbrowser 
## ====================================
sudo apt-get install --yes firefox

# Installeer de Firefox add-ons per-machine/system-wide; geen site-wide installatie voorzien.
# Bepaal id van add-on: unzip -o *.xpi -d /tmp/ff/, check /tmp/ff/manifest.json

: # [ 1/4 ] Video DownloadHelper (Firefox add-on)
# -----------------------------------------------
# Of via https://addons.mozilla.org/nl/firefox/, zoek video.
# id={b9db16a4-6edc-47ec-a1f4-b86292ed211d}
sudo wget --output-document=/usr/lib/firefox-addons/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi 'https://addons.mozilla.org/firefox/downloads/file/811286/video_downloadhelper-latest-linux.xpi'

: # [ 2/4 ] Video DownloadHelper mede-app vdhcoapp
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

: # [ 3/4 ] Adblock Plus (Firefox add-on)
# ---------------------------------------
# Of via https://addons.mozilla.org/nl/firefox/, zoek adblock.
# id={d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
sudo wget --output-document=/usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi 'https://addons.mozilla.org/firefox/downloads/file/808841/adblock_plus-latest.xpi'

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm /usr/lib/firefox-addons/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi

: # [ 4/4 ] GNOME Shell integratie (Firefox add-on)
# -------------------------------------------------
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

#@gnome-extensies
#1 Installeer/update GNOME uitbreidingen
## =====================================

# Installeer GNOME Shell integratie voor web browsers; platform-eigen connector voor https://extensions.gnome.org
sudo apt-get install --yes chrome-gnome-shell

# Installeer de extensies per-machine/system-wide; geen site-wide installatie voorzien. De extensies worden per-user geactiveerd met setup.
# Bepaal pk van extensie: na aanklikken extensie is dat het nummer achter https://extensions.gnome.org/extension/
# Bepaal uuid van extensie (ná download ext.desc): echo "$(awk -F'"uuid": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')"

: # [BEGIN] Bepaal GNOME versienummer
# -----------------------------------
echo "$(gnome-shell --version | awk '{print $3}' | awk -F. '{print $1"."$2}')" | sudo tee /tmp/gnome.version

: # [ 1/5 ] Alternate Tab (GNOME extensie)
# ----------------------------------------
# Of via https://extensions.gnome.org, zoek alt.
# pk=15, uuid=alternate-tab@gnome-shell-extensions.gcampax.github.com

# Download de beschrijving.
sudo wget --output-document=/tmp/ext.desc "https://extensions.gnome.org/extension-info/?pk=15&shell_version=$(cat /tmp/gnome.version)"

# Bepaal de download-url.
echo "$(awk -F'"download_url": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')" | sudo tee /tmp/ext.url

# Download de extensie.
sudo wget --output-document=/tmp/ext.zip "https://extensions.gnome.org$(cat /tmp/ext.url)"

# Maak de doelmap aan.
sudo mkdir --parents /usr/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com

# Pak de extensie uit naar de doelmap.
sudo unzip -o /tmp/ext.zip -d /usr/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com

# Zet de rechten van de extensie in de doelmap goed.
sudo chmod --recursive +r /usr/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com

#3 Verwijder Alternate Tab (GNOME extensie)
#3 ----------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm --recursive /usr/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com

: # [2/5] Better Volume Indicator (GNOME extensie)
# ------------------------------------------------
# Of via https://extensions.gnome.org, zoek bet.
# pk=759, uuid=bettervolume@tudmotu.com
# Bepaal GNOME versienummer VV.RR.
echo "$(gnome-shell --version | awk '{print $3}' | awk -F. '{print $1"."$2}')" | sudo tee /tmp/gnome.version

# Download de beschrijving.
sudo wget --output-document=/tmp/ext.desc "https://extensions.gnome.org/extension-info/?pk=759&shell_version=$(cat /tmp/gnome.version)"

# Bepaal de download-url.
echo "$(awk -F'"download_url": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')" | sudo tee /tmp/ext.url

# Download de extensie.
sudo wget --output-document=/tmp/ext.zip "https://extensions.gnome.org$(cat /tmp/ext.url)"

# Maak de doelmap aan.
sudo mkdir --parents /usr/share/gnome-shell/extensions/bettervolume@tudmotu.com

# Pak de extensie uit naar de doelmap.
sudo unzip -o /tmp/ext.zip -d /usr/share/gnome-shell/extensions/bettervolume@tudmotu.com

# Zet de rechten van de extensie in de doelmap goed.
sudo chmod --recursive +r /usr/share/gnome-shell/extensions/bettervolume@tudmotu.com

#3 Verwijder Better Volume Indicator (GNOME extensie)
#3 --------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm --recursive /usr/share/gnome-shell/extensions/bettervolume@tudmotu.com

: # [ 3/5 ] Refresh Wifi Connections (GNOME extensie)
# ---------------------------------------------------
# Of via https://extensions.gnome.org, zoek ref.
# pk=905, uuid=refresh-wifi@kgshank.net
# Bepaal GNOME versienummer VV.RR.
echo "$(gnome-shell --version | awk '{print $3}' | awk -F. '{print $1"."$2}')" | sudo tee /tmp/gnome.version

# Download de beschrijving.
sudo wget --output-document=/tmp/ext.desc "https://extensions.gnome.org/extension-info/?pk=905&shell_version=$(cat /tmp/gnome.version)"

# Bepaal de download-url.
echo "$(awk -F'"download_url": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')" | sudo tee /tmp/ext.url

# Download de extensie.
sudo wget --output-document=/tmp/ext.zip "https://extensions.gnome.org$(cat /tmp/ext.url)"

# Maak de doelmap aan.
sudo mkdir --parents /usr/share/gnome-shell/extensions/refresh-wifi@kgshank.net

# Pak de extensie uit naar de doelmap.
sudo unzip -o /tmp/ext.zip -d /usr/share/gnome-shell/extensions/refresh-wifi@kgshank.net

# Zet de rechten van de extensie in de doelmap goed.
sudo chmod --recursive +r /usr/share/gnome-shell/extensions/refresh-wifi@kgshank.net

#3 Verwijder Refresh Wifi Connections (GNOME extensie)
#3 ---------------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm --recursive /usr/share/gnome-shell/extensions/refresh-wifi@kgshank.net

: # [ 4/5 ] TopIcons Plus (GNOME extensie)
# ----------------------------------------
# Of via https://extensions.gnome.org, zoek top.
# pk=1031, uuid=TopIcons@phocean.net
# Bepaal GNOME versienummer VV.RR.
echo "$(gnome-shell --version | awk '{print $3}' | awk -F. '{print $1"."$2}')" | sudo tee /tmp/gnome.version

# Download de beschrijving.
sudo wget --output-document=/tmp/ext.desc "https://extensions.gnome.org/extension-info/?pk=1031&shell_version=$(cat /tmp/gnome.version)"

# Bepaal de download-url.
echo "$(awk -F'"download_url": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')" | sudo tee /tmp/ext.url

# Download de extensie.
sudo wget --output-document=/tmp/ext.zip "https://extensions.gnome.org$(cat /tmp/ext.url)"

# Maak de doelmap aan.
sudo mkdir --parents /usr/share/gnome-shell/extensions/TopIcons@phocean.net

# Pak de extensie uit naar de doelmap.
sudo unzip -o /tmp/ext.zip -d /usr/share/gnome-shell/extensions/TopIcons@phocean.net

# Zet de rechten van de extensie in de doelmap goed.
sudo chmod --recursive +r /usr/share/gnome-shell/extensions/TopIcons@phocean.net

#3 Verwijder TopIcons Plus (GNOME extensie)
#3 ----------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm --recursive /usr/share/gnome-shell/extensions/TopIcons@phocean.net

: # [ 5/5 ] Workspace Indicator (GNOME extensie)
# ----------------------------------------------
# Of via https://extensions.gnome.org, zoek ind.
# pk=21, uuid=workspace-indicator@gnome-shell-extensions.gcampax.github.com
# Bepaal GNOME versienummer VV.RR.
echo "$(gnome-shell --version | awk '{print $3}' | awk -F. '{print $1"."$2}')" | sudo tee /tmp/gnome.version

# Download de beschrijving.
sudo wget --output-document=/tmp/ext.desc "https://extensions.gnome.org/extension-info/?pk=21&shell_version=$(cat /tmp/gnome.version)"

# Bepaal de download-url.
echo "$(awk -F'"download_url": "' '{print $2}' /tmp/ext.desc | awk -F'"' '{print $1}')" | sudo tee /tmp/ext.url

# Download de extensie.
sudo wget --output-document=/tmp/ext.zip "https://extensions.gnome.org$(cat /tmp/ext.url)"

# Maak de doelmap aan.
sudo mkdir --parents /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

# Pak de extensie uit naar de doelmap.
sudo unzip -o /tmp/ext.zip -d /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

# Zet de rechten van de extensie in de doelmap goed.
sudo chmod --recursive +r /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

#3 Verwijder Workspace Indicator (GNOME extensie)
#3 ----------------------------------------------
#3 1. Start Terminalvenster en typ, of kopieer en plak:
#3    sudo rm --recursive /usr/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

: # [EINDE] Opruimen
# ------------------
sudo rm /tmp/gnome.version /tmp/ext.desc /tmp/ext.url /tmp/ext.zip

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
