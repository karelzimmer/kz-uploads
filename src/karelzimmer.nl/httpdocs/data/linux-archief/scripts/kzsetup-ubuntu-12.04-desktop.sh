# shellcheck shell=bash
###############################################################################
# Instellingsbestand voor Ubuntu 12.04 LTS desktop.
#
# Geschreven door Karel Zimmer <info@karelzimmer.nl>.
# Auteursrecht (c) 2020-2021 Karel Zimmer.
# GNU Algemene Publieke Licentie <https://www.gnu.org/licenses/gpl.html>.
#
# RelNum=02.12.05
# RelDat=2021-05-03
###############################################################################

# Herhaaldelijk uitvoeren leidt steeds tot hetzelfde resultaat; idempotentie.

## Als 1e uitvoeren! ##
#1
#2 Unity instellen
## Voor een beschrijving voer uit: gsettings describe SCHEMA KEY
gsettings reset com.canonical.Unity.Launcher favorites
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-week-numbers true
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'large'
gsettings set org.gnome.nautilus.preferences click-policy 'single'
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true
#3
#3 1. Pas de aanmeldfoto van <gebruiker> aan via een klik op Activiteiten, zoek
#3    geb en klik achter Instellingen op Gebruikers.
#3 2. Aan de rechterkant, klik links naast <gebruiker> en selecteer een
#3    aanmeldfoto of neem een foto indien mogelijk.
#3 3. Sluit Gebruikers af.
#4
#4 Start Terminalvenster en voer uit:
#4    gsettings reset  com.canonical.indicator.datetime show-date true
#4    gsettings reset  com.canonical.indicator.datetime show-day true
#4    gsettings reset  com.canonical.indicator.datetime show-week-numbers true
#4    gsettings reset org.gnome.desktop.screensaver lock-enabled
#4    gsettings reset org.gnome.nautilus.icon-view default-zoom-level
#4    gsettings reset org.gnome.nautilus.preferences click-policy
#4    gsettings reset org.gnome.settings-daemon.peripherals.touchscreen orientation-lock
## Als 1e uitvoeren! ##


#1 adguard
#2 AdGuard instellen
:
#3
#3 Voor Google Chrome
#3 ==================
#3 1. Start Google Chrome webbrowser.
#3 2. Ga naar https://adguard.com/nl/download-extension/chrome.html
#3 3. Klik op Toev. aan Chrome.
#3 4. Klik op Extensie toevoegen.
#3
#3 Voor Firefox
#3 ============
#3 1. Start Firefox webbrowser.
#3 2. Ga naar https://adguard.com/nl/download-extension/firefox.html
#3 3. Klik op Toevoegen aan Firefox.
#3 4. Klik op Toevoegen.
#3 5. Klik op Oké, begrepen.
#4
#4 Voor Google Chrome
#4 ==================
#4 1. Start Google Chrome webbrowser.
#4 2. Klik rechtsboven op Meer⋮.
#4 3. Klik vervolgens op Meer hulpprogramma's > Extensies.
#4 4. Bij AdGuard-advertentieblokkeerder zet schuifje op uit of klik op
#4    Verwijderen.
#4
#4 Voor Firefox
#4 ============
#4 1. Start Firefox webbrowser.
#4 2. Ga naar Menu openen ☰ > Add-ons (Ctrl+Shift+A).
#4 3. Klik links op Extensies.
#4 4. Bij AdGuard-advertentieblokkeerder klik op Uitschakelen of Verwijderen.


#1 bitwarden
#2 Bitwarden instellen
if ! gsettings get com.canonical.Unity.Launcher favorites | grep --quiet --word-regexp --regexp='bitwarden_bitwarden.desktop'; then gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | awk -F] '{print $1}'), 'bitwarden_bitwarden.desktop']"; fi
#3
#3 Ingebruikname van Bitwarden
#3 ===========================
#3 1. Start Bitwarden.
#3 2. Maak een account aan met een sterk(!) Hoofdwachtwoord.
#3 3. Exporteer de opgeslagen wachtwoorden uit de bestaande wachtwoordbeheerder.
#3 4. Importeer de opgeslagen wachtwoorden in Bitwarden.
#3 5. Verwijder de uit de oude wachtwoordbeheerder geëxporteerde wachtwoorden.
#3 6. Verwijder de oude wachtwoordbeheerder.
#3
#3 Met het gebruik van Bitwarden wordt het opslaan van wachtwoorden in de
#3 browser sterk afgeraden.
#3
#3 Dit betekent voor de browser
#3 ============================
#3 1. Stop het (automatisch) opslaan van wachtwoorden.
#3 2. Verwijder opgeslagen wachtwoorden.
#3 3. Voeg de Bitwarden-extensie toe.
#3
#3 Voor Google Chrome betekent dit
#3 ===============================
#3 1. Stop het (automatisch) opslaan van wachtwoorden.
#3    1. Klik rechtsboven op de gebruikersafbeelding en kies Je Google-account
#3       beheren.
#3    2. Klik aan de linkerkant op Beveiliging.
#3    3. Scroll naar beneden en klik op Wachtwoordmanager.
#3    4. Klik rechtsboven op tandwielsymbool.
#3    5. Zet schuifjes 'Automatisch inloggen' en 'Aanbieden om wachtwoorden op
#3       te slaan' uit.
#3 2. Verwijder opgeslagen wachtwoorden.
#3    1. Klik rechtsboven op Meer⋮.
#3    2. Klik op Instellingen.
#3    3. Klik onder 'Privacy en beveiliging' op Browsegegevens wissen.
#3    4. Klik op Geavanceerd (tab).
#3    5. Vink aan 'Wachtwoorden en andere inloggegevens' en klik op Gegevens
#3       wissen.
#3 3. Voeg de Bitwarden-extensie toe.
#3    1. Ga naar https://bitwarden.com/.
#3    2. Scroll naar beneden en rechts van WEB BROWSER klik op Google Chrome.
#3    3. Klik op Toev. aan Chrome.
#3    4. Klik rechtsboven op Bitwarden-icoontje en geef het Hoofdwachtwoord.
#3    5. Eventueel, met licht veiligheidsrisico, maar groot gebruikersgemak:
#3       1. Klik in Bitwarden-extensie op Instellingen en klik onder BEVEILIGING
#3          op 'Time-out van de kluis' en selecteer Nooit.
#3       2. Klik in Bitwarden-extensie op Instellingen en klik onder OVERIG op
#3          Opties en vink aan Automatisch invullen bij laden van pagina.
#4
#4 Voor Google Chrome
#4 ==================
#4 1. Start Google Chrome webbrowser.
#4 2. Klik rechtsboven op Meer⋮.
#4 3. Klik vervolgens op Meer hulpprogramma's > Extensies.
#4 4. Bij 'Bitwarden - Gratis wachtwoordbeheer' zet schuifje op uit of klik op
#4    Verwijderen.
#4 5. Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'bitwarden_bitwarden.desktop', //g" | sed --expression="s/, 'bitwarden_bitwarden.desktop'//")"
#4
#4 Voor Firefox
#4 ============
#4 1. Start Firefox webbrowser.
#4 2. Ga naar Menu openen ☰ > Add-ons (Ctrl+Shift+A).
#4 3. Klik links op Extensies.
#4 4. Bij 'Bitwarden - Gratis wachtwoordbeheer' klik op Uitschakelen of Verwijderen.
#4 5. Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'bitwarden_bitwarden.desktop', //g" | sed --expression="s/, 'bitwarden_bitwarden.desktop'//")"


#1 google-chrome
#2 Google Chrome instellen
if ! gsettings get com.canonical.Unity.Launcher favorites | grep --quiet --word-regexp --regexp='google-chrome.desktop'; then gsettings set com.canonical.Unity.Launcher favorites "['google-chrome.desktop', $(gsettings get com.canonical.Unity.Launcher favorites | awk -F[ '{print $2}')"; fi
## Integratie van GNOME Shell-extensies voor webbrowsers;
## https://extensions.gnome.org
#3
#3 1. Start Google Chrome.
#3 2. Indien nodig importeer Firefox bladwijzers via klik op Meer⋮ > Bladwijzers en dan
#3    Bladwijzers en instellingen importeren.
#3 3. Ga naar https://chrome.google.com/webstore/category/extensions
#3 4. Zoek naar gnome en klik op gnome-shell integration
#3 5. Klik op Gnome-shell-integratie
#3 6. Klik op Toev. aan Chrome.
#3 7. Klik op Extensie toevoegen.
#3
#3 Om standaard te mailen met Gmail en Google Chrome voer uit:
#3    1. Start Standaardtoepassingen.
#3    2. Kies bij E-mail voor Gnome Gmail.
#4
#4 1. Start Google Chrome
#4 2. Ga naar chrome://extensions/
#4 3. Bij Gnome-shell-integratie zet schuifje op uit of klik op Verwijderen.
#4 4. Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'google-chrome.desktop', //g" | sed --expression="s/, 'google-chrome.desktop'//")"


#1 icaclient
#2 Citrix Workspace app instellen
## Citrix Receiver, ICA Client
xdg-mime default wfica.desktop application/x-ica
#3
#3 1. Start een webbrowser.
#3 2. Ga naar het Telewerkportaal en stel vast dat het inloggen werkt.


#1 skype
#2 Skype instellen
if ! gsettings get com.canonical.Unity.Launcher favorites | grep --quiet --word-regexp --regexp='skype_skypeforlinux.desktop'; then gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | awk -F] '{print $1}'), 'skype_skypeforlinux.desktop']"; fi
#4
#4 Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'skype_skypeforlinux.desktop', //g" | sed --expression="s/, 'skype_skypeforlinux.desktop'//")"


#1 spotify
#2 Spotify instellen
if ! gsettings get com.canonical.Unity.Launcher favorites | grep --quiet --word-regexp --regexp='spotify_spotify.desktop'; then gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | awk -F] '{print $1}'), 'spotify_spotify.desktop']"; fi
#3
#3 1. Start Spotify.
#3 2. Aanmelden.
#3 3. Ga naar Edit (Bewerken) en vervolgens naar Preferences (Voorkeuren).
#3 4. Zet Language (Taal) op Nederlands (Dutch).
#3 5. Herstart Spotify.
#4
#4 Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'spotify_spotify.desktop', //g" | sed --expression="s/, 'spotify_spotify.desktop'//")"


#1 zoom
#2 Zoom instellen
if ! gsettings get com.canonical.Unity.Launcher favorites | grep --quiet --word-regexp --regexp='Zoom.desktop'; then gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | awk -F] '{print $1}'), 'Zoom.desktop']"; fi
#4
#4 Start Terminalvenster en voer uit:
#4       gsettings set com.canonical.Unity.Launcher favorites "$(gsettings get com.canonical.Unity.Launcher favorites | sed --expression="s/'Zoom.desktop', //g" | sed --expression="s/, 'Zoom.desktop'//")"


# EOF
