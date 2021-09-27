#############################################################################
# Bestand:  install-jdownloader.sh                                          #
# Doel:     Installatiebestand voor jDownloader.                            #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-jdownloader.sh                            #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-jdownloader.sh                               #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s install-jdownloader.sh'.  #
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
# VERSION_NUMBER=1.0.14
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# jDownloader installeren                                                   #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer jDownloader - downloadprogramma
## Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:jd-team/jdownloader

## Pakketbronnen verversen.
sudo apt-get update

## Pakket installeren.
sudo apt-get install --yes jdownloader
#3
#3 Verwijder jDownloader - downloadprogramma
## -----------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge jdownloader
#3   sudo add-apt-repository --yes --remove ppa:jd-team/jdownloader
#3   sudo apt update

# Einde installatiebestand.
