#############################################################################
# Bestand:  setup-Ubuntu-14.10-desktop-algemeen.sh                          #
# Doel:     Instellingsbestand voor Ubuntu 14.10 desktop algemeen.          #
# Gebruik:  Door script setup, zie './setup.sh --help' (aanbevolen).        #
#           In het terminalvenster met script setup via                     #
#           './setup.sh setup-Ubuntu-14.10-desktop-algemeen.sh'             #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'bash setup-Ubuntu-14.10-desktop-algemeen.sh'.                  #
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
# Versies:  1.0.0   2014-10-11  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.6.0
# RELEASE_DATE=2015-04-23

# Voor Gebruikersinstellingen opzoeken zie 'Linux-opdrachten-en-info'.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#1 [ 1/9 ] Klokweergave uitbreiden (1/3)
## Aanpassen via Systeeminstellingen > Tijd en datum > Klok (tab).
gsettings set com.canonical.indicator.datetime show-date true
#1         Klokweergave uitbreiden (2/3)
gsettings set com.canonical.indicator.datetime show-day true
#1         Klokweergave uitbreiden (3/3)
gsettings set com.canonical.indicator.datetime show-week-numbers true

#1 [ 2/9 ] Favoriete programma's in de starter vastzetten
## Aanpassen via rechtsklik op starter-pictogram > in starter vastzetten
gsettings set com.canonical.Unity.Launcher favorites "[\
'application://nautilus.desktop','application://firefox.desktop',\
'application://thunderbird.desktop','application://google-chrome.desktop',\
'application://keepassx.desktop',\
'application://libreoffice-writer.desktop',\
'application://libreoffice-calc.desktop',\
'application://libreoffice-impress.desktop',\
'application://ubuntu-software-center.desktop',\
'application://unity-control-center.desktop',\
'application://gnome-terminal.desktop',\
'unity://expo-icon','unity://devices']"

#1 [ 3/9 ] Winkelsuggesties in zoekresultaat uitsluiten
## Aanpassen via Snelzoeker > Toepassingen-lens > Dash plugins > rechtsklik 
## <pluginnaam> > Uitschakelen (vanwege privacy).
gsettings set com.canonical.Unity.Lenses disabled-scopes "[\
'more_suggestions-amazon.scope','more_suggestions-u1ms.scope',\
'more_suggestions-populartracks.scope','music-musicstore.scope',\
'more_suggestions-ebay.scope','more_suggestions-ubuntushop.scope',\
'more_suggestions-skimlinks.scope']"

#1 [ 4/9 ] Werkbladwisselaar inschakelen (1/2)
## Aanpassen via Systeeminstellingen > Uiterlijk > Gedrag (tab).
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
hsize 2
#1         Werkbladwisselaar inschakelen (2/2)
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
vsize 2

#1 [ 5/9 ] Werkbladachtergrond instellen
## Aanpassen via Systeeminstellingen > Uiterlijk > Uiterlijk (tab).
gsettings set org.gnome.desktop.background picture-uri \
'file:///opt/wallpapers/Klaproos.jpg'

#1 [ 6/9 ] Schermbeveiliging uitschakelen
## Aanpassen via Systeeminstellingen > Helderheid en vergrendelen.
gsettings set org.gnome.desktop.screensaver lock-enabled false

#1 [ 7/9 ] Enkelklik om te openen activeren
## Aanpassen via starter Bestanden > Bestanden > Voorkeuren > Gedrag (tab).
gsettings set org.gnome.nautilus.preferences click-policy 'single'

#1 [ 8/9 ] Reclames blokkeren - Adblock Plus (1/2)
## Voeg toe via Firefox webbrowser > Extra > Add-ons > Add-ons verkrijgen,
## zoek op adblock, installeer Adblock Plus.
wget    https://addons.mozilla.org/firefox/downloads/latest/1865/\
addon-1865-latest.xpi   \
        --output-document=/tmp/addon-1865-latest.xpi
#1         Reclames blokkeren - Adblock Plus (2/2)
firefox /tmp/addon-1865-latest.xpi

#1 [ 9/9 ] Mijn schijf in de cloud - Google Drive
bash setup-google-drive.sh
#3         *----------------------------------------------------------------*
#3         *                        Google Drive                            *
#3         * -------------------------------------------------------------- *
#3         * Instellen:                                                     *
#3         * -  Voor het instellen van Google Drive voer uit:               *
#3         *    ./setup.sh --info setup-google-drive.sh                     *
#3         *----------------------------------------------------------------*
#2
#3         *----------------------------------------------------------------*
#3         *                        Gebruiker inrichten                     *
#3         * -------------------------------------------------------------- *
#3         * Afronden:                                                      *
#3         * 1. Pas de aanmeldfoto van de gebruiker aan via de Snelzoeker,  *
#3         *    zoek geb en klik op Gebruikersaccount.                      *
#3         *    Aan de rechterkant, klik links naast <gebruiker> en         *
#3         *    selecteer <aanmeldfoto> (of neem een foto indien mogelijk). *
#3         *    Sluit Gebruikersaccount af.                                 *
#3         * 2. Start Firefox webbrowser.                                   *
#3         *    2.1 Stel het papierformaat in via menu (rechtsboven) >      *
#3         *        Afdrukken > Pagina-instellingen > Papiergroote > A4.    *
#3         *        Klik op Toepassen en vervolgens op Sluiten.             *
#3         *    2.2 Activeer enkelklik om het internetadres te selecteren   *
#3         *        via adres about:config en typ achter Zoeken click.      *
#3         *        Dubbelklik op de regel browser.urlbar.clickSelectsAll   *
#3         *        (de waarde wordt true).                                 *
#3         *    2.3 Stel de startpagina in via menu > Voorkeuren > Algemeen.*
#3         *    2.4 Wijzig PDF-lezer via Bewerken > Voorkeuren >            *
#3         *        Toepassingen.                                           *
#3         *        Zoek pdf en achter Portable Document Format (PDF)       *
#3         *        selecteer Documentweergave gebruiken (Standaard).       *
#3         * 3. Start Mozilla Thunderbird E-mail/nieuws.                    *
#3         *    3.1 Stel het papierformaat in via Bestand > Pagina-         *
#3         *        instellingen > Papiergroote > A4 en klik op Toepassen.  *
#3         *    3.2 Verstuur een test-E-mail.                               *
#3         * 4. Open een LibreOffice-toepassing of LibreOffice-document.    *
#3         *    4.1 Maak documenten standaard aan in het Microsoft-formaat  *
#3         *        via Extra > Opties > Laden/Opslaan > Algemeen.          *
#3         *        Selecteer onder Standaard bestandsindeling en           *
#3         *        ODF-instellingen:                                       *
#3         *        Documenttype    Altijd opslaan als                      *
#3         *        -------------   --------------------------------------- *
#3         *        Tekstdocument   Microsoft Word 2007/2010/2013 XML       *
#3         *        Werkblad        Microsoft Excel 2007/2010/2013 XML      *
#3         *        Presentatie     Microsoft PowerPoint 2007/2010/2013 XML *
#3         *    4.2 Klik op OK en sluit LibreOffice af.                     *
#3         * 5. Wijzig de standaardtoepassingen via de Snelzoeker, zoek det *
#3         *    en klik op Details.  Klik links op Standaardtoepassingen.   *
#3         *    Achter Muziek en Video selecteer VLC Media Player.          *
#3         *    Sluit Details af.                                           *
#3         *----------------------------------------------------------------*

# Einde instellingsbestand.
