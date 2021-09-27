# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc02.sh
# Doel:    Installatiebestand voor Ubuntu 18.04 LTS desktop op pc02
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=03.05.01
# REL_DAT=2020-04-22
# REL_MSG='Installatie wine gewijzigd'

#@openshot
#1 OpenShot video's maken en bewerken
sudo apt-get install --yes openshot
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove openshot

#@wine
#1 Wine Windows-apps op Linux
sudo apt-get install --yes wine winetricks playonlinux
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove wine winetricks playonlinux

#1 Helderheid wijzigen
## Helderheid RADEON varieert van 0 tot 255 (max_brightness).  Ingestelde helderheid wordt vergeten na een herstart.
## systemd & rc.local: if rc.local exists and is executable, it gets pulled automatically into multi-user.target
sudo touch /etc/rc.local
sudo chmod 'u+x' /etc/rc.local
if ! grep --quiet --regexp='backlight' /etc/rc.local; then echo 'echo 145 > /sys/class/backlight/radeon_bl0/brightness' | sudo tee --append /etc/rc.local; fi

# Einde installatiebestand
