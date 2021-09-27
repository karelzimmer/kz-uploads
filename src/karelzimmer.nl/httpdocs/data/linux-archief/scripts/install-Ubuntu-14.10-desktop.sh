#############################################################################
# Bestand:  install-Ubuntu-14.10-desktop-algemeen.sh                        #
# Doel:     Installatiebestand voor Ubuntu 14.10 desktop algemeen.          #
# Gebruik:  Door script install, zie './install.sh --help' (aanbevolen).    #
#           In het terminalvenster met script install via                   #
#           './install.sh install-Ubuntu-14.10-desktop-algemeen.sh'         #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'sudo bash install-Ubuntu-14.10-desktop-algemeen.sh'.           #
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
# VERSION_NUMBER=1.7.3
# RELEASE_DATE=2015-04-26

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#1 [ 1/12] Installatie voorbereiden - pakketlijsten aanpassen (1/3)
## Zet de sourcecode-repo uit (alleen de binaire repo staat aan):
sudo sed    --in-place=.install-algemeen                    \
            --expression="/^deb-src/ s/^deb-src/# deb-src/" \
            /etc/apt/sources.list
#1         Installatie voorbereiden - pakketlijsten verversen (2/3)
sudo apt-get --assume-yes update
#1         Installatie voorbereiden - evt updates installeren (3/3)
sudo apt-get --assume-yes upgrade

#1 [ 2/12] Webbrowser - Google Chrome
sudo bash install-google-chrome.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Chrome                           *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Chrome voer uit:                *
#2         *    ./install.sh --info install-google-chrome.sh                *
#2         *----------------------------------------------------------------*

#1 [ 3/12] Mijn schijf in de cloud - Google Drive
sudo bash install-google-drive.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Drive                            *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Drive voer uit:                 *
#2         *    ./setup.sh --info setup-google-drive.sh                     *
#2         *----------------------------------------------------------------*

#1 [ 4/12] Wachtwoordkluis - KeePassX
sudo apt-get --assume-yes install keepassx

#1 [ 5/12] Multimedia-ondersteuning (1/6)
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#1         Multimedia-ondersteuning (2/6)
sudo apt-get --assume-yes install ubuntu-restricted-extras
#1         Multimedia-ondersteuning (3/6)
sudo apt-get --assume-yes install libavcodec-extra
#1         Multimedia-ondersteuning (4/6)
sudo apt-get --assume-yes install libdvdread4
#1         Multimedia-ondersteuning (5/6)
sudo /usr/share/doc/libdvdread4/install-css.sh
#1         Multimedia-ondersteuning (6/6)
sudo apt-get --assume-yes install winff

#1 [ 6/12] Gratis (beeld)bellen over het internet - Skype
sudo bash install-skype.sh
#2         *----------------------------------------------------------------*
#2         *                        Skype                                   *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Skype voer uit:                        *
#2         *    ./install.sh --info install-skype.sh                        *
#2         *----------------------------------------------------------------*

#1 [ 7/12] Mozilla Thunderbird E-mail/nieuws - Agenda
sudo apt-get --assume-yes install xul-ext-lightning

#1 [ 8/12] Multimediaspeler - VLC (1/2)
sudo apt-get --assume-yes install vlc
#1         Multimediaspeler - VLC (2/2)
sudo apt-get --assume-yes install vorbis-tools

#1 [ 9/12] YouTube downloader (1/4)
sudo apt-get --assume-yes install zenity
#1         YouTube downloader (2/4)
sudo cp youtube-dl.sh /usr/bin/
#1         YouTube downloader (3/4)
sudo chmod a+rx /usr/bin/youtube-dl.sh
#1         YouTube downloader (4/4)
sudo desktop-file-install --rebuild-mime-info-cache youtube-dl.desktop

#1 [10/12] Installatie afronden (1/3)
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)
#1         Installatie afronden (2/3)
sudo apt-get --assume-yes autoclean
#1         Installatie afronden (3/3)
sudo apt-get --assume-yes autoremove

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#1 [11/12] Foutrapportage interne debugger uitschakelen (1/2)
sudo sed    --in-place=.install-algemeen            \
            --expression='s/enabled=1/enabled=0/'   \
            /etc/default/apport
#1         Foutrapportage interne debugger uitschakelen (2/2)
## Als apport al is gestopt, zorgt de ' || true' voor afsluitwaarde 0.
sudo service apport stop || true

#1 [12/12] Opstartwachttijd opstartlader verkorten (1/2)
sudo sed    --in-place=.install-algemeen                                \
            --expression="s/^GRUB_HIDDEN_TIMEOUT/#GRUB_HIDDEN_TIMEOUT/" \
            --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/'            \
            /etc/default/grub
#1         Opstartwachttijd opstartlader verkorten (2/2)
sudo update-grub

# Einde installatiebestand.
