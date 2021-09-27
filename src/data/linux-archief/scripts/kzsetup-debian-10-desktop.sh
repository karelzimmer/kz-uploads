# shellcheck shell=bash
# ##############################################################################
# Instellingsbestand voor Debian 10 desktop.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# GNU Algemene Publieke Licentie v3 <https://www.gnu.org/licenses/gpl.html>.
# ##############################################################################
# REL_NUM=01.02.03
# REL_DAT=2020-08-31
# REL_MSG='Grep gewijzigd'

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

## ALS EERSTE ##
#1 GSettings - Applicatie-instellingen opslaan en ophalen (favorieten herstellen)
gsettings reset org.gnome.shell favorite-apps
## ALS EERSTE ##

#@dashtodock
#1 Dash to Dock - Een dok voor de Gnome Shell
gnome-shell-extension-tool --enable-extension=dash-to-dock@micxgx.gmail.com || true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
#3 Start Terminalvenster en voer uit:
#3    gnome-shell-extension-tool --disable-extension=dash-to-dock@micxgx.gmail.com
#3    gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed
#3    gsettings reset org.gnome.shell.extensions.dash-to-dock extend-height

#@adguard
#1 AdGuard - Advertentieblokkeerder (browser extensie)
:
#2 Voor Google Chrome:
#2 1. Start Google Chrome webbrowser.
#2 2. Ga naar https://adguard.com/nl/download-extension/chrome.html
#2 3. Klik op Toev. aan Chrome.
#2 4. Klik op Extensie toevoegen.
#2
#2 Voor Firefox:
#2 1. Start Firefox webbrowser.
#2 2. Ga naar https://adguard.com/nl/download-extension/firefox.html
#2 3. Klik op Toevoegen aan Firefox.
#2 4. Klik op Toevoegen.
#2 5. Klik op Oké, begrepen.
#3 Voor Google Chrome:
#3 1. Start Google Chrome webbrowser.
#3 2. Klik rechtsboven op Meer ⋮.
#3 3. Klik vervolgens op Meer hulpprogramma's > Extensies.
#3 4. Bij AdGuard-advertentieblokkeerder zet schuifje op uit of klik op Verwijderen.
#3
#3 Voor Firefox:
#3 1. Start Firefox webbrowser.
#3 2. Ga naar Menu openen ☰ > Add-ons (Ctrl+Shift+A).
#3 3. Klik links op Extensies.
#3 4. Bij AdGuard-advertentieblokkeerder klik op Uitschakelen of Verwijderen.

#@alias
#1 Alias - Aliassen definiëren
sed --in-place --expression='s/#alias/alias/g' "$HOME"/.bashrc

#@bitwarden
#1 Bitwarden - Een veilige en gratis wachtwoordbeheerder voor al uw apparaten
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='bitwarden_bitwarden.desktop'; then gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}')"", 'bitwarden_bitwarden.desktop']"; fi
#2 Ingebruikname van Bitwarden:
#2 1. Start Bitwarden.
#2 2. Maak een account aan met een sterk(!) Hoofdwachtwoord.
#2 3. Exporteer de opgeslagen wachtwoorden uit de bestaande wachtwoordbeheerder.
#2 4. Importeer de opgeslagen wachtwoorden in Bitwarden.
#2 5. Verwijder de uit de oude wachtwoordbeheerder geëxporteerde wachtwoorden.
#2 6. Verwijder de oude wachtwoordbeheerder.
#2
#2 Met het gebruik van Bitwarden wordt het opslaan van wachtwoorden in de
#2 browser sterk afgeraden.
#2
#2 Dit betekent voor de browser:
#2 1. Stop het (automatisch) opslaan van wachtwoorden.
#2 2. Verwijder opgeslagen wachtwoorden.
#2 3. Voeg de Bitwarden-extensie toe.
#2
#2 Voor Google Chrome betekent dit:
#2 1. Stop het (automatisch) opslaan van wachtwoorden.
#2    1. Klik rechtsboven op de gebruikersafbeelding en kies Je Google-account
#2       beheren.
#2    2. Klik aan de linkerkant op Beveiliging.
#2    3. Scroll naar beneden en klik op Wachtwoordmanager.
#2    4. Klik rechtsboven op tandwielsymbool.
#2    5. Zet schuifjes 'Automatisch inloggen' en 'Aanbieden om wachtwoorden op
#2       te slaan' uit.
#2 2. Verwijder opgeslagen wachtwoorden.
#2    1. Klik rechtsboven op Meer ⋮.
#2    2. Klik op Instellingen.
#2    3. Klik onder 'Privacy en beveiliging' op Browsegegevens wissen.
#2    4. Klik op Geavanceerd (tab).
#2    5. Vink aan 'Wachtwoorden en andere inloggegevens' en klik op Gegevens
#2       wissen.
#2 3. Voeg de Bitwarden-extensie toe.
#2    1. Ga naar https://bitwarden.com/.
#2    2. Scroll naar beneden en rechts van WEB BROWSER klik op Google Chrome.
#2    3. Klik op Toev. aan Chrome.
#2    4. Klik rechtsboven op Bitwarden-icoontje en geef het Hoofdwachtwoord.
#2    5. Eventueel, met licht veiligheidsrisico, maar groot gebruikersgemak:
#2       1. Klik in Bitwarden-extensie op Instellingen en klik onder BEVEILIGING
#2          op 'Time-out van de kluis' en selecteer Nooit.
#2       2. Klik in Bitwarden-extensie op Instellingen en klik onder OVERIG op
#2          Opties en vink aan Automatisch invullen bij laden van pagina.
#3 Voor Google Chrome:
#3 1. Start Google Chrome webbrowser.
#3 2. Klik rechtsboven op Meer ⋮.
#3 3. Klik vervolgens op Meer hulpprogramma's > Extensies.
#3 4. Bij 'Bitwarden - Gratis wachtwoordbeheer' zet schuifje op uit of klik op
#3    Verwijderen.
#3 5. Start Terminalvenster en voer uit:
#3       gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F"'bitwarden_bitwarden.desktop', " '{print $1 $2} ' | awk -F", 'bitwarden_bitwarden.desktop'" '{print $1 $2} ')"
#3
#3 Voor Firefox:
#3 1. Start Firefox webbrowser.
#3 2. Ga naar Menu openen ☰ > Add-ons (Ctrl+Shift+A).
#3 3. Klik links op Extensies.
#3 4. Bij 'Bitwarden - Gratis wachtwoordbeheer' klik op Uitschakelen of Verwijderen.

#@icaclient
#1 Citrix Workspace app voor Linux - Telewerken (Citrix Receiver, ICA Client)
xdg-mime default wfica.desktop application/x-ica
#2 1. Start een webbrowser.
#2 2. Ga naar het Telewerkportaal en stel vast dat het inloggen werkt.

#@google-chrome
#1 Google Chrome - De webbrowser van Google
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='google-chrome.desktop'; then gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
## GNOME Shell integration - Integratie van GNOME Shell-extensies voor
## webbrowsers; https://extensions.gnome.org
#2 1. Start Google Chrome.
#2 2. Indien nodig importeer Firefox bladwijzers via klik op Meer ⋮ > Bladwijzers en dan
#2    Bladwijzers en instellingen importeren.
#2 3. Ga naar https://chrome.google.com/webstore/category/extensions
#2 4. Zoek naar gnome en klik op gnome-shell integration
#2 5. Klik op Gnome-shell-integratie
#2 6. Klik op Toev. aan Chrome.
#2 7. Klik op Extensie toevoegen.
#2
#2 Google Chrome als enige browser en e-mail via Google Chrome?
#2 Overweeg het verwijderen van Mozilla Firefox en Thunderbird!
#2 Start Terminalvenster en voer uit:
#2    rm --force --recursive "$HOME/.mozilla"
#2    rm --force --recursive "$HOME/.thunderbird"
#3 1. Start Google Chrome
#3 2. Ga naar chrome://extensions/
#3 3. Bij Gnome-shell-integratie zet schuifje op uit of klik op Verwijderen.
#3 4. Start Terminalvenster en voer uit:
#3       gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F"'google-chrome.desktop', " '{print $1 $2} ' | awk -F", 'google-chrome.desktop'" '{print $1 $2} ')"

#1 GSettings - Applicatie-instellingen opslaan en ophalen (GNOME aanpassen)
## Voor een beschrijving voer uit: gsettings describe SCHEMA KEY
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'large'
gsettings set org.gnome.nautilus.preferences click-policy 'single'
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode 'tab'
#2 1. Pas de aanmeldfoto van <gebruiker> aan een klik op Activiteiten of
#2    vierkante rasterknop, zoek geb en klik achter Instellingen op Gebruikers.
#2 2. Aan de rechterkant, klik links naast <gebruiker> en selecteer een
#2    aanmeldfoto (of neem een foto indien mogelijk).
#2 3. Sluit Gebruikers af.
#3 Start Terminalvenster en voer uit:
#3    gsettings reset org.gnome.desktop.calendar show-weekdate
#3    gsettings reset org.gnome.desktop.interface clock-show-date
#3    gsettings reset org.gnome.desktop.interface show-battery-percentage
#3    gsettings reset org.gnome.desktop.peripherals.touchpad tap-to-click
#3    gsettings reset org.gnome.desktop.screensaver lock-enabled
#3    gsettings reset org.gnome.nautilus.icon-view default-zoom-level
#3    gsettings reset org.gnome.nautilus.preferences click-policy
#3    gsettings reset org.gnome.settings-daemon.peripherals.touchscreen orientation-lock
#3    gsettings reset org.gnome.settings-daemon.plugins.color night-light-enabled
#3    gsettings reset org.gnome.settings-daemon.plugins.media-keys max-screencast-length
#3    gsettings reset org.gnome.settings-daemon.plugins.power idle-dim
#3    gsettings reset org.gnome.settings-daemon.plugins.power power-button-action
#3    gsettings reset org.gnome.Terminal.Legacy.Settings new-terminal-mode

#@skype
#1 Skype - Videogesprekken, chatten, delen, en bellen over het internet
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='skype_skypeforlinux.desktop'; then gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}')"", 'skype_skypeforlinux.desktop']"; fi
#3 Start Terminalvenster en voer uit:
#3    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F"'skype_skypeforlinux.desktop', " '{print $1 $2} ' | awk -F", 'skype_skypeforlinux.desktop'" '{print $1 $2} ')"

#@spotify
#1 Spotify - Muziek voor iedereen
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='spotify_spotify.desktop'; then gsettings set org.gnome.shell favorite-apps "['spotify_spotify.desktop', ""$(gsettings get org.gnome.shell favorite-apps | awk -F[ '{print $2}')"; fi
#2 1. Start Spotify.
#2 2. Aanmelden.
#2 3. Ga naar Edit (Bewerken) en vervolgens naar Preferences (Voorkeuren).
#2 4. Zet Language (Taal) op Nederlands (Dutch).
#2 5. Herstart Spotify.
#3 Start Terminalvenster en voer uit:
#3    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F"'spotify_spotify.desktop', " '{print $1 $2} ' | awk -F", 'spotify_spotify.desktop'" '{print $1 $2} ')"

#@terminal
#1 Terminal - Start terminal met toetcombinatie Ctrl Alt T
:
#2 1. Ga naar Instellingen > Apparaten > Toetsenbord.
#2 2. Klik onderin op +.
#2 3. Naam: Terminal en Opdracht: gnome-terminal.
#2 4. Klik op Sneltoets instellen.
#2 5. Druk op toetcombinatie Ctrl Alt T.
#2 6. Klik op Toevoegen en sluit Toetsenbord af.
#3 1. Ga naar Instellingen > Apparaten > Toetsenbord.
#3 2. Klik op vergrootglas en zoek 'terminal'.
#3 3. Klik op regel met Terminalvenster.
#3 4. Klik op Verwijderen en sluit Toetsenbord af.

#@totem
#1 Totem - Eenvoudige mediaspeler voor de GNOME-desktop
if ! gsettings get org.gnome.shell favorite-apps | grep --quiet --word-regexp --regexp='org.gnome.Totem.desktop'; then gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F] '{print $1}')"", 'org.gnome.Totem.desktop']"; fi
#3 Start Terminalvenster en voer uit:
#3    gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | awk -F"'org.gnome.Totem.desktop', " '{print $1 $2} ' | awk -F", 'org.gnome.Totem.desktop'" '{print $1 $2} ')"

# EOF
