#############################################################################
# Bestand:  setup-Debian-8-desktop-algemeen.sh                              #
# Doel:     Instellingsbestand voor Debian 8 desktop algemeen.              #
# Gebruik:  Door script setup, zie 'setup --help' (aanbevolen).             #
#           In het terminalvenster met script setup via                     #
#           'setup setup-Debian-8-desktop-algemeen.sh' (aanbevolen).        #
#           Direct in het terminalvenster via                               #
#           'bash setup-Debian-8-desktop-algemeen.sh'.                      #
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
# Versies:  1.0.0   2015-06-08  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.3.0
# RELEASE_DATE=2015-06-27

# Voor Gebruikersinstellingen opzoeken zie Linux-opdrachten-en-info.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#1 [ 1/9 ] Aliassen instellen (1/2)
sed     --in-place=.setup-algemeen-$(date +%Y-%m-%d-%H.%M.%S)   \
        --expression='s/#alias/alias/g'                         \
        $HOME/.bashrc
#1         Aliassen instellen (2/2)
## Effectueren.
source $HOME/.bashrc

#1 [ 2/9 ] Klokweergave uitbreiden (1/2)
## Aanpassen via ?.
gsettings set org.gnome.desktop.interface clock-show-date true
#1         Klokweergave uitbreiden (2/2)
gsettings set org.gnome.shell.calendar show-weekdate true

#1 [ 3/9 ] Letterweergave verbeteren (1/2)
## Zie: https://wiki.debian.org/Fonts#Subpixel-hinting_and_Font-smoothing
wget    http://karelzimmer.nl/downloads/debian/home.fonts.conf \
        --output-document=/tmp/home.fonts.conf
#1         Letterweergave verbeteren (2/2)
cp /tmp/home.fonts.conf $HOME/.fonts.conf

#1 [ 4/9 ] Favoriete programma's in de starter vastzetten
## Aanpassen via rechtsklik in de snelstarter op favoriet-pictogram > 
## Aan favorieten toevoegen
gsettings set org.gnome.shell favorite-apps "[\
'org.gnome.Nautilus.desktop',\
'iceweasel.desktop',\
'icedove.desktop',\
'google-chrome.desktop',\
'keepassx.desktop',\
'rhythmbox.desktop',\
'libreoffice-writer.desktop',\
'gnome-control-center.desktop',\
'yelp.desktop'\
]"

#1 [ 5/9 ] Werkbladachtergrond instellen
## Aanpassen via Instellingen > Achtergrond > Achtergrond (knop).
gsettings set org.gnome.desktop.background picture-uri \
'file:///opt/wallpapers/Klaproos.jpg'

#1 [ 6/9 ] Schermbeveiliging uitschakelen
## Aanpassen via ?.
gsettings set org.gnome.desktop.screensaver lock-enabled false

#1 [ 7/9 ] Tap(pen) op touchpad is enkel/dubbelklik
## Aanpassen via ?.
gsettings set org.gnome.nautilus.preferences click-policy 'single'

#1 [ 8/9 ] Enkelklik om te openen activeren
## Aanpassen via ?.
gsettings set org.gnome.settings-daemon.peripherals.touchpad tap-to-click \
true

#1 [ 9/9 ] Mijn schijf in de cloud - Google Drive
#bash setup-google-drive.sh
#2         +----------------------------------------------------------------+
#2         |                        Google Drive                            |
#2         |----------------------------------------------------------------|
#2         | TIJDELIJK BUITEN BEDRIJF                                       |
#2         +----------------------------------------------------------------+
##2         +----------------------------------------------------------------+
##2         |                        Google Drive                            |
##2         |----------------------------------------------------------------|
##2         | Instellen:                                                     |
##2         | -  Voor het instellen van Google Drive voer uit:               |
##2         |    setup --info setup-google-drive.sh                          |
##2         +----------------------------------------------------------------+

#2         +----------------------------------------------------------------+
#2         |                        Gebruiker inrichten                     |
#2         |----------------------------------------------------------------|
#2         | 1. Pas de aanmeldfoto van de gebruiker aan via                 |
#2         |    Activiteitenoverzicht, zoek geb en klik op Gebruikers.      |
#2         |    Aan de rechterkant, klik links naast <gebruiker> en         |
#2         |    selecteer <aanmeldfoto> (of neem een foto indien mogelijk). |
#2         |    Sluit Gebruikersaccount af.                                 |
#2         |----------------------------------------------------------------|
#2         |    Onderstaande stappen alleen uitvoeren bij een               |
#2         |    *eerste installatie*, niet nodig bij                        |
#2         |    herinstalleren of opwaarderen (upgrade)                     |
#2         |----------------------------------------------------------------|
#2         | 2. Start Iceweasel webbrowser via de Zijbalk (favoriete        |
#2         |    toepassingen).                                              |
#2         |    2.1 Stel het papierformaat in via menu (rechtsboven) >      |
#2         |        Afdrukken > Pagina-instellingen > Papiergroote > A4.    |
#2         |        Klik op Toepassen en vervolgens op Sluiten.             |
#2         |    2.2 Activeer enkelklik om het internetadres te selecteren   |
#2         |        via adres about:config en typ achter Zoeken click.      |
#2         |        Dubbelklik op de regel browser.urlbar.clickSelectsAll   |
#2         |        (de waarde wordt true).                                 |
#2         |    2.3 Stel de startpagina in via menu > Voorkeuren > Algemeen.|
#2         |    2.4 Wijzig PDF-lezer via Bewerken > Voorkeuren >            |
#2         |        Toepassingen.                                           |
#2         |        Zoek pdf en achter Portable Document Format (PDF)       |
#2         |        selecteer Documentweergave gebruiken (Standaard).       |
#2         | 3. Start Icedove E-mail/nieuws.                                |
#2         |    3.1 Stel het papierformaat in via Bestand > Pagina-         |
#2         |        instellingen > Papiergroote > A4 en klik op Toepassen.  |
#2         |    3.2 Verstuur een test-E-mail.                               |
#2         | 4. Open een LibreOffice-toepassing of LibreOffice-document.    |
#2         |    4.1 Maak documenten standaard aan in het Microsoft-formaat  |
#2         |        via Extra > Opties > Laden/Opslaan > Algemeen.          |
#2         |        Selecteer onder Standaard bestandsindeling en           |
#2         |        ODF-instellingen:                                       |
#2         |        Documenttype    Altijd opslaan als                      |
#2         |        -------------   --------------------------------------- |
#2         |        Tekstdocument   Microsoft Word 2007/2010/2013 XML       |
#2         |        Werkblad        Microsoft Excel 2007/2010/2013 XML      |
#2         |        Presentatie     Microsoft PowerPoint 2007/2010/2013 XML |
#2         |    4.2 Klik op OK en sluit LibreOffice af.                     |
#2         | 5. Wijzig de standaardtoepassingen via Activiteitenoverzicht,  |
#2         |    zoek det en klik op Details.                                |
#2         |    Klik links op Standaardtoepassingen.                        |
#2         |    Achter Muziek en Video selecteer VLC Media Player.          |
#2         |    Sluit Details af.                                           |
#2         +----------------------------------------------------------------+

# Einde instellingsbestand.
