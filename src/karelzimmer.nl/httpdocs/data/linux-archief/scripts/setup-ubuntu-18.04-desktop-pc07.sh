# shellcheck shell=bash
# ##############################################################################
# Bestand: setup-ubuntu-18.04-desktop-pc07.sh
# Doel:    Instellingsbestand voor Ubuntu 18.04 LTS desktop op pc07
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ------------------------------------------------------------------------------
# Versie:   02.00.00    2018-10-16  Hernoemd (PC -> pc)
# ##############################################################################
# REL_NUM=02.07.00
# REL_DAT=2020-04-16
# REL_MSG='Terminator toegevoegd'

#1 Vervang Firefox door Chrome en Thunderbird door Gmail
rm --force --recursive "$HOME/.mozilla" "$HOME/.thunderbird"
#2 1. Start Standaardtoepassingen.
#2 2. Kies bij E-mail voor Gnome Gmail.

#1 Schermvergrendeling wijzigen
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.screensaver lock-delay 300
#3 Start Terminalvenster en voer uit:
#3    gsettings set org.gnome.desktop.screensaver lock-enabled false
#3    gsettings reset org.gnome.desktop.screensaver lock-delay

#@bluefish
#1 Bluefish web en programmeurs-editor
: # Geen opdracht, wel info.
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
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.gedit.desktop' || gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/\[/\['org.gnome.gedit.desktop', /")"
#3 Start Terminalvenster en voer uit:
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

#@terminal
#1 GNOME Terminal
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.Terminal.desktop'; then gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#2 1. Start Terminalvenster.
#2 2. Maximaliseer het Terminalvenster.
#2 3. Voer de volgende opdracht uit:
#2    echo $COLUMNS $LINES
#2 4. Ga naar Bewerken > Voorkeuren.
#2 5. Onder Profielen klik op Naamloos.
#2 6. Vul in achter Oorspronkelijke afmeting van de terminal:
#2    COLUMNS kolommen en LINES rijen, en klik op Sluiten.

#@terminator
#1 Terminator meerdere GNOME terminals in één venster
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='terminator.desktop'; then gsettings set org.gnome.shell favorite-apps "['terminator.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#2 1. Start Terminator (Ctrl+Alt+T).
#2 2. Rechtsklikken > Voorkeuren.
#2 3. Globaal (tab).
#2 4.   Gedrag - Vensterstatus: Gemaximaliseerd
#2 5. Profielen (tab) > Kleuren (ab)
#2 6.   Voor en achtergrond - Ingebouwde schema's: Ambience,
#2      Kleurenpalen - Ingebouwde schema's: Tango.
#2 7. Toetsbindingen (tab).
#2 8.   switch_to_tab_1 - Alt+1
#2      switch_to_tab_2 - Alt+2
#2      ...
#2      switch_to_tab_9 - Alt+9
#2 9. Klik op Sluiten.

#1 Bureaubladachtergrond wijzigen
gsettings set org.gnome.desktop.background picture-uri 'file:///opt/kzscripts/share/backgrounds/gnome.png'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///opt/kzscripts/share/backgrounds/gnome.png'
#3 Start Terminalvenster en voer uit:
#3    gsettings reset org.gnome.desktop.background picture-uri
#3    gsettings reset org.gnome.desktop.screensaver picture-uri

# Einde instellingsbestand
