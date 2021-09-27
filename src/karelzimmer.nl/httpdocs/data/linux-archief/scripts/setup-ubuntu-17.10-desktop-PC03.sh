#############################################################################
# Bestand:  setup-ubuntu-17.10-desktop-PC03.sh                              #
# Doel:     Instellingsbestand voor Ubuntu 17.10 desktop op PC03.           #
# Gebruik:  In het terminalvenster met script setup (aanbevolen):           #
#           setup [~/bin/setup-ubuntu-17.10-desktop-PC03.sh]                #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-ubuntu-17.10-desktop-PC03.sh                   #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           setup -s [~/bin/setup-ubuntu-17.10-desktop-PC03.sh]             #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-11-11  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.2
# RELEASE_DATE=2017-12-01

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Stel in werkbladachtergrond
##====================================
## Aanpassen via Systeeminstellingen > Uiterlijk > Uiterlijk (tab).
## Achtergrond.
gsettings set org.gnome.desktop.background picture-uri \
'file:///opt/wallpapers/prunus.png'

## Vergrendelingsscherm.
gsettings set org.gnome.desktop.screensaver picture-uri \
'file:///opt/wallpapers/prunus.jpg'

# Einde instellingsbestand.
