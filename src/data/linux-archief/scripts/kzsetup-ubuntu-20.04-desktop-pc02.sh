# shellcheck shell=bash
###############################################################################
# Instellingsbestand voor Ubuntu 20.04 LTS desktop op pc02.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# Auteursrecht (c) 2020-2021 Karel Zimmer.
# GNU Algemene Publieke Licentie <https://www.gnu.org/licenses/gpl.html>.
#
# ReleaseNumber: 02.05.04
# DateOfRelease: 2021-05-08
###############################################################################

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

#1
#2 GNOME instellen
## Voor een beschrijving voer uit: gsettings describe SCHEMA KEY
if [[ $HOSTNAME = pc02 && $USER = marin ]]; then gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/Cairn_by_Sylvain_Naudin.jpg'; fi
#4
#4 Start Terminalvenster en voer uit:
#4    gsettings reset org.gnome.desktop.background picture-uri


#1 openshot
#2 OpenShot instellen
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='openshot-qt.desktop'; then gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}'), 'openshot-qt.desktop']"; fi
#4
#4 Start Terminalvenster en voer uit:
#4    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/'openshot-qt.desktop', //g" | sed --expression="s/, 'openshot-qt.desktop'//")"


# EOF
