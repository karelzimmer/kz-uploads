#############################################################################
# Bestand:  install-fix-msttcorefonts.sh                                    #
# Doel:     Installatiebestand voor het oplossen van problemen met het      #
#           installeren van Installer for Microsoft TrueType core fonts,    #
#           te weten "Downloaden van extra gegevensbestanden is mislukt".   #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-fix-msttcorefonts.sh                      #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-fix-msttcorefonts.sh                         #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht                                       #
#           'install -s install-fix-msttcorefonts.sh'.                      #
# Gebruikt: -                                                               #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-01-23  Eerste versie.                              #
#           2.0.0   2017-01-25  Hernoemd (v/h install-fix-ttmscorefonts.sh).#
#############################################################################
# VERSION_NUMBER=2.1.1
# RELEASE_DATE=2017-04-23

#---------------------------------------------------------------------------#
# Installer for Microsoft TrueType core fonts installeren                   #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer fix Installer for Microsoft TrueType core fonts (1/5)
## Tijdelijk voorkom 'Downloaden van extra gegevensbestanden is mislukt'.
## Zie: https://bugs.launchpad.net/ubuntu/+source/apt/+bug/1651923
## Verwijder de foutieve versie (3.5).
sudo apt-get remove --yes --purge ttf-mscorefonts-installer

#1         Installeer fix Installer for Microsoft TrueType core fonts (2/5)
## Tijdelijk voorkom 'Downloaden van extra gegevensbestanden is mislukt'.
## Download de Debian versie (3.6).
wget --output-document=/tmp/ttf-mscorefonts-installer_3.6_all.deb \
http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/\
ttf-mscorefonts-installer_3.6_all.deb

#1         Installeer fix Installer for Microsoft TrueType core fonts (3/5)
## Tijdelijk voorkom 'Downloaden van extra gegevensbestanden is mislukt'.
## Installeer de Debian versie (3.6).
## Bij vereistenproblemen zorgt opdracht true voor afsluitwaarde 0.
sudo dpkg --install /tmp/ttf-mscorefonts-installer_3.6_all.deb || true

#1         Installeer fix Installer for Microsoft TrueType core fonts (4/5)
## Tijdelijk voorkom 'Downloaden van extra gegevensbestanden is mislukt'.
## Vereistenproblemen verhelpen.
sudo apt-get install --yes --fix-broken

#1         Installeer fix Installer for Microsoft TrueType core fonts (5/5)
## Tijdelijk voorkom 'Downloaden van extra gegevensbestanden is mislukt'.
## Opruimen.
rm /tmp/ttf-mscorefonts-installer_3.6_all.deb

# Einde installatiebestand.
