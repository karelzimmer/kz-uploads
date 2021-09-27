#############################################################################
# Bestand:  install-Lubuntu-14.10-desktop-algemeen.sh                       #
# Doel:     Installatiebestand voor Lubuntu 14.10 desktop algemeen.         #
# Gebruik:  Door script install, zie 'install.sh --help' (aanbevolen).      #
#           In het terminalvenster met script install via                   #
#           './install.sh install-Lubuntu-14.10-desktop-algemeen.sh'        #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'sudo bash install-Lubuntu-14.10-desktop-algemeen.sh'.          #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst te  # 
#           kopiëren, en daarna te plakken in het terminalvenster.          #
# Gebruikt: install-google-chrome.sh    (Google Chrome)                     #
#           install-google-drive.sh     (Google Drive)                      #
#           install-skype.sh            (Skype)                             #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 3.0  #
# Nederland licentie (CC BY-SA 3.0 NL).                                     #
# Bezoek http://creativecommons.org/licenses/by-sa/3.0/nl/ om een kopie te  #
# zien van de licentie of stuur een brief naar Creative Commons,            #
# 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.      #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-10-11  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.4.0
# RELEASE_DATE=2014-12-05

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#1 [ 1/14] Webbrowser - Google Chrome
sudo bash install-google-chrome.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Chrome                           *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Chrome voer uit:                *
#2         *    ./install.sh --info install-google-chrome.sh                *
#2         *----------------------------------------------------------------*

#1 [ 1/14] Mijn schijf in de cloud - Google Drive
sudo bash install-google-drive.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Drive                            *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Drive voer uit:                 *
#2         *    ./setup.sh --info setup-google-drive.sh                     *
#2         *----------------------------------------------------------------*

#1 [ 3/14] Wachtwoordkluis - KeePassX
sudo apt-get --assume-yes install keepassx

#1 [ 4/14] Multimedia-ondersteuning (1/6)
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#1         Multimedia-ondersteuning (2/6)
sudo apt-get --assume-yes install lubuntu-restricted-extras
#1         Multimedia-ondersteuning (3/6)
sudo apt-get --assume-yes install libavcodec-extra
#1         Multimedia-ondersteuning (4/6)
sudo apt-get --assume-yes install libdvdread4
#1         Multimedia-ondersteuning (5/6)
sudo /usr/share/doc/libdvdread4/install-css.sh
#1         Multimedia-ondersteuning (6/6)
sudo apt-get --assume-yes install winff

#1 [ 5/14] Gratis (beeld)bellen over het Internet - Skype
sudo bash install-skype.sh
#2         *----------------------------------------------------------------*
#2         *                        Skype                                   *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Skype voer uit:                        *
#2         *    ./install.sh --info install-skype.sh                        *
#2         *----------------------------------------------------------------*

#1 [ 6/14] Mozilla Thunderbird E-mail/nieuws (1/3)
sudo apt-get --assume-yes install thunderbird
#1         Mozilla Thunderbird E-mail/nieuws (2/3)
sudo apt-get --assume-yes install thunderbird-locale-nl
#1         Mozilla Thunderbird E-mail/nieuws (2/3)
sudo apt-get --assume-yes install xul-ext-lightning

#1 [ 7/14] Multimediaspeler - VLC (1/2)
sudo apt-get --assume-yes install vlc
#1         Multimediaspeler - VLC (2/2)
sudo apt-get --assume-yes install vorbis-tools

#1 [ 8/14] YouTube downloader (1/4)
sudo apt-get --assume-yes install zenity
#1         YouTube downloader (2/4)
sudo cp youtube-dl.sh /usr/bin/
#1         YouTube downloader (3/4)
sudo chmod a+x /usr/bin/youtube-dl.sh
#1         YouTube downloader (4/4)
sudo desktop-file-install --rebuild-mime-info-cache youtube-dl.desktop

#1 [ 9/14] Patience kaartspel - AisleRiot
## Extra t.o.v. install-Ubuntu-14.10-desktop-algemeen.sh (1/3)
sudo apt-get --assume-yes install aisleriot

#1 [10/14] Reservekopieën maken - Déjà Dup
## Extra t.o.v. install-Ubuntu-14.10-desktop-algemeen.sh (2/3)
sudo apt-get --assume-yes install deja-dup

#1 [11/14] Kantoorpakket - LibreOffice (1/4)
## Extra t.o.v. install-Ubuntu-14.10-desktop-algemeen.sh (3/3)
sudo apt-get --assume-yes install libreoffice
#1         Kantoorpakket - LibreOffice (2/4)
sudo apt-get --assume-yes install libreoffice-l10n-nl
#1         Kantoorpakket - LibreOffice (3/4)
sudo apt-get --assume-yes install libreoffice-help-nl
#1         Kantoorpakket - LibreOffice (4/4)
sudo apt-get --assume-yes install myspell-nl

#1 [12/14] Volledige taal-ondersteuning
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#1 [13/14] Foutrapportage interne debugger uitschakelen (1/2)
sudo sed    --in-place                              \
            --expression='s/enabled=1/enabled=0/'   \
            /etc/default/apport
#1         Foutrapportage interne debugger uitschakelen (2/2)
## Als apport al is gestopt, zorgt de ' || true' voor afsluitwaarde 0.
sudo service apport stop || true

#1 [14/14] Opstartwachttijd opstartlader verkorten (1/2)
sudo sed    --in-place                                          \
            --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/'    \
            /etc/default/grub
#1         Opstartwachttijd opstartlader verkorten (2/2)
sudo update-grub

# Einde installatiebestand.
