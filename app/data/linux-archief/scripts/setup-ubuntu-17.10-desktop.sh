###############################################################################
# Bestand:  setup-ubuntu-17.10-desktop.sh
# Doel:     Instellingsbestand voor Ubuntu 17.10 desktop.
# Gebruik:  1. In het terminalvenster met script setup (aanbevolen):
#              setup ~/bin/setup-ubuntu-17.10-desktop.sh
#           2. Direct in het terminalvenster:
#              bash ~/bin/setup-ubuntu-17.10-desktop.sh
#           3. Een opdrachtregel kan ook uitgevoerd worden door deze eerst
#              te kopiëren, en daarna te plakken in het terminalvenster,
#              bijvoorbeeld via opdracht:
#              setup -s ~/bin/setup-ubuntu-17.10-desktop.sh
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)
# -----------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# -----------------------------------------------------------------------------
# Versies:  1.0.0   2017-10-28  Eerste versie.
###############################################################################
# VERSION_NUMBER=1.12.2
# RELEASE_DATE=2018-04-29

# Voor het opzoeken van gebruikersinstellingen zie: Linux-info.txt

#------------------------------------------------------------------------------
# Gebruikersinstellingen wijzigen
#------------------------------------------------------------------------------

#@ubuntu
#1 Stel in Ubuntu
## ==============

#2 Stel in aanmeldfoto
#2 -------------------
#2 1. Pas de aanmeldfoto van <gebruiker> aan via het Activiteitenoverzicht,
#2    zoek use en klik op Users.
#2 2. Aan de rechterkant, klik links naast <gebruiker> en selecteer een
#2    aanmeldfoto (of neem een foto indien mogelijk).
#2 3. Sluit Gebruikers af.
# Of via Systeemmenu > <gebruiker> > Accountinstellingen.

# Stel in actie aan-/uitknop
# Aanpassen via Instellingen > Energie > Pauzestand en uitschakelen >  Als de aan-/uitknop wordt ingedrukt.
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'

# Stel in datum tonen in klokweergave
# Aanpassen via Instellingen > Bovenbalk > Klok.
gsettings set org.gnome.desktop.interface clock-show-date true

# Stel in enkelklik om te openen
# Aanpassen via starter Bestanden > Bestanden > Voorkeuren > Gedrag (tab).
gsettings set org.gnome.nautilus.preferences click-policy 'single'

# Stel in favorieten
# Zet favorieten terug uit back-upbestand aangemaakt door script backup.  N.v.t. nieuwe installatie.
! [[ -e $HOME/.favorite-apps-backup ]] || gsettings set org.gnome.shell favorite-apps "$(cat $HOME/.favorite-apps-backup)"

# Zorg dat minimaal starter Hulp aanwezig is.
! [[ $(gsettings get org.gnome.shell favorite-apps) == *[ ]] || gsettings set org.gnome.shell favorite-apps "['yelp.desktop']"

# Favorieten verwijderen.  Aanpassen via rechtsklikken op starter > Uit favorieten verwijderen.
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/, 'evolution.desktop'//")"

gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/, 'rhythmbox.desktop'//")"

gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/, 'org.gnome.Photos.desktop'//")"

gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/, 'ubuntu-amazon-default.desktop'//")"

# Stel in Nautilus rechtsklik Nieuw document
touch "$HOME/Sjablonen/Leeg document"

# Stel in Nachtlicht
# Aanpassen via Instellingen > Apparaten > Schermen.
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

# Stel in schermbeveiliging
# Aanpassen via Instellingen > Privacy > Schermvergrendeling.
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Stel in terminalvenster opent nieuwe vensters in tabs
# Aanpassen via Voorkeuren > Nieuwe terminalvensters openen in.
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode 'tab'

# Stel in scherm-oriëntatie
# Aanpassen via Instellingen > Apparaten > Schermen > Oriëntatie.
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

# Stel in touchpad
# Aanpassen via Instellingen > Apparaten > Muis en touchpad > Tikken om te klikken.
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Stel in weeknummers tonen in agenda
# Aanpassen via Instellingen > Bovenbalk > Agenda.
gsettings set org.gnome.desktop.calendar show-weekdate true

#@gedit
#1 Stel in gedit teksteditor
## =========================
# Plug-ins activeren.
# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor wrap-last-split-mode 'char'

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'char'

# Aanpassen via Teksteditor > Voorkeuren > Plug-ins (tab).
gsettings set org.gnome.gedit.plugins active-plugins "['sort','spell','smartspaces','changecase','zeitgeistplugin','filebrowser','docinfo','time','codecomment','modelines']"

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor bracket-matching true

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor display-right-margin true

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true

# Aanpassen via Teksteditor > Voorkeuren > Beeld (tab).
gsettings set org.gnome.gedit.preferences.editor right-margin-position 79

# Aanpassen via Teksteditor > Voorkeuren > Editor (tab).
gsettings set org.gnome.gedit.preferences.editor insert-spaces true

# Aanpassen via Teksteditor > Voorkeuren > Editor (tab).
gsettings set org.gnome.gedit.preferences.editor tabs-size 4

# Aanpassen via menu > Afdrukken > Teksteditor (tab).
gsettings set org.gnome.gedit.preferences.print print-syntax-highlighting true

# Aanpassen via menu > Afdrukken > Teksteditor (tab).
gsettings set org.gnome.gedit.preferences.print print-line-numbers 1

# Aanpassen via menu > Afdrukken > Teksteditor (tab).
gsettings set org.gnome.gedit.preferences.print print-header true

# Aanpassen via menu > Afdrukken > Teksteditor (tab).
gsettings set org.gnome.gedit.preferences.print print-font-body-pango 'Monospace 8.5'

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

: # [ 1/3 ] Video DownloadHelper (Firefox add-on)
# -----------------------------------------------
# id={b9db16a4-6edc-47ec-a1f4-b86292ed211d}
# Verwijder de per-user add-on.
rm --force $HOME/.mozilla/firefox/*/extensions/{b9db16a4-6edc-47ec-a1f4-b86292ed211d}.xpi

#3 Verwijder Video DownloadHelper (Firefox add-on)
#3 -----------------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Video DownloadHelper klik op Uitschakelen of Verwijderen.

: # [ 2/3 ] Adblock Plus (Firefox add-on)
# ---------------------------------------
# id={d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}
# Verwijder de per-user add-on.
rm --force $HOME/.mozilla/firefox/*/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi

#3 Verwijder Adblock Plus (Firefox add-on)
#3 ---------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Adblock Plus klik op Uitschakelen of Verwijderen.

: # [ 3/3 ] GNOME Shell integratie (Firefox add-on)
# -------------------------------------------------
# id=chrome-gnome-shell@gnome.org
# Verwijder de per-user add-on.
rm --force $HOME/.mozilla/firefox/*/extensions/chrome-gnome-shell@gnome.org.xpi

#3 Verwijder GNOME Shell integratie (Firefox add-on)
#3 -------------------------------------------------
#3 1. Ga in Firefox naar menu > Add-ons (Ctrl+Shift+A).
#3 2. Klik links op Extensies.
#3 3. Bij Gnome-shell-integratie klik op Uitschakelen of Verwijderen.

#@gnome
#1 Stel in GNOME desktopomgeving
## =============================

# Verwijder de per-user extensies en activeer de per-machine/system-wide extensies.

: # [ 1/5 ] Alternate Tab (GNOME extensie)
# ----------------------------------------
# pk=15, uuid=alternate-tab@gnome-shell-extensions.gcampax.github.com
# Verwijder de per-user extensie.
rm --force --recursive $HOME/.local/share/gnome-shell/extensions/alternate-tab@gnome-shell-extensions.gcampax.github.com

# Activeer de per-machine/system-wide extensie.
gsettings get org.gnome.shell enabled-extensions | grep --quiet --regexp='alternate-tab@gnome-shell-extensions.gcampax.github.com' || gnome-shell-extension-tool --enable-extension=alternate-tab@gnome-shell-extensions.gcampax.github.com

#3 Verwijder Alternate Tab (GNOME extensie)
#3 ----------------------------------------
#3 1. Ga naar https://extensions.gnome.org/local
#3 2. Bij Alternate Tab, zet schuifje op OFF of klik op kruisje.

# Schakel tussen applicaties op alle werkbladen, niet alleen de actieve.
# Of via Afstellingen (GNOME Tweak Tool) > Uitbreidingen > Alternatetab >
# Instellingen.
gsettings set org.gnome.shell.window-switcher current-workspace-only false

: # [2/5] Better Volume Indicator (GNOME extensie)
# ------------------------------------------------
# pk=759, uuid=bettervolume@tudmotu.com
# Verwijder de per-user extensie.
rm --force --recursive $HOME/.local/share/gnome-shell/extensions/bettervolume@tudmotu.com

# Activeer de per-machine/system-wide extensie
gsettings get org.gnome.shell enabled-extensions | grep --quiet --regexp='bettervolume@tudmotu.com' || gnome-shell-extension-tool --enable-extension=bettervolume@tudmotu.com

#3 Verwijder Better Volume Indicator (GNOME extensie)
#3 --------------------------------------------------
#3 1. Ga naar https://extensions.gnome.org/local
#3 2. Bij Better Volume Indicator, zet schuifje op OFF of klik op kruisje.

: # [ 3/5 ] Refresh Wifi Connections (GNOME extensie)
# ---------------------------------------------------
# pk=905, uuid=refresh-wifi@kgshank.net
# Verwijder de per-user extensie.
rm --force --recursive $HOME/.local/share/gnome-shell/extensions/refresh-wifi@kgshank.net

# Activeer de per-machine/system-wide extensie
gsettings get org.gnome.shell enabled-extensions | grep --quiet --regexp='refresh-wifi@kgshank.net' || gnome-shell-extension-tool --enable-extension=refresh-wifi@kgshank.net

#3 Verwijder Refresh Wifi Connections (GNOME extensie)
#3 ---------------------------------------------------
#3 1. Ga naar https://extensions.gnome.org/local
#3 2. Bij Refresh Wifi Connections, zet schuifje op OFF of klik op kruisje.

: # [ 4/5 ] TopIcons Plus (GNOME extensie)
# ----------------------------------------
# pk=1031, uuid=TopIcons@phocean.net
# Verwijder de per-user extensie.
rm --force --recursive $HOME/.local/share/gnome-shell/extensions/TopIcons@phocean.net

# Activeer de per-machine/system-wide extensie
gsettings get org.gnome.shell enabled-extensions | grep --quiet --regexp='TopIcons@phocean.net' || gnome-shell-extension-tool --enable-extension=TopIcons@phocean.net

#3 Verwijder TopIcons Plus (GNOME extensie)
#3 ----------------------------------------
#3 1. Ga naar https://extensions.gnome.org/local
#3 2. Bij TopIcons Plus, zet schuifje op OFF of klik op kruisje.

: # [ 5/5 ] Workspace Indicator (GNOME extensie)
# ----------------------------------------------
# pk=21, uuid=workspace-indicator@gnome-shell-extensions.gcampax.github.com
# Verwijder de per-user extensie.
rm --force --recursive $HOME/.local/share/gnome-shell/extensions/workspace-indicator@gnome-shell-extensions.gcampax.github.com

# Activeer de per-machine/system-wide extensie
gsettings get org.gnome.shell enabled-extensions | grep --quiet --regexp='workspace-indicator@gnome-shell-extensions.gcampax.github.com' || gnome-shell-extension-tool --enable-extension=workspace-indicator@gnome-shell-extensions.gcampax.github.com

#3 Verwijder Workspace Indicator (GNOME extensie)
#3 ----------------------------------------------
#3 1. Ga naar https://extensions.gnome.org/local
#3 2. Bij Workspace Indicator, zet schuifje op OFF of klik op kruisje.

#@google-chrome
#1 Stel in Google Chrome webbrowser
## ================================
# Starter (boven)aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='google-chrome.desktop' || gsettings set org.gnome.shell favorite-apps "$(echo "['google-chrome.desktop', "$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}'))"

#@keepassx
#1 Stel in KeePassX wachtwoordkluis
## ================================
# Starter (onder)aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='keepassx.desktop' || gsettings set org.gnome.shell favorite-apps "$(echo $(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}')", 'keepassx.desktop']")"

#@libreoffice
#1 Stel in LibreOffice kantoorpakket
## =================================
: # Geen opdracht; gebruik optie '--info-setup' voor informatie.

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

#@skype
#1 Stel in Skype beeldbellen over internet
## =======================================
# Starter (onder)aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='skypeforlinux.desktop' || gsettings set org.gnome.shell favorite-apps "$(echo $(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}')", 'skypeforlinux.desktop']")"

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

# Starter (boven)aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='thunderbird.desktop' || gsettings set org.gnome.shell favorite-apps "$(echo "['thunderbird.desktop', "$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}'))"

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
