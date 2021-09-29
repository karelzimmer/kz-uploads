# shellcheck shell=bash
###############################################################################
# Installatiebestand voor Ubuntu 20.04 LTS desktop op pc02.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# Auteursrecht (c) 2020-2021 Karel Zimmer.
# GNU Algemene Publieke Licentie <https://www.gnu.org/licenses/gpl.html>.
#
# ReleaseNumber: 02.04.05
# DateOfRelease: 2021-05-08
###############################################################################

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

#1
#2 Helderheid scherm installeren
## Helderheid RADEON varieert van 0 tot 255 (max_brightness).  Ingestelde
## helderheid wordt vergeten na een herstart.  Als rc.local bestaat en
## uitvoerbaar is wordt deze gestart in multi-user.target.
if [[ $HOSTNAME = pc02 ]]; then sudo touch /etc/rc.local; fi
if [[ $HOSTNAME = pc02 ]]; then sudo sudo chmod 'u+x' /etc/rc.local; fi
if [[ $HOSTNAME = pc02 ]]; then sudo sed --in-place --expression='/^echo 145 > /d' /etc/rc.local; fi
if [[ $HOSTNAME = pc02 ]]; then echo 'echo 145 > /sys/class/backlight/radeon_bl0/brightness' | sudo tee --append /etc/rc.local; fi
#4
#4 Start Terminalvenster en voer uit:
#4    sudo sed --in-place --expression='/^echo 145 > /d' /etc/rc.local


#1 openshot
#2 OpenShot installeren
sudo apt-get install --yes openshot
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt remove --yes openshot


#1 wine
#2 Wine installeren
sudo apt-get install --yes wine winetricks playonlinux
#4
#4 Start Terminalvenster en voer uit:
#4    sudo apt remove --yes wine winetricks playonlinux


# EOF
