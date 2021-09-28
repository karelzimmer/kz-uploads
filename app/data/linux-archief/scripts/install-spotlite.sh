#############################################################################
# Bestand:  install-spotlite.sh                                             #
# Doel:     Installatiebestand voor SpotLite.                               #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-spotlite.sh                               #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-spotlite.sh                                  #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s install-spotlite.sh'.     #
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
# VERSION_NUMBER=1.1.1
# RELEASE_DATE=2017-05-11

#---------------------------------------------------------------------------#
# SpotLite installeren                                                      #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer SpotLite - TV-gids voor nieuwgroepen
## Pakket downloaden.
wget --output-document=/tmp/spotlite.zip \
"http://www.spot-net.nl.vfcdn.net/downloads/spotlite/SpotLite(v2)Ubuntu.zip"

## Pakket uitpakken.
unzip -o '/tmp/spotlite.zip' -d /tmp

## Pakket installeren.
## Bij vereistenproblemen zorgt opdracht true voor afsluitwaarde 0.
sudo dpkg --install /tmp/spotlite-$(dpkg --print-architecture).deb || true

## Vereistenproblemen verhelpen.
sudo apt-get install --yes --fix-broken

## Opruimen.
rm /tmp/spotlite.zip /tmp/spotlite-$(dpkg --print-architecture).deb

# Einde installatiebestand.
