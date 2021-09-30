#############################################################################
# Bestand:  setup-Ubuntu-16.04-desktop-algemeen.sh                          #
# Doel:     Algemeen instellingsbestand voor Ubuntu 16.04 LTS desktop.      #
# Gebruik:  In het terminalvenster met script setup (aanbevolen):           #
#           setup ~/bin/setup-Ubuntu-16.04-desktop-algemeen.sh              #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-Ubuntu-16.04-desktop-algemeen.sh               #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld opdracht via                                       #
#           'setup -s setup-Ubuntu-16.04-desktop-algemeen.sh'.              #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-03-25  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.27.1
# RELEASE_DATE=2017-06-08

# Voor Gebruikersinstellingen opzoeken zie Linux-info.txt.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#2
#2 Stel in <programma> (algemene instructie)
## -----------------------------------------
#2 1. Klik op het <programma>-icoon links in de Starter.
#2    -of-
#2    Klik op het Ubuntu-logo linksboven in de Starter of druk éénmaal (kort)
#2    op de Super-toets¹.
#2    Dit open de Snelzoeker, zoek het <programma> en klik erop.
#2 2. Sleep het <programma> naar de gewenste plek in de Starter, of klik
#2    rechts op het <programma> en kies In starter vastzetten.
#2 3. Start Terminalvenster en typ:
#2      setup -i
#2      volg de aanwijzingen bij het <programma>
## --------------------
#2 ¹  De Super-toets is de Windows-toets of Apple-toets (druk lang voor
#2    een overzicht van de Sneltoetsen).

#1 [ 1/17] Stel in aanmeldfoto
: # Geen opdracht. Gebruik optie info-setup (-i) voor informatie.
#2
#2 Stel in aanmeldfoto
## -------------------
#2 1. Pas de aanmeldfoto van de gebruiker aan via de Snelzoeker,
#2    zoek geb en klik op Gebruikersaccount.
#2 2. Aan de rechterkant, klik links naast <gebruiker> en selecteer
#2    <aanmeldfoto> (of neem een foto indien mogelijk).
#2 3. Sluit Gebruikersaccount af.

#1 [ 2/17] Stel in aanmeldnaam tonen in de menubalk
## Aanpassen via Systeeminstellingen > Gebruikersaccounts.
gsettings set com.canonical.indicator.session show-real-name-on-panel true

#1 [ 3/17] Stel in de Starter
## Amazon uit Starter verwijderen. 
gsettings set com.canonical.Unity.Launcher favorites \
"$(gsettings get com.canonical.Unity.Launcher favorites | \
sed s"|'application://ubuntu-amazon-default.desktop', ||")"

#1 [ 4/17] Stel in enkelklik om te openen
## Aanpassen via starter Bestanden > Bestanden > Voorkeuren > Gedrag (tab).
gsettings set org.gnome.nautilus.preferences click-policy 'single'

#1 [ 5/17] Stel in klokweergave
## Aanpassen via Systeeminstellingen > Tijd en datum > Klok (tab).
## Datum tonen.
gsettings set com.canonical.indicator.datetime show-date true
## Dag tonen.
gsettings set com.canonical.indicator.datetime show-day true
## Weeknummer tonen.
gsettings set com.canonical.indicator.datetime show-week-numbers true

#1 [ 6/17] Stel in schermbeveiliging
## Aanpassen via Systeeminstellingen > Helderheid en vergrendelen.
gsettings set org.gnome.desktop.screensaver lock-enabled false

#1 [ 7/17] Stel in terminalvenster opent nieuwe vensters in tabs
## Aanpassen via Voorkeuren > Nieuwe terminalvensters openen in.
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode 'tab'

#1 [ 8/17] Stel in werkbladwisselaar
## Aanpassen via Systeeminstellingen > Uiterlijk > Gedrag (tab).
## Twee bureaubladen horizontaal.
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
hsize 2
## Twee bureaubladen verticaal.
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
vsize 2

#1 [ 9/17] Stel in winkelsuggesties in zoekresultaat uitsluiten
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

#1 [10/17] Stel in Firefox - webbrowser
## Script getstarted past locatie /home/... aan.
bash /home/karel/scripts/setup-firefox.sh

#1 [13/17] Stel in Google Chrome 64-bit - webbrowser
## Script getstarted past locatie /home/... aan.
bash /home/karel/scripts/setup-google-chrome.sh

#1 [14/17] Stel in KeePassX - wachtwoordkluis
## Script getstarted past locatie /home/... aan.
bash /home/karel/scripts/setup-keepassx.sh

#1 [15/17] Stel in LibreOffice - kantoorpakket
: # Geen opdracht. Gebruik optie info-setup (-i) voor informatie.
#2
#2 Stel in LibreOffice - kantoorpakket
## -----------------------------------
#2 1. Start een LibreOffice-toepassing of open een LibreOffice-document.
#2 2. Ga naar Extra > Opties > Laden/Opslaan > Algemeen.
#2 3. Selecteer onder Standaard bestandsindeling en ODF-instellingen:
#2    Documenttype    Altijd opslaan als
#2    -------------   ----------------------------------
#2    Tekstdocument   Microsoft Word 2007-2013 XML
#2    Werkblad        Microsoft Excel 2007-2013 XML
#2    Presentatie     Microsoft PowerPoint 2007-2013 XML
#2 4. Klik op OK en sluit LibreOffice af.

#1 [16/17] Stel in Skype - (beeld)bellen over het internet
## Script getstarted past locatie /home/... aan.
bash /home/karel/scripts/setup-skype.sh

#1 [17/17] Stel in Thunderbird - e-mail/nieuws
## Script getstarted past locatie /home/... aan.
bash /home/karel/scripts/setup-thunderbird.sh

# Einde instellingsbestand.
