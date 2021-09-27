#############################################################################
# Bestand:  install-Xubuntu-14.04-desktop-algemeen.sh                       #
# Doel:     Installatiebestand voor Xubuntu 14.04 LTS desktop algemeen.     #
# Gebruik:  Door script install, zie 'install.sh --help' (aanbevolen).      #
#           In het terminalvenster met script install via                   #
#           './install.sh --file=install-Xubuntu-14.04-desktop-algemeen.sh' #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'sudo bash install-Xubuntu-14.04-desktop-algemeen.sh'.          #
# Optie:    Een opdrachtregel kan ook uitgevoerd worden door deze eerst te  # 
#           kopiëren, en daarna te plakken in het terminalvenster.          #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk is gelicenseerd onder een                                        #
# Creative Commons Naamsvermelding-GelijkDelen 3.0 Nederland licentie.      #
# Bezoek http://creativecommons.org/licenses/by-sa/3.0/nl/ om een kopie te  #
# zien van de licentie of stuur een brief naar Creative Commons,            #
# 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.      #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-07-19  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.0
# RELEASE_DATE=2014-07-19

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#* [ 1/15] Mijn schijf in de cloud (Google Drive) 1/3
sudo add-apt-repository --yes ppa:thefanclub/grive-tools
#*         Mijn schijf in de cloud (Google Drive) 2/3
sudo apt-get update
#*         Mijn schijf in de cloud (Google Drive) 3/3
sudo apt-get --assume-yes install grive-tools
#?         ##################################################################
#?         #                        Google Drive (1/2)                      #
#?         # Setup:                                                         #
#?         # 1. Klik linksboven op het Xubuntu-logo.                        #
#?         # 2. Zoek gri en klik op Grive Setup.                            #
#?         #    Volg de aanwijzingen op het scherm.                         #
#?         # 2. Zoek gri en klik op Google Drive Indicator.                 #
#?         ##################################################################
#?         ******************************************************************
#?         *                        Google Drive (2/2)                      *
#?         * Gebruik:                                                       *
#?         * Bestanden geplaatst in map Google Drive in de Persoonlijke map *
#?         * worden gesynchroniseerd in de cloud.                           *
#?         * Klik rechts op de Google Drive icoon voor meer opties.         *
#?         * Informatie:                                                    *
#?         * Mijn schijf in de cloud is handig om gegevens te               *
#?         * synchroniseren en te benaderen via iedere computer,            *
#?         * smartphone, etc.                                               *
#?         ******************************************************************

#* [ 2/15] Wachtwoordkluis (KeePassX)
sudo apt-get --assume-yes install keepassx

#* [ 3/15] Niet-vrije multimedia (restricted-extras) 1/6
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#*         Niet-vrije multimedia (restricted-extras) 2/6
sudo apt-get --assume-yes install xubuntu-restricted-extras
#*         Niet-vrije multimedia (libavcodec-extra)  3/6
sudo apt-get --assume-yes install libavcodec-extra
#*         Niet-vrije multimedia (libdvdread4)       4/6
sudo apt-get --assume-yes install libdvdread4
#*         Niet-vrije multimedia (libdvdcss)         5/6
sudo /usr/share/doc/libdvdread4/install-css.sh
#*         Niet-vrije multimedia (winff)             6/6
sudo apt-get --assume-yes install winff

#* [ 4/15] Video in de browser (Silverlight) 1/4
sudo add-apt-repository --yes ppa:pipelight/stable
#*         Video in de browser (Silverlight) 2/4
sudo apt-get update
#*         Video in de browser (Silverlight) 3/4
sudo apt-get --assume-yes install pipelight-multi
#*         Video in de browser (Silverlight) 4/4
sudo pipelight-plugin --accept --enable silverlight
#?         ******************************************************************
#?         * N.B.                                                           *
#?         * Silverlight wordt ingesteld door script setup.                 *
#?         ******************************************************************

#* [ 5/15] Gratis (beeld)bellen over het Internet (Skype) 1/3
sudo sed --in-place "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
#*         Gratis (beeld)bellen over het Internet (Skype) 2/3
sudo apt-get update
#*         Gratis (beeld)bellen over het Internet (Skype) 3/3
sudo apt-get --assume-yes install skype
#*         Gratis (beeld)bellen over het Internet (Skype) +/+
# Alleen 64-bit systeem:
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
    sudo apt-get --assume-yes install gtk2-engines-murrine:i386; \
    sudo apt-get --assume-yes install gtk2-engines-pixbuf:i386; \
    sudo apt-get --assume-yes install sni-qt:i386; \
fi

#* [ 6/15] Mozilla Thunderbird E-mail/nieuws (Thunderbird) 1/3
sudo apt-get --assume-yes install thunderbird
#*         Mozilla Thunderbird E-mail/nieuws (Thunderbird) 2/3
sudo apt-get --assume-yes install thunderbird-locale-nl
#*         Mozilla Thunderbird E-mail/nieuws (Lightning)   2/3
sudo apt-get --assume-yes install xul-ext-lightning

#* [ 7/15] Multimediaspeler (VLC)
sudo apt-get --assume-yes install vlc

#* [ 8/15] YouTube downloader (youtube-dl.sh) 1/3
sudo apt-get --assume-yes install zenity
#*         YouTube downloader (youtube-dl.sh) 2/3
sudo cp youtube-dl.sh /usr/bin/
#*         YouTube downloader (youtube-dl.sh) 3/3
sudo desktop-file-install --rebuild-mime-info-cache youtube-dl.desktop

#* [ 9/15] Patience kaartspel (AisleRiot)
## Extra t.o.v. install-Ubuntu-14.04-desktop-algemeen.sh 1/3
sudo apt-get --assume-yes install aisleriot

#* [10/15] Reservekopieën maken (Déjà Dup)
## Extra t.o.v. install-Ubuntu-14.04-desktop-algemeen.sh 2/3
sudo apt-get --assume-yes install deja-dup

#* [11/15] Kantoorpakket (LibreOffice) 1/4
## Extra t.o.v. install-Ubuntu-14.04-desktop-algemeen.sh 3/3
sudo apt-get --assume-yes install libreoffice
#*         Kantoorpakket (LibreOffice) 2/4
sudo apt-get --assume-yes install libreoffice-l10n-nl
#*         Kantoorpakket (LibreOffice) 3/4
sudo apt-get --assume-yes install libreoffice-help-nl
#*         Kantoorpakket (LibreOffice) 4/4
sudo apt-get --assume-yes install myspell-nl

#* [12/15] Volledige taal-ondersteuning (check-language-support)
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#* [13/15] Firewall aanzetten (ufw)
sudo ufw enable

#* [14/15] Foutrapportage interne debugger uitschakelen (apport) 1/2
sudo sed --in-place 's/enabled=1/enabled=0/' /etc/default/apport
#*         Foutrapportage interne debugger uitschakelen (apport) 2/2
# Als apport al is gestopt, zorgt de ' || true' voor afsluitwaarde 0.
sudo service apport stop || true

#* [15/15] Opstartwachttijd opstartlader verkorten (GRUB) 1/2
sudo sed --in-place 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/' /etc/default/grub
#*         Opstartwachttijd opstartlader verkorten (GRUB) 2/2
sudo update-grub

# Installatiebestand eindigt hier.
