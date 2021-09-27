#############################################################################
# Bestand:  setup-ubuntu-17.10-desktop-PC10.sh                              #
# Doel:     Instellingsbestand voor Ubuntu 17.10 LTS desktop op PC10.       #
# Gebruik:  In het terminalvenster met script setup (aanbevolen):           #
#           setup [~/bin/setup-ubuntu-17.10-desktop-PC10.sh]                #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-ubuntu-17.10-desktop-PC10.sh                   #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht:                                      #
#           setup -s [~/bin/setup-ubuntu-17.10-desktop-PC10.sh]             #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2017-10-28  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.5.2
# RELEASE_DATE=2018-01-17

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#

#@bluefish
#1 [ 1/5 ] Stel in Bluefish - web en programmeurs-editor
##======================================================
: # Geen opdracht. Gebruik optie '--info-setup' (-i) voor informatie.
#2
#2 Stel in Bluefish - web en programmeurs-editor
## ---------------------------------------------
#2 1. Start Bluefish.
#2 2. Zet via Bewerken > Voorkeuren > Initiële document instellingen de
#2    Tab breedte op 4 en vink aan
#2    Gebruik spaties voor inspringen, geen tabs.

#@gedit
#1 [ 2/5 ] Stel in gedit - teksteditor
##====================================
## Starter aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.gedit.desktop' || gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/'/'org.gnome.gedit.desktop', '/")"

#@icaclient
#1 [ 3/5 ] Stel in Citrix Receiver - telewerken
##=============================================
## Voor gebruik met Google Chrome/Chromium.
xdg-mime default wfica.desktop application/x-ica
#2
#2 Stel in Citrix Receiver - telewerken
## ------------------------------------
#2 1. Start Firefox webbrowser.
#2 2. Ga naar menu > Voorkeuren > Bestanden en Toepassingen.
#2 3. Zoek ica en zorg dat bij Citrix ICA-instellingen is geselecteerd
#2    Citrix Receiver Engine gebruiken.
#2 4. Ga naar https://telewerkportaal.rabobank.nl en log in en stel vast dat
#2    het inloggen op het Telewerkportaal werkt.

#@terminal
#1 [ 4/5 ] Stel in GNOME Terminal - terminalvenster
##=================================================
## Starter aan favorieten toevoegen.
gsettings get org.gnome.shell favorite-apps | grep --quiet --regexp='org.gnome.Terminal.desktop' || gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed --expression="s/'/'org.gnome.Terminal.desktop', '/")"
#2
#2 Stel in GNOME Terminal - terminalvenster
## ----------------------------------------
#2 1. Start Terminalvenster.
#2 2. Ga naar Bewerken > Profielvoorkeuren.
#2 3. Op tabblad Algemeen vul in achter
#2    Oorspronkelijke afmeting van de terminal:
#2    120 kolommen en 42 rijen, en klik op Sluiten.

#1 [ 5/5 ] Stel in bureaubladachtergrond
##======================================
## Aanpassen via Systeeminstellingen > Uiterlijk > Uiterlijk (tab).
## Achtergrond.
gsettings set org.gnome.desktop.background picture-uri 'file:///opt/wallpapers/gnome.png'

## Vergrendelingsscherm.
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///opt/wallpapers/gnome.jpg'

# Einde instellingsbestand.
