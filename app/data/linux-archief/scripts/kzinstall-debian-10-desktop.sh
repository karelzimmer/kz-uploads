# shellcheck shell=bash
# ##############################################################################
# Installatiebestand voor Debian 10 desktop.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# GNU Algemene Publieke Licentie v3 <https://www.gnu.org/licenses/gpl.html>.
# ##############################################################################
# REL_NUM=01.02.02
# REL_DAT=2020-08-21
# REL_MSG='Licentietekst toegevoegd'

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

#@bitwarden
#1 Bitwarden - Een veilige en gratis wachtwoordbeheerder voor al uw apparaten
sudo apt-get install --yes snapd
sudo snap install bitwarden
#3 Start Terminalvenster en voer uit:
#3    sudo snap remove bitwarden

#@dashtodock
#1 Dash to Dock - Een dok voor de Gnome Shell
sudo apt-get install --yes gnome-shell-extension-dashtodock
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove gnome-shell-extension-dashtodock

#@icaclient
#1 Citrix Workspace app voor Linux - Telewerken (Citrix Receiver, ICA Client)
wget --output-document=/tmp/icaclient-LATEST 'info@karelzimmer.nl/downloads/icaclient/LATEST'
wget --output-document=/tmp/icaclient.deb "info@karelzimmer.nl/downloads/icaclient/icaclient_$(cat /tmp/icaclient-LATEST)_amd64.deb"
sudo DEBIAN_FRONTEND=noninteractive apt-get install --yes /tmp/icaclient.deb
sudo ln --symbolic --force /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts
sudo c_rehash /opt/Citrix/ICAClient/keystore/cacerts
rm /tmp/icaclient-LATEST /tmp/icaclient.deb
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove icaclient

#@google-chrome
#1 Google Chrome - De webbrowser van Google
## Maakt zelf /etc/apt/sources.list.d/google-chrome.list aan, tenzij eerder zelf
## aangemaakt, dan /etc/default/google-chrome:repo_add_once="false".
## GNOME Shell integration - Integratie van GNOME Shell-extensies voor
## webbrowsers: https://extensions.gnome.org
wget --output-document=/tmp/google-chrome-stable_current_amd64.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
sudo apt-get install --yes /tmp/google-chrome-stable_current_amd64.deb chrome-gnome-shell
rm /tmp/google-chrome-stable_current_amd64.deb
#2 Google Chrome als enige browser en e-mail via Google Chrome?
#2 Overweeg het verwijderen van Mozilla Firefox en Thunderbird!
#2 Start Terminalvenster en voer uit:
#2    sudo apt-get remove --yes firefox* thunderbird*
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove --yes google-chrome-stable chrome-gnome-shell

#@libreoffice
#1 LibreOffice - Kantoor productiviteit suite
sudo apt-get install --yes libreoffice libreoffice-help-nl libreoffice-l10n-nl
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove libreoffice libreoffice-help-nl libreoffice-l10n-nl

#@skype
#1 Skype - Videogesprekken, chatten, delen, en bellen over het internet
sudo snap install --classic skype
#3 Start Terminalvenster en voer uit:
#3    sudo snap remove skype

#@systemd-journal
#1 Systemd-journal - Zorg dat huidige gebruiker journalctl kan gebruiken
sudo adduser "${SUDO_USER:-$USER}" systemd-journal
#3 Start Terminalvenster en voer uit:
#3    sudo deluser "${SUDO_USER:-$USER}" systemd-journal

# EOF
