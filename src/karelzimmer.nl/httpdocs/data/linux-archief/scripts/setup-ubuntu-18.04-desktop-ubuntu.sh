# shellcheck shell=bash
# ##############################################################################
# Bestand:  setup-ubuntu-18.04-desktop-ubuntu.sh
# Doel:     Instellingsbestand voor Ubuntu 18.04 LTS desktop op ubuntu *Live*
# Gebruik:  In het terminalvenster met script setup (aanbevolen):
#           setup /usr/local/bin/setup-ubuntu-18.04-desktop-ubuntu.sh
#      of:  Direct in het terminalvenster:
#           bash /usr/local/bin/setup-ubuntu-18.04-desktop-ubuntu.sh
#      of:  Kopieer een opdrachtregel en plak deze in het terminalvenster,
#           bijvoorbeeld via opdracht:
#           setup -s /usr/local/bin/setup-ubuntu-18.04-desktop-ubuntu.sh
# Auteur:   Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=03.01.06
# REL_DAT=2019-12-07
# REL_MSG='Invoering changelog in pakket scripts'

# ------------------------------------------------------------------------------
# Gebruikersinstellingen wijzigen
# ------------------------------------------------------------------------------
#1 Gnome aanpassen
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/'ubiquity.desktop', //")"

#@bluefish
#1 Bluefish web en programmeurs-editor
:
#2 1. Start Bluefish.
#2 2. Zet via Bewerken > Voorkeuren > Initiele document instellingen de
#2    Tab breedte op 4 en vink aan
#2    Gebruik spaties voor inspringen, geen tabs.

#@gedit
#1 Gedit teksteditor
gsettings set org.gnome.gedit.plugins active-plugins "['sort','spell','smartspaces','changecase','zeitgeistplugin','filebrowser','docinfo','time','codecomment','modelines']"
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor right-margin-position 80
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor wrap-last-split-mode 'char'
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'char'
gsettings set org.gnome.gedit.preferences.print print-font-body-pango 'Monospace 8.5'
gsettings set org.gnome.gedit.preferences.print print-header true
gsettings set org.gnome.gedit.preferences.print print-line-numbers 1
gsettings set org.gnome.gedit.preferences.print print-syntax-highlighting true
gsettings set org.gnome.gedit.preferences.print print-wrap-mode 'char'
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.gedit.desktop'; then gsettings set org.gnome.shell favorite-apps "['org.gnome.gedit.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    gsettings reset org.gnome.gedit.plugins active-plugins
#3    gsettings reset org.gnome.gedit.preferences.editor bracket-matching
#3    gsettings reset org.gnome.gedit.preferences.editor display-line-numbers
#3    gsettings reset org.gnome.gedit.preferences.editor display-right-margin
#3    gsettings reset org.gnome.gedit.preferences.editor highlight-current-line
#3    gsettings reset org.gnome.gedit.preferences.editor insert-spaces
#3    gsettings reset org.gnome.gedit.preferences.editor right-margin-position
#3    gsettings reset org.gnome.gedit.preferences.editor tabs-size
#3    gsettings reset org.gnome.gedit.preferences.editor wrap-last-split-mode
#3    gsettings reset org.gnome.gedit.preferences.editor wrap-mode
#3    gsettings reset org.gnome.gedit.preferences.print print-font-body-pango
#3    gsettings reset org.gnome.gedit.preferences.print print-header
#3    gsettings reset org.gnome.gedit.preferences.print print-line-numbers
#3    gsettings reset org.gnome.gedit.preferences.print print-syntax-highlighting
#3    gsettings reset org.gnome.gedit.preferences.print print-wrap-mode
#3    gsettings reset org.gnome.shell favorite-apps

#@icaclient
#1 Citrix Workspace app (v/h Citrix Receiver, aka ICA Client) telewerken
xdg-mime default wfica.desktop application/x-ica
#2 1. Start Firefox webbrowser.
#2 2. Ga naar menu > Voorkeuren > Bestanden en Toepassingen.
#2 3. Zoek ica en zorg dat bij Citrix ICA-instellingen is geselecteerd
#2    Citrix Receiver Engine gebruiken.
#2 4. Ga naar https://telewerkportaal.rabobank.nl, log in, en stel vast dat
#2    het inloggen op het Telewerkportaal werkt.

#@terminal
#1 GNOME Terminal
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.Terminal.desktop'; then gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#2 1. Start Terminalvenster.
#2 2. Ga naar Bewerken > Voorkeuren.
#2 3. Onder Profielen klik op Naamloos.
#2 4. Vul in achter Oorspronkelijke afmeting van de terminal:
#2    206 kolommen en 62 rijen, en klik op Sluiten.

#1 Bureaubladachtergrond wijzigen

#1 Bureaubladachtergrond wijzigen
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/scripts/gnome.png'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/scripts/gnome.png'
#3 Start Terminalvenster en typ, of kopieer en plak:
#3    gsettings reset org.gnome.desktop.background picture-uri
#3    gsettings reset org.gnome.desktop.screensaver picture-uri

# Einde instellingsbestand
