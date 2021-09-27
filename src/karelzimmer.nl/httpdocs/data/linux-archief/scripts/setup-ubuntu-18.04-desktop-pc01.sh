# shellcheck shell=bash
# ##############################################################################
# Bestand: setup-ubuntu-18.04-desktop-pc01.sh
# Doel:    Instellingsbestand voor Ubuntu 18.04 LTS desktop op pc01
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=02.12.00
# REL_DAT=2020-04-22
# REL_MSG='Dash to Panel verwijderd'

#1 Vervang Firefox door Chrome en Thunderbird door Gmail
rm --force --recursive "$HOME/.mozilla" "$HOME/.thunderbird"
#2 1. Start Standaardtoepassingen.
#2 2. Kies bij E-mail voor Gnome Gmail.

#@spotify
#1 Spotify online muziekservice
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='spotify_spotify.desktop'; then gsettings set org.gnome.shell favorite-apps "['spotify_spotify.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#2 1. Start Spotify.
#2 2. Aanmelden.
#2 3. Ga naar Edit (Bewerken) en vervolgens naar Preferences (Voorkeuren).
#2 4. Zet Language (Taal) op Nederlands (Dutch).
#2 5. Herstart Spotify.

#1 Bureaubladachtergrond wijzigen
gsettings set org.gnome.desktop.background picture-uri 'file:///opt/kzscripts/share/backgrounds/olifanten.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///opt/kzscripts/share/backgrounds/olifanten.jpg'
#3 Start Terminalvenster en voer uit:
#3    gsettings reset org.gnome.desktop.background picture-uri
#3    gsettings reset org.gnome.desktop.screensaver picture-uri

# Einde instellingsbestand
