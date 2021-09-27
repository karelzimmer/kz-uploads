#############################################################################
# Bestand:  install-LinuxMint-17.1-desktop-algemeen.sh                      #
# Doel:     Installatiebestand voor Linux Mint 17.1 desktop algemeen.       #
# Gebruik:  Door script install, zie './install.sh --help' (aanbevolen).    #
#           In het terminalvenster met script install via                   #
#           './install.sh install-LinuxMint-17.1-desktop-algemeen.sh'       #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'sudo bash install-LinuxMint-17.1-desktop-algemeen.sh'.         #
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
# Versies:  1.0.0   2015-01-01  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.0.0
# RELEASE_DATE=2015-01-01

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#1 [ 1/10] Installatie voorbereiden (1/2)
sudo apt-get --assume-yes update
#1         Installatie voorbereiden (2/2)
sudo apt-get --assume-yes upgrade

#1 [ 2/10] Webbrowser - Google Chrome
sudo bash install-google-chrome.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Chrome                           *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Chrome voer uit:                *
#2         *    ./install.sh --info install-google-chrome.sh                *
#2         *----------------------------------------------------------------*

#1 [ 3/10] Mijn schijf in de cloud - Google Drive
sudo bash install-google-drive.sh
#2         *----------------------------------------------------------------*
#2         *                        Google Drive                            *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Google Drive voer uit:                 *
#2         *    ./setup.sh --info setup-google-drive.sh                     *
#2         *----------------------------------------------------------------*

#1 [ 4/10] Wachtwoordkluis - KeePassX
sudo apt-get --assume-yes install keepassx

#1 [ 5/10] Multimedia-ondersteuning - WinFF
sudo apt-get --assume-yes install winff

#1 [ 6/10] Gratis (beeld)bellen over het Internet - Skype
sudo bash install-skype.sh
#2         *----------------------------------------------------------------*
#2         *                        Skype                                   *
#2         * -------------------------------------------------------------- *
#2         * Informatie:                                                    *
#2         * -  Voor informatie over Skype voer uit:                        *
#2         *    ./install.sh --info install-skype.sh                        *
#2         *----------------------------------------------------------------*

#1 [ 7/10] Mozilla Thunderbird E-mail/nieuws - Agenda
sudo apt-get --assume-yes install xul-ext-lightning

#1 [ 8/10] YouTube downloader (1/4)
sudo apt-get --assume-yes install zenity
#1         YouTube downloader (2/4)
sudo cp youtube-dl.sh /usr/bin/
#1         YouTube downloader (3/4)
sudo chmod a+x /usr/bin/youtube-dl.sh
#1         YouTube downloader (4/4)
sudo desktop-file-install --rebuild-mime-info-cache youtube-dl.desktop

#1 [ 9/10] Installatie afronden (1/3)
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)
#1         Installatie afronden (2/3)
sudo apt-get --assume-yes autoclean
#1         Installatie afronden (3/3)
sudo apt-get --assume-yes autoremove

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#1 [10/10] Opstartwachttijd opstartlader verkorten (1/2)
sudo sed    --in-place                                          \
            --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/'    \
            /etc/default/grub
#1         Opstartwachttijd opstartlader verkorten (2/2)
sudo update-grub

# Einde installatiebestand.
