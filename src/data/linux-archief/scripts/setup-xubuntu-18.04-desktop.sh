# ###############################################################################
# Bestand:  setup-xubuntu-18.04-desktop.sh
# Doel:     Instellingsbestand voor Xubuntu 18.04 LTS desktop
# Gebruik:  1. In het terminalvenster met script setup (aanbevolen):
#              setup /usr/local/bin/setup-xubuntu-18.04-desktop.sh
#           2. Direct in het terminalvenster:
#              bash /usr/local/bin/setup-xubuntu-18.04-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst te
#              kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              setup -s /usr/local/bin/setup-xubuntu-18.04-desktop.sh
# Auteur:   Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# -------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -------------------------------------------------------------------------------
# Versies:  1.0.0   2018-05-02  Eerste versie
#           2.0.0   2018-07-28  Gebruik mappen volgens de Linux FHS standaard
# ###############################################################################
# VERSION_NUMBER=2.4.0
# RELEASE_DATE=2019-03-02

# shellcheck shell=bash
# Voor het opzoeken van gebruikersinstellingen zie Linux-info.txt

# -------------------------------------------------------------------------------
# Gebruikersinstellingen wijzigen
# -------------------------------------------------------------------------------

#@xubuntu
#1 Stel-in Xubuntu
## ===============

# Stel enkelklik om te openen in (1/2)
xfconf-query --channel thunar --create --type bool --property /misc-single-click --set true

# Stel enkelklik om te openen in (2/2)
xfconf-query --channel xfce4-desktop --create --type bool --property /desktop-icons/single-click --set true

# Stel schermbeveiliging in
gsettings set apps.light-locker lock-after-screensaver 0

# Stel actie sluiten laptopklep in
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-ac --set 1 || true

xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-battery --set 1 || true

#@firefox
#1 Stel-in Firefox webbrowser
## ==========================
# Geen opdracht
: # Geen opdracht; gebruik optie '--setup-info' of '--unsetup-info' voor meer informatie

#2 Stel-in Firefox webbrowser
#2 --------------------------
#2 1. Start Firefox webbrowser.
#2 2. Activeer enkelklik om het internetadres te selecteren via adres
#2    about:config en typ achter Zoeken click.
#2    Dubbelklik op de regel browser.urlbar.clickSelectsAll (de waarde
#2    waarde wordt true).
#2 3. Stel de startpagina in via menu > Voorkeuren > Algemeen.
#2 4. Wijzig PDF-lezer via menu > Voorkeuren > Bestanden en Toepassingen.
#2    Zoek pdf en achter Portable Document Format (PDF) selecteer
#2    Documentweergave gebruiken (Standaard).
#2 5. Om Netflix te kijken, ga naar menu > Opties > Inhoud.
#2    Schakel het vakje naast DRM-inhoud afspelen uit en weer in.
#2    Als het vakje naast DRM-inhoud afspelen niet is ingeschakeld, schakel
#2    deze in.
#2    Herstart Firefox.

#3 Verwijder Video DownloadHelper (Firefox add-on)
#3 -----------------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Video DownloadHelper klik op Uitschakelen of Verwijderen.

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Adblock Plus klik op Uitschakelen of Verwijderen.

#@libreoffice
#1 Stel-in LibreOffice kantoorpakket
## =================================
# Geen opdracht
: # Geen opdracht; gebruik optie '--setup-info' voor meer informatie

#2 Stel-in LibreOffice kantoorpakket
#2 ---------------------------------
#2 1. Start een LibreOffice-app of open een LibreOffice-document.
#2 2. Ga naar Extra > Opties > Laden/Opslaan > Algemeen.
#2 3. Selecteer onder Standaard bestandsindeling en ODF-instellingen:
#2    Documenttype    Altijd opslaan als
#2    -------------   ----------------------------------
#2    Tekstdocument   Microsoft Word 2007-2013 XML
#2    Werkblad        Microsoft Excel 2007-2013 XML
#2    Presentatie     Microsoft PowerPoint 2007-2013 XML
#2 4. Klik op OK en sluit LibreOffice af.

#@thunderbird
#1 Stel-in Thunderbird e-mail/nieuws
## =================================
# Geen opdracht
: # Geen opdracht; gebruik optie '--setup-info' of '--unsetup-info' voor meer informatie

#2 Stel-in Thunderbird e-mail/nieuws
#2 ---------------------------------
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

# Installeer/update de Thunderbird add-ons per-user want per-machine/systemwide werkt niet.
# Bepaal id van add-on: unzip -o *.xpi -d /tmp/ff/, check /tmp/ff/install.rdf

## Add-on Google Agenda.
: # [ 1/2 ] Provider for Google Calendar (Thunderbird add-on)
# -----------------------------------------------------------
# id={a62ef8ec-5fdc-40c2-873c-223b8a6925cc}.xpi
wget --output-document="$HOME/.thunderbird/$(awk -FPath= '/Path=/{print $2;exit}' $HOME/.thunderbird/profiles.ini)/extensions/{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}.xpi" 'https://addons.mozilla.org/thunderbird/downloads/latest/provider-for-google-calendar/addon-4631-latest.xpi'

#2 Stel in Provider for Google Agenda (add-on)
## -------------------------------------------
#2 1. Ga naar in Thunderbird naar menu > Add-ons > Provider for Google Agenda.
#2 2. Voer het Google e-mailadres en wachtwoord in, en geef toestemming.

#3 Verwijder Provider for Google Agenda (Thunderbird add-on)
#3 ---------------------------------------------------------
#3 1. Ga in Thunderbird naar menu > Add-ons > Add-ons.
#3 2. Bij Provider for Google Agenda klik op Uitschakelen of Verwijderen.

: # [ 2/2 ] Manually sort folders (Thunderbird add-on)
# ----------------------------------------------------
# id=tbsortfolders@xulforum.org
# Download add-on
wget --output-document="$HOME/.thunderbird/$(awk -FPath= '/Path=/{print $2;exit}' $HOME/.thunderbird/profiles.ini)/extensions/tbsortfolders@xulforum.org.xpi" https://addons.mozilla.org/thunderbird/downloads/latest/manually-sort-folders/addon-15102-latest.xpi

#2 Stel-in Manually sort folders (Thunderbird add-on)
#2 --------------------------------------------------
#2 1. Ga in Thunderbird naar menu > Add-ons > Manually Sort Folders.

#3 Verwijder Manually sort folders (Thunderbird add-on)
#3 ----------------------------------------------------
#3 1. Ga in Thunderbird naar menu > Add-ons > Add-ons.
#3 2. Bij Manually sort folders klik op Uitschakelen of Verwijderen.

#1 Herstart de computer
## ====================
# Start de computer opnieuw om de installatie te voltooien
# Geen opdracht
: # Geen opdracht; gebruik optie '--setup-info' voor meer informatie.

#2 Herstart de computer
#2 --------------------
#2 1. Start de computer opnieuw om de installatie te voltooien.

# Einde instellingsbestand
