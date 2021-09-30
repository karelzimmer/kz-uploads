#############################################################################
# Bestand:  install-tilix.sh                                                #
# Doel:     Installatiebestand voor Tilix.                                  #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-tilix.sh                                  #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-tilix.sh                                     #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s install-tilix.sh'.        #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-09-20  Eerste versie.                              #
#           2.0.0   2017-03-20  Hernoemd (v/h install-terminix.sh).         #
#############################################################################
# VERSION_NUMBER=2.0.6
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# Tilix installeren                                                         #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer Tilix - meer terminalvensters in één venster
## Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:webupd8team/terminix

## Pakketbronnen verversen.
sudo apt-get update

## Pakket installeren.
sudo apt-get install --yes tilix
#3
#3 Verwijder Tilix - meer terminalvensters in één venster
## ------------------------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge tilix
#3   sudo add-apt-repository --yes --remove ppa:webupd8team/terminix
#3   sudo apt update

# Einde installatiebestand.
