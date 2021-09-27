#############################################################################
# Bestand:  install-Debian-8-desktop-algemeen.sh                            #
# Doel:     Installatiebestand voor Debian 8 desktop algemeen.              #
# Gebruik:  Door script install, zie 'install --help' (aanbevolen).         #
#           In het terminalvenster met script install via                   #
#           'install install-Debian-8-desktop-algemeen.sh' (aanbevolen).    #
#           Direct in het terminalvenster via                               #
#           'bash install-Debian-8-desktop-algemeen.sh'.                    #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst te  #
#           kopiëren, en daarna te plakken in het terminalvenster.          #
# Gebruikt: install-google-chrome.sh    (Google Chrome)                     #
#           install-google-drive.sh     (Google Drive)                      #
#           install-skype-debian.sh     (Skype)                             #
#           install-youtube-dl.sh       (YouTube downloader)                #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 3.0  #
# Nederland licentie (CC BY-SA 3.0 NL).                                     #
# Bezoek http://creativecommons.org/licenses/by-sa/3.0/nl/ om een kopie te  #
# zien van de licentie of stuur een brief naar Creative Commons,            #
# 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.      #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2015-06-08  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.3.6
# RELEASE_DATE=2015-07-16

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#1 [ 1/13] Installatie voorbereiden - pakketlijsten aanpassen (1/3)
## Zet de sourcecode- en cdrom-repo uit, en zet de niet-vrije (non-free) en
## contrib repo aan:
sudo sed    --in-place=.install-algemeen-$(date +%Y-%m-%d-%H.%M.%S) \
            --expression="s/^deb cdrom/# deb cdrom/"                \
            --expression="s|debian/ $(lsb_release --codename --short) main$\
|debian/ $(lsb_release --codename --short) main non-free contrib|"  \
            /etc/apt/sources.list
#1         Installatie voorbereiden - pakketlijsten verversen (2/3)
sudo apt-get --assume-yes update
#1         Installatie voorbereiden - evt updates installeren (3/3)
sudo apt-get --assume-yes dist-upgrade

#1 [ 2/13] Fonts - Ubuntu Font Family (1/5)
sudo wget   http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip \
            --output-document=/tmp/ubuntu-font-family-0.80.zip
#1          Fonts - Ubuntu Font Family (2/5)
sudo unzip  /tmp/ubuntu-font-family-0.80.zip
#1          Fonts - Ubuntu Font Family (3/5)
sudo mkdir --verbose /usr/share/fonts/ubuntu-font-family-0.80
#1          Fonts - Ubuntu Font Family (4/5)
sudo cp --verbose /tmp/ubuntu-font-family-0.80/*.ttf \
        /usr/share/fonts/ubuntu-font-family-0.80/
#1          Fonts - Ubuntu Font Family (5/5)
sudo fc-cache --force --verbose

#1 [ 3/13] Webbrowser - Google Chrome
sudo bash install-google-chrome.sh

#1 [ 4/13] Mijn schijf in de cloud - Google Drive
sudo bash install-google-drive.sh
#2         +----------------------------------------------------------------+
#2         |                        Google Drive                            |
#2         |----------------------------------------------------------------|
#2         | TIJDELIJK BUITEN BEDRIJF                                       |
#2         | Informatie:                                                    |
#2         | -  Voor informatie over Google Drive voer uit:                 |
#2         |    setup --info setup-google-drive.sh                          |
#2         | TIJDELIJK BUITEN BEDRIJF                                       |
#2         +----------------------------------------------------------------+

#1 [ 5/13] Wachtwoordkluis - KeePassX
sudo apt-get --assume-yes install keepassx gnome-session-canberra
## gnome-session-canberra: anders foutmelding 'canberra-gtk-module
## load failed'.

#1 [ 6/13] Hardware uitlijsten - lshw
sudo apt-get --assume-yes install lshw

#1 [ 7/13] Multimedia-ondersteuning - pakketlijsten aanpassen (1/4)
## CSS-beveilige DVDs afspelen.
## Ref: https://wiki.debian.org/CDDVD#DVD
sudo bash -c 'echo "deb http://www.deb-multimedia.org $(lsb_release --codena\
me --short) main non-free" > /etc/apt/sources.list.d/deb-multimedia.list'
#1         Multimedia-ondersteuning - pakketlijsten verversen (2/4)
sudo apt-get --assume-yes update; \
sudo apt-get --assume-yes --force-yes install deb-multimedia-keyring; \
sudo apt-get --assume-yes update
#1         Multimedia-ondersteuning - evt updates installeren (3/4)
sudo apt-get --assume-yes dist-upgrade
#1         Multimedia-ondersteuning - FlashPlayer... install. (4/4)
## Ref: https://wiki.debian.org/FlashPlayer
## flashplugin-nonfree en gstreamer0.10-plugins-ugly: afhankelijk van
## niet-vrije (non-free) en contrib repo.
## libdvdread4 en libdvdcss2: afhankelijk van deb-multimedia repo.
sudo apt-get --assume-yes install flashplugin-nonfree \
gstreamer0.10-plugins-ugly libdvdread4 libdvdcss2 winff

#1 [ 8/13] Gratis (beeld)bellen over het internet - Skype
sudo bash install-skype-debian.sh

#1 [ 9/13] Icedove E-mail/nieuws - E-mail
## Icedove is een fork van Mozilla Thunderbird.
sudo apt-get --assume-yes install icedove icedove-l10n-nl iceowl-extension \
iceowl-l10n-nl

#1 [10/13] Multimediaspeler - VLC
sudo apt-get --assume-yes install vlc

#1 [11/13] YouTube downloader
sudo bash install-dlyoutube.sh
#2         +----------------------------------------------------------------+
#2         |                        YouTube downloader                      |
#2         |----------------------------------------------------------------|
#2         | Gebruik:                                                       |
#2         | -  Voor informatie over het gebruik van YouTube downloader     |
#2         |    voer uit:                                                   |
#2         |    install --info install-dlyoutube.sh                         |
#2         +----------------------------------------------------------------+

#1 [12/13] Installatie afronden - taalondersteuning (1/2)
## Iceweasel is een fork van Mozilla Firefox.
sudo apt-get --assume-yes install iceweasel-l10n-nl libreoffice-l10n-nl
#1         Installatie afronden - pakketten schonen (2/2)
sudo apt-get --assume-yes autoclean; sudo apt-get --assume-yes autoremove

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#1 [13/13] Opstartwachttijd opstartlader verkorten - GRUB (1/2)
sudo sed    --in-place=.install-algemeen-$(date +%Y-%m-%d-%H.%M.%S) \
            --expression="s/^GRUB_DEFAULT=0/GRUB_DEFAULT=6/"        \
            --expression='s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=3/'         \
            /etc/default/grub
#1         Opstartwachttijd opstartlader verkorten - GRUB (2/2)
sudo update-grub

# Einde installatiebestand.
