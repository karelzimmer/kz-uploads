#############################################################################
# Bestand:  setup-xubuntu-16.04-desktop.sh                                  #
# Doel:     Instellingsbestand voor Ubuntu 16.04 LTS desktop.               #
# Gebruik:  In het terminalvenster met script setup (aanbevolen):           #
#           setup [~/bin/setup-xubuntu-16.04-desktop.sh]                    #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-xubuntu-16.04-desktop.sh                       #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           setup -s [~/bin/setup-xubuntu-16.04-desktop.sh]                 #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-11-21  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.0
# RELEASE_DATE=2017-11-21

# Voor Gebruikersinstellingen opzoeken zie Linux-info.txt.

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#

#@ubuntu
#1 [ 1/4 ] Stel in Xubuntu
##========================

## Stel in actie sluiten laptopklep
## --------------------------------
## Aanpassen via menu > Voorkeuren > Energiebeheerder > Laptopdeksel >
## Op netstroom.
xfconf-query --channel xfce4-power-manager \
--property /xfce4-power-manager/lid-action-on-ac --set 1

## Aanpassen via menu > Voorkeuren > Energiebeheerder > Laptopdeksel >
## Op accu.
xfconf-query --channel xfce4-power-manager \
--property /xfce4-power-manager/lid-action-on-battery --set 1

## Stel in enkelklik om te openen
## ------------------------------
## Aanpassen via Bestandbeheerder > Bewerken > Voorkeuren > Gedrag (tab).
## Als niet op Xfce zorgt opdracht true voor afsluitwaarde 0.
xfconf-query --channel thunar --property /misc-single-click --set true

## Aanpassen via rechtsklikken op bureaublad > Bureaublad-instellingen >
## Pictogrammen (tab).
xfconf-query --channel xfce4-desktop --property /desktop-icons/single-click \
--set true

## Stel in schermbeveiliging
## -------------------------
## Aanpassen via Instellingen > Energiebeheerder > Veiligheid.
gsettings set apps.light-locker lock-after-screensaver uint32 0

#@firefox
#1 [ 2/4 ] Stel in Firefox - webbrowser
##=====================================
## Add-on Video DownoadHelper.
wget --output-document=/tmp/addon-downloadhelper.xpi \
"https://addons.mozilla.org/firefox/downloads/latest/video-downloadhelper/\
addon-3006-latest.xpi"
#2
#2 Stel in Firefox - webbrowser
## ----------------------------
#2 1. Start Firefox webbrowser.
#2 2. Activeer enkelklik om het internetadres te selecteren via adres
#2    about:config en typ achter Zoeken click.
#2    Dubbelklik op de regel browser.urlbar.clickSelectsAll (de waarde
#2    waarde wordt true).
#2 3. Stel de startpagina in via menu > Voorkeuren > Algemeen.
#2 4. Wijzig PDF-lezer via Bewerken > Voorkeuren > Toepassingen.
#2    Zoek pdf en achter Portable Document Format (PDF) selecteer
#2    Documentweergave gebruiken (Standaard).
#2 5. Om Netflix te kijken, ga naar menu > Opties > Inhoud.
#2    Schakel het vakje naast DRM-inhoud afspelen uit en weer in.
#2    Als het vakje naast DRM-inhoud afspelen niet is ingeschakeld, schakel
#2    deze in.
#2    Herstart Firefox.
#2
#2 Stel in Video DownoadHelper voor Firefox (add-on)
## -------------------------------------------------
#2 1. Ga in Firefox naar Menu > Add-ons.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-downloadhelper.xpi en klik op Openen.
#2 5. Klik op Installeren.

## Add-on GNotifier.
## Meldingen in "bubble".
wget --output-document=/tmp/addon-gnotifier.xpi \
"https://addons.mozilla.org/firefox/downloads/latest/gnotifier/platform:2/\
addon-685896-latest.xpi"
#2
#2 Stel in GNotifier voor Firefox (add-on)
## ---------------------------------------
#2 1. Ga in Firefox naar Menu > Add-ons.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-gnotifier.xpi en klik op Openen.
#2 5. Klik op Installeren.

## Add-on Unityfox Revived.
## Voortgangsbalk en actieve-downloads-teller.
wget --output-document=/tmp/addon-unityfox.xpi \
"https://addons.mozilla.org/firefox/downloads/latest/unityfox-revived/\
platform:2/addon-697237-latest.xpi"
#2
#2 Stel in Unityfox Revived voor Firefox (add-on)
## ----------------------------------------------
#2 1. Ga in Firefox naar Menu > Add-ons.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-unityfox.xpi en klik op Openen.
#2 5. Klik op Installeren.

#@libreoffice
#1 [ 3/4 ] Stel in LibreOffice - kantoorpakket
##============================================
: # Geen opdracht. Gebruik optie '--info-install' (-i) voor informatie.
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

#@thunderbird
#1 [ 4/4 ] Stel in Thunderbird - e-mail/nieuws
##============================================
: # Geen opdracht. Gebruik optie '--info-setup' (-i) voor informatie.
#2
#2 Stel in Thunderbird - e-mail/nieuws
## -----------------------------------
#2 1. Start Thunderbird e-mail/nieuws.
#2 2. Zet globaal zoeken uit via Bewerken > Voorkeuren > Geavanceerd >
#2    Algemeen (tab).
#2    Haal vinkje weg bij Globaal zoeken en indexer activeren.
#2 3. Bij gebruik van IMAP:
#2    Klik op Configuratie-editor en zoek naar mail.imap, dubbelklik
#2    op regel met mail.imap.expunge_option en wijzig de waarde van 0
#2    naar 2 en klik op OK.
#2    Sluit scherm about:config.
#2 4. Klik op Sluiten.
#2 5. Bij gebruik van IMAP:
#2    Ga naar Bewerken > Accountinstellingen > accountnaam.
#2    Klik op Serverinstellingen en onder Berichtenopslag vink aan
#2    Postvak IN opruimen ('Expunge') bij afsluiten en
#2    Prullenbak leegmaken bij afsluiten.
#2    Klik op Synchronisatie & schijfruimte.
#2    Haal vinkje weg bij Berichten voor deze account op deze computer
#2    bewaren.
#2    Klik op OK.
#2 6. Sluit Thunderbird e-mail/nieuws.
#2 7. Verwijder global-messages-db.sqlite in de Lokale map, voor de lokatie
#2    van deze map zie Serverinstellingen bij accountnaam.
#2 8. Bij gebruik van IMAP:
#2    Verwijder aanwezige e-mailbestanden zonder extensie (bijv. INBOX)
#2    in de Lokale map, voor de lokatie van deze map zie Serverinstellingen
#2    bij accountnaam.

## Add-on Google Agenda.
wget --output-document=/tmp/addon-calendar.xpi \
"https://addons.mozilla.org/thunderbird/downloads/latest/\
provider-for-google-calendar/addon-4631-latest.xpi"
#2
#2 Stel in Google Agenda voor Thunderbird (add-on)
## -----------------------------------------------
#2 1. Ga in Thunderbird naar Menu > Add-ons > Extensies.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-calendar.xpi en klik op Openen.
#2 5. Klik op Nu installeren.
#2 6. Ga naar Bestand > Nieuw > Agenda > Op het netwerk > Google Agenda.
#2    Voer het Google e-mailadres en wachtwoord in, en geef toestemming.
#2 LET OP afhankelijkheid met Thunderbird Lightning Agenda:
#2 Voor deze add-on dient add-on Thunderbird Lightning Agenda goed te werken.

## Add-on GNotifier.
## Meldingen in "bubble".
wget --output-document=/tmp/addon-gnotifier.xpi \
"https://addons.mozilla.org/firefox/downloads/latest/gnotifier/platform:2/\
addon-685896-latest.xpi"
#2
#2 Stel in GNotifier voor Thunderbird (add-on)
## -------------------------------------------
#2 1. Ga in Thunderbird naar Menu > Add-ons > Extensies.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-gnotifier.xpi en klik op Openen.
#2 5. Klik op Nu installeren.

## Add-on Manually sort folders.
wget --output-document=/tmp/addon-sort.xpi \
"https://addons.mozilla.org/thunderbird/downloads/latest/\
manually-sort-folders/addon-15102-latest.xpi"
#2
#2 Stel in Manually sort folders voor Thunderbird (add-on)
## -------------------------------------------------------
#2 1. Ga in Thunderbird naar Menu > Add-ons > Extensies.
#2 2. Klik op Hulpmiddelen voor alle add-ons (tandwiel-knop).
#2 3. Selecteer Add-on installeren via bestand.
#2 4. Ga naar /tmp en selecteer addon-sort.xpi en klik op Openen.
#2 5. Klik op Nu installeren.
#2 6. Klik op Manually Sort Folders en vervolgens op Voorkeuren.

# Einde instellingsbestand.
