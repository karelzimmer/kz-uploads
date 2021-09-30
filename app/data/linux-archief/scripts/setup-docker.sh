#############################################################################
# Bestand:  setup-docker.sh                                                 #
# Doel:     Instellingsbestand voor Docker.                                 #
# Gebruik:  Opdrachtregel in een instellingsbestand (aanbevolen).           #
#           In het terminalvenster met script setup (aanbevolen):           #
#           setup ~/bin/setup-docker.sh                                     #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-docker.sh                                      #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'setup -s setup-docker.sh'.           #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-04-08  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.2
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# Docker instellen                                                          #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Stel in Docker - toepassingen binnen software containers
## Test appl.
: # Geen opdracht. Gebruik optie info-setup (-i) voor informatie.
#2
#2 Stel in Docker - toepassingen binnen software containers
## --------------------------------------------------------
#2 1. Start Terminalvenster en voer uit als dit nog niet is gedaan:
#2    sudo adduser $USER docker
#2 2. Eerst af- en weer aanmelden om effectief lid te worden van de
#2    groep docker, anders werkt opdracht hieronder niet zonder sudo.
#2 3. Test de installatie van docker met de opdracht:
#2    docker run hello-world

# Einde instellingsbestand.
