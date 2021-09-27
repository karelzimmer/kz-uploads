#############################################################################
# Bestand:  install-ubuntu-17.10-desktop-PC03.sh                            #
# Doel:     Installatiebestand voor Ubuntu 17.10 desktop op PC03.           #
# Gebruik:  In het terminalvenster met script install (aanbevolen):         #
#           install [~/bin/install-ubuntu-17.10-desktop-PC03.sh]            #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-ubuntu-17.10-desktop-PC03.sh                 #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           install -s [~/bin/install-ubuntu-17.10-desktop-PC03.sh]         #
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
# VERSION_NUMBER=1.1.0
# RELEASE_DATE=2017-12-23

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Wijzig aanmeldfoto
##===========================
## Alleen voor de gebruiker die installeert, andere <gebruiker>s via setup.
## Verwijder bestaande aanmeldfoto.
sudo sed --in-place --expression='/^Icon=/d' \
/var/lib/AccountsService/users/${SUDO_USER:-$USER}

## Voeg aanmeldfoto toe.
echo 'Icon=/usr/share/pixmaps/faces/flower.jpg' | \
sudo tee --append /var/lib/AccountsService/users/${SUDO_USER:-$USER}

# Einde installatiebestand.
