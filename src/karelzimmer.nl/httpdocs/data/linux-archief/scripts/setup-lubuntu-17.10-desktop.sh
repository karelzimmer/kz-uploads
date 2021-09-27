###############################################################################
# Bestand:  setup-lubuntu-17.10-desktop.sh
# Doel:     Instellingsbestand voor Lubuntu 17.10 desktop.
# Gebruik:  1. In het terminalvenster met script setup (aanbevolen):
#              setup ~/bin/setup-lubuntu-17.10-desktop.sh
#           2. Direct in het terminalvenster:
#              bash ~/bin/setup-lubuntu-17.10-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst
#              te kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              setup -s ~/bin/setup-lubuntu-17.10-desktop.sh
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)
# -----------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -----------------------------------------------------------------------------
# Versies:  1.0.0   2017-11-21  Eerste versie.
###############################################################################
# VERSION_NUMBER=1.4.4
# RELEASE_DATE=2018-04-29

# Voor het opzoeken van gebruikersinstellingen zie: Linux-info.txt

#------------------------------------------------------------------------------
# Gebruikersinstellingen wijzigen
#------------------------------------------------------------------------------

#@lubuntu
#1 Stel in Lubuntu
## ===============

# Stel in enkelklik om te openen
# Aanpassen via Hulpmiddelen > Bestandbeheerder PCManFM > Bewerken > Voorkeuren.
sed --in-place --expression='s/single_click=0/single_click=1/g' "$HOME/.config/libfm/libfm.conf"

# Stel in schermbeveiliging
# Aanpassen via Instellingen > Energiebeheerder > Veiligheid.
gsettings set apps.light-locker lock-after-screensaver 0

# Stel in actie sluiten laptopklep (1/2)
# Aanpassen via menu > Voorkeuren > Energiebeheerder > Laptopdeksel > Op netstroom.  Als niet op een laptop zorgt '|| true' voor afsluitwaarde nul.
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-ac --set 1 || true

# Stel in actie sluiten laptopklep (2/2)
# Aanpassen via menu > Voorkeuren > Energiebeheerder > Laptopdeksel > Op accustroom.  Als niet op een laptop zorgt '|| true' voor afsluitwaarde nul.
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-battery --set 1 || true

#@firefox
#1 Stel in Firefox webbrowser
## ==========================

#2 Stel in Firefox webbrowser
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

# Verwijder de per-user add-ons, deze zijn per-machine/system-wide geïnstalleerd.

: # [ 1/2 ] Video DownloadHelper (Firefox add-on)
# -----------------------------------------------
# id={b9db16a4-6edc-47ec-a1f4-b86292ed211d}
# Verwijder de per-user add-on.
rm --force $HOME/.mozilla/firefox/*/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi

#3 Verwijder Video DownloadHelper (Firefox add-on)
#3 -----------------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Video DownloadHelper klik op Uitschakelen of Verwijderen.

: # [ 2/2 ] Adblock Plus (Firefox add-on)
# ---------------------------------------
# id={d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
# Verwijder de per-user add-on.
rm --force $HOME/.mozilla/firefox/*/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Adblock Plus klik op Uitschakelen of Verwijderen.

#@libreoffice
#1 Stel in LibreOffice kantoorpakket
## =================================
: # Geen opdracht; gebruik optie '--info-install' voor informatie.

#2 Stel in LibreOffice kantoorpakket
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
#1 Stel in Thunderbird e-mail/nieuws
## =================================

#2 Stel in Thunderbird e-mail/nieuws
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

# Verwijder onnodige authenticatie-verzoeken.
rm --force $HOME/.config/evolution/sources/*

# Verwijder de per-user add-ons, deze zijn per-machine/system-wide geïnstalleerd.

: # [ 1/2 ] Provider for Google Agenda (Thunderbird add-on)
# ---------------------------------------------------------
# id={a62ef8ec-5fdc-40c2-873c-223b8a6925cc}
# Verwijder de per-user add-on.
rm --force $HOME/.thunderbird/*/extensions/{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}.xpi

#2 Stel in Provider for Google Agenda (Thunderbird add-on)
#2 -------------------------------------------------------
#2 1. Ga in Thunderbird naar Bestand > Nieuw > Agenda > Op het netwerk >
#2    Google Agenda.
#2 2. Voer het Google e-mailadres en wachtwoord in, en geef toestemming.

#3 Verwijder Provider for Google Agenda (Thunderbird add-on)
#3 ---------------------------------------------------------
#3 1. Ga in Thunderbird naar Extra > Add-ons.
#3 2. Klik links op Extensies
#3 3. Bij Provider for Google Agenda klik op Uitschakelen of Verwijderen.

: # [ 2/2 ] Manually sort folders (Thunderbird add-on)
# ----------------------------------------------------
# id=tbsortfolders@xulforum.org
# Verwijder de per-user add-on.
rm --force $HOME/.thunderbird/*/extensions/tbsortfolders@xulforum.org.xpi

#2 Stel in Manually sort folders (Thunderbird add-on)
#2 --------------------------------------------------
#2 1. Ga in Thunderbird naar Extra > Mappen handmatig sorteren.

#3 Verwijder Manually sort folders (Thunderbird add-on)
#3 ----------------------------------------------------
#3 1. Ga in Thunderbird naar Extra > Add-ons.
#3 2. Klik links op Extensies
#3 3. Bij Manually sort folders klik op Uitschakelen of Verwijderen.

# Einde instellingsbestand.
