#############################################################################
# Bestand:  install-gradio.sh                                               #
# Doel:     Installatiebestand voor Gradio.                                 #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-gradio.sh                                 #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-gradio.sh                                    #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s install-gradio.sh'.       #
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
# Gradio installeren                                                        #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer Gradio - desktop internetradio-speler
## Pakketbron toevoegen.
sudo add-apt-repository --yes ppa:haecker-felix/gradio-daily

## Pakketbronnen verversen.
sudo apt-get update

## Pakket installeren.
sudo apt-get install --yes --yes gradio
#3
#3 Verwijder Gradio - desktop internetradio-speler
## -----------------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge gradio
#3   sudo add-apt-repository --yes --remove ppa:haecker-felix/gradio-daily
#3   sudo apt update

# Einde installatiebestand.
