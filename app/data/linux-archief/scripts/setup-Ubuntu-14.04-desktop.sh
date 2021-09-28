#############################################################################
# Bestand:  setup-Ubuntu-14.04-desktop-algemeen.sh                          #
# Doel:     Algemeen instellingsbestand voor Ubuntu 14.04 LTS desktop.      #
# Gebruik:  In het terminalvenster met script setup (aanbevolen):           #
#           setup setup-Ubuntu-14.04-desktop-algemeen.sh                    #
#           Direct in het terminalvenster:                                  #
#           bash setup-Ubuntu-14.04-desktop-algemeen.sh                     #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld opdracht via 'setup -s'.                           #
# Gebruikt: start-installatie.desktop  (starter Start installatie)          #
#           youtube-downloader.desktop (starter YouTube downloader)         #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0 NL).                                #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-01-17  Eerste versie.                              #
#           2.0.0   2014-01-31  Naam bestand gewijzigd.                     #
#           3.0.0   2014-08-27  Recordsoorten gewijzigd.                    #
#############################################################################
# VERSION_NUMBER=3.29.2
# RELEASE_DATE=2016-04-06

# Voor Gebruikersinstellingen opzoeken zie Linux-info.txt.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#

#2 +------------------------------------------------------------------------+
#2 |                            *** Algemeen ***                            |
#2 +------------------------------------------------------------------------+
#2 | Gebruik (tenzij anders aangegeven):                                    |
#2 | -  Klik op het Ubuntu-logo linksboven in de Starter of druk éénmaal    |
#2 |    (kort) op de Super-toets¹.                                          |
#2 |    Dit open de Snelzoeker, zoek het programma en klik erop.            |
#2 |    Sleep het programma naar de gewenste plek in de Starter, of klik    |
#2 |    rechts op het programma en kies In starter vastzetten, of           |
#2 |    Start Terminalvenster en typ:                                       |
#2 |    setup -i                                                            |
#2 |    volg de aanwijzingen bij het programma                              |
#2 |                                                                        |
#2 |    ¹ De Super-toets is de Windows-toets of Apple-toets (druk lang voor |
#2 |      een overzicht van de Sneltoetsen).                                |
#2 +------------------------------------------------------------------------+

#1 [ 1/10] Aanmeldnaam in de menubalk tonen
## Aanpassen via Systeeminstellingen > Gebruikersaccounts.
gsettings set com.canonical.indicator.session show-real-name-on-panel true

#1 [ 2/10] Enkelklik om te openen activeren
## Aanpassen via starter Bestanden > Bestanden > Voorkeuren > Gedrag (tab).
gsettings set org.gnome.nautilus.preferences click-policy 'single'

#1 [ 3/10] Internetzoekresultaten in zoekresultaat uitsluiten
## Aanpassen via Systeeminstellingen > Beveiliging & Privicy > Zoeken (tab).
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'

#1 [ 4/10] Klokweergave uitbreiden (1/3)
## Aanpassen via Systeeminstellingen > Tijd en datum > Klok (tab).
gsettings set com.canonical.indicator.datetime show-date true
#1         Klokweergave uitbreiden (2/3)
gsettings set com.canonical.indicator.datetime show-day true
#1         Klokweergave uitbreiden (3/3)
gsettings set com.canonical.indicator.datetime show-week-numbers true

#1 [ 5/10] Schermbeveiliging uitschakelen
## Aanpassen via Systeeminstellingen > Helderheid en vergrendelen.
gsettings set org.gnome.desktop.screensaver lock-enabled false

#1 [ 6/10] Starter Start-installatie verwijderen
rm --verbose --force $HOME/Bureaublad/start-installatie.desktop

#1 [ 7/10] Mozilla Thunderbird mappen sorteren
wget --output-document=/tmp/addon-15102-latest.xpi \
https://addons.mozilla.org/thunderbird/downloads/latest/15102/\
addon-15102-latest.xpi
#2 +------------------------------------------------------------------------+
#2 |                   Mozilla Thunderbird mappen sorteren                  |
#2 +------------------------------------------------------------------------+
#2 | Gebruik:                                                               |
#2 | 1. Start Thunderbird e-mail/nieuws.                                    |
#2 | 2. Ga naar Extra's > Add-ons.                                          |
#2 | 3. Klik op Hulpmiddelen voor alle add-ons (schroevendraaier/sleutel-   |
#2 |    symbool).                                                           |
#2 | 4. Selecteer Add-on installeren via bestand.                           |
#2 | 5. Ga naar /tmp en selecteer addon-15102-latest.xpi en klik op Openen. |
#2 | 6. Klik op Manually Sort Folders en vervolgens op Voorkeuren.          |
#2 +------------------------------------------------------------------------+

#1 [ 8/10] Winkelsuggesties in zoekresultaat uitsluiten
## Aanpassen via Snelzoeker > Toepassingen-lens (de "A" onderin) >
## Resultaten filteren > Snelzoeker-plug-plugins > rechtsklik <pluginnaam> >
## Uitschakelen (vanwege privacy, Snelzoeker-plug-in van wit naar grijs).
gsettings set com.canonical.Unity.Lenses disabled-scopes "[\
'more_suggestions-amazon.scope',\
'more_suggestions-u1ms.scope',\
'more_suggestions-populartracks.scope',\
'music-musicstore.scope',\
'more_suggestions-ebay.scope',\
'more_suggestions-ubuntushop.scope',\
'more_suggestions-skimlinks.scope'\
]"

#1 [ 9/10] Werkbladachtergrond instellen
## Aanpassen via Systeeminstellingen > Uiterlijk > Uiterlijk (tab).
gsettings set org.gnome.desktop.background picture-uri \
'file:///opt/wallpapers/Klaproos.jpg'

#1 [10/10] Werkbladwisselaar inschakelen (1/2)
## Aanpassen via Systeeminstellingen > Uiterlijk > Gedrag (tab).
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
hsize 2
#1         Werkbladwisselaar inschakelen (2/2)
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
vsize 2

#2 +------------------------------------------------------------------------+
#2 |                       *** Gebruiker inrichten ***                      |
#2 +------------------------------------------------------------------------+
#2 | 1. Pas de aanmeldfoto van de gebruiker aan via de Snelzoeker, zoek geb |
#2 |    en klik op Gebruikersaccount.                                       |
#2 |    Aan de rechterkant, klik links naast <gebruiker> en selecteer       |
#2 |    <aanmeldfoto> (of neem een foto indien mogelijk).                   |
#2 |    Sluit Gebruikersaccount af.                                         |
#2 +------------------------------------------------------------------------+
#2 | ** Onderstaande stappen alléén uitvoeren bij een *eerste installatie*, |
#2 | ** niét nodig bij herinstalleren of opwaarderen (upgrade)              |
#2 +------------------------------------------------------------------------+
#2 | 2. Start Firefox webbrowser.                                           |
#2 |    2.1 Stel het papierformaat in via menu (rechtsboven) > Afdrukken >  |
#2 |        Pagina-instellingen > Papiergroote > A4.                        |
#2 |        Klik op Toepassen en vervolgens op Sluiten.                     |
#2 |    2.2 Activeer enkelklik om het internetadres te selecteren via adres |
#2 |        about:config en typ achter Zoeken click.                        |
#2 |        Dubbelklik op de regel browser.urlbar.clickSelectsAll (de       |
#2 |        waarde wordt true).                                             |
#2 |    2.3 Stel de startpagina in via menu > Voorkeuren > Algemeen.        |
#2 |    2.4 Wijzig PDF-lezer via Bewerken > Voorkeuren > Toepassingen.      |
#2 |        Zoek pdf en achter Portable Document Format (PDF) selecteer     |
#2 |        Documentweergave gebruiken (Standaard).                         |
#2 | 3. Start Mozilla Thunderbird E-mail/nieuws.                            |
#2 |    3.1 Stel het papierformaat in via Bestand > Pagina-instellingen >   |
#2 |        Papiergroote > A4 en klik op Toepassen.                         |
#2 |    3.2 Verstuur een test-E-mail.                                       |
#2 | 4. Open een LibreOffice-toepassing of een LibreOffice-document.        |
#2 |    4.1 Maak documenten standaard aan in het Microsoft-formaat via      |
#2 |        Extra > Opties > Laden/Opslaan > Algemeen.                      |
#2 |        Selecteer onder Standaard bestandsindeling en ODF-instellingen: |
#2 |        Documenttype    Altijd opslaan als                              |
#2 |        -------------   ---------------------------------------         |
#2 |        Tekstdocument   Microsoft Word 2007/2010/2013 XML               |
#2 |        Werkblad        Microsoft Excel 2007/2010/2013 XML              |
#2 |        Presentatie     Microsoft PowerPoint 2007/2010/2013 XML         |
#2 |    4.2 Klik op OK en sluit LibreOffice af.                             |
#2 | 5. Wijzig de standaardtoepassingen via de Snelzoeker, zoek det en klik |
#2 |    op Details.  Klik links op Standaardtoepassingen.                   |
#2 |    Achter Muziek en Video selecteer VLC Media Player.                  |
#2 |    Sluit Details af.                                                   |
#2 +------------------------------------------------------------------------+

# Einde instellingsbestand.
