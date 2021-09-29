#############################################################################
# Bestand:  install-ubuntu-tweak.sh                                         #
# Doel:     Installatiebestand voor Ubuntu Twaek.                           #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-ubuntu-tweak.sh                           #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-ubuntu-tweak.sh                              #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s'.                         #
# Gebruikt: -                                                               #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-09-20  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.2
# RELEASE_DATE=2016-10-18

#---------------------------------------------------------------------------#
# SpotLite installeren                                                      #
#---------------------------------------------------------------------------#
#1 [ 1/1 ] Installeer Ubuntu Tweak - Ubuntu aanpassen en onderhouden (1/3)
## Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:tualatrix/ppa

#1         Installeer Ubuntu Tweak - Ubuntu aanpassen en onderhouden (2/3)
## Pakketbronnen verversen.
sudo apt-get update

#1         Installeer Ubuntu Tweak - Ubuntu aanpassen en onderhouden (3/3)
## Pakket installeren.
sudo apt-get install --yes ubuntu-tweak
#2
#2 +------------------------------------------------------------------------+
#2 |             Ubuntu Tweak - Ubuntu aanpassen en onderhouden             |
#2 +------------------------------------------------------------------------+
#2 | VERWIJDEREN                                                            |
#2 | 1. Start Terminalvenster en typ, of kopieer en plak:                   |
#2 |    sudo apt purge ubuntu-tweak                                         |
#2 |    sudo add-apt-repository --remove ppa:tualatrix/ppa                  |
#2 |    sudo apt update                                                     |
#2 +------------------------------------------------------------------------+

# Einde installatiebestand.
