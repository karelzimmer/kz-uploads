#############################################################################
# Bestand:  setup-LinuxMint-17.1-desktop-algemeen.sh                        #
# Doel:     Instellingsbestand voor Linux Mint 17.1 desktop algemeen.       #
# Gebruik:  Door script setup, zie './setup.sh --help' (aanbevolen).        #
#           In het terminalvenster met script setup via                     #
#           './setup.sh setup-LinuxMint-17.1-desktop-algemeen.sh'           #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'bash setup-LinuxMint-17.1-desktop-algemeen.sh'.                #
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
# Versies:  1.0.0   2014-01-17  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.0
# RELEASE_DATE=2015-01-01

# Voor Gebruikersinstellingen opzoeken zie 'Linux-opdrachten-en-info'.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#1 [ 1/6 ] Klokweergave uitbreiden (1/3)
## Aanpassen via klik op klokje > Instellingen voor datum en tijd.
## Vink aan 'De datum weergeven' en sluit 'Datum en tijd' af.
gsettings set org.desktop.desktop.interface clock-show date true

#1 [ 2/6 ] Werkbladachtergrond instellen
## Aanpassen via Menu > Voorkeuren > Achtergronden.
gsettings set org.desktop.desktop.background picture-uri \
'file:///opt/wallpapers/H_by_Manuel_Sagredo.jpg'

#1 [ 3/6 ] Schermbeveiliging uitschakelen
## Aanpassen via Menu > Voorkeuren > Schermvergrendeling.
gsettings set org.desktop.desktop.screensaver lock-enabled false

#1 [ 4/6 ] Enkelklik om te openen activeren
## Aanpassen via starter Bestanden > Bewerken > Voorkeuren > Gedrag (tab).
gsettings set org.nemo.preferences click-policy 'single'

#1 [ 5/6 ] Reclames blokkeren - Adblock Plus (1/2)
## Voeg toe via Firefox webbrowser > Extra > Add-ons > Add-ons verkrijgen,
## zoek op adblock, installeer Adblock Plus.
wget    https://addons.mozilla.org/firefox/downloads/latest/1865/\
addon-1865-latest.xpi   \
        --output-document=/tmp/addon-1865-latest.xpi
#1         Reclames blokkeren - Adblock Plus (2/2)
firefox /tmp/addon-1865-latest.xpi

#1 [ 6/6 ] Mijn schijf in de cloud - Google Drive
bash setup-google-drive.sh
#3         *----------------------------------------------------------------*
#3         *                        Google Drive                            *
#3         * -------------------------------------------------------------- *
#3         * Instellen:                                                     *
#3         * -  Voor het instellen van Google Drive voer uit:               *
#3         *    ./setup.sh --info setup-google-drive.sh                     *
#3         *----------------------------------------------------------------*

# Einde instellingsbestand.
