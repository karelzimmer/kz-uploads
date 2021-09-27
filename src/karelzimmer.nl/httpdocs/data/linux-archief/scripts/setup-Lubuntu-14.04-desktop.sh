#############################################################################
# Bestand:  setup-Lubuntu-14.04-desktop-algemeen.sh                         #
# Doel:     Instellingsbestand voor Lubuntu 14.04 LTS desktop algemeen.     #
# Gebruik:  In het terminalvenster met script setup via                     #
#           './setup.sh --file=setup-Lubuntu-14.04-desktop-algemeen.sh'     #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'bash setup-Lubuntu-14.04-desktop-algemeen.sh'.                 #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst te  # 
#           kopiëren, en daarna te plakken in het terminalvenster.          #
# Gebruikt: -                                                               #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 3.0  #
# Nederland licentie (CC BY-SA 3.0 NL).                                     #
# Bezoek http://creativecommons.org/licenses/by-sa/3.0/nl/ om een kopie te  #
# zien van de licentie of stuur een brief naar Creative Commons,            #
# 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.      #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-04-06  Eerste versie.                              #
#           2.0.0   2014-08-27  Recordsoorten gewijzigd.                    #
#############################################################################
# VERSION_NUMBER=2.5.0
# RELEASE_DATE=2015-01-02

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#1 [ 1/2 ] Reclames blokkeren - Adblock Plus (1/2)
## Voeg toe via Firefox webbrowser > Extra > Add-ons > Add-ons verkrijgen,
## zoek op adblock, installeer Adblock Plus.
wget    https://addons.mozilla.org/firefox/downloads/latest/1865/\
addon-1865-latest.xpi   \
        --output-document=/tmp/addon-1865-latest.xpi
#1         Reclames blokkeren - Adblock Plus (2/2)
firefox /tmp/addon-1865-latest.xpi

#1 [ 2/2 ] Mijn schijf in de cloud - Google Drive
:
#3         *----------------------------------------------------------------*
#3         *                        Google Drive                            *
#3         * Instellen:                                                     *
#3         * -  Voor het instellen van Google Drive voer uit:               *
#3         *    ./install.sh --info --file=install-google-drive.sh          *
#3         *----------------------------------------------------------------*

# Einde instellingsbestand.
