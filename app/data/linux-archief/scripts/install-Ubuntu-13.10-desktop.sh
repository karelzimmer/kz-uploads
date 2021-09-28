#############################################################################
# Bestand:  install-Ubuntu-13.10-desktop-algemeen.sh                        #
# Doel:     Algemeen installatiebestand voor het installeren van            #
#           software en het wijzigen van systeeminstellingen voor           #
#           Ubuntu 13.10 desktop.                                           #
# Gebruik:  Door script install, zie 'install.sh --help'.                   #
#           In het terminalvenster met script install via                   #
#           './install.sh --file=install-Ubuntu-13.10-desktop-algemeen.sh'  #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'sudo bash install-Ubuntu-13.10-desktop-algemeen.sh'.           #
# Gebruikt: Installatiebestand install-silverlight.sh.                      #
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
# Versies:  1.0.0   2013-07-08  Eerste versie.                              #
#           2.0.0   2013-07-28  Naamgeving bestand gewijzigd.               #
#           3.0.0   2014-01-31  Naamgeving bestand gewijzigd.               #
#############################################################################
# VERSION_NUMBER=3.5.0
# RELEASE_DATE=2014-04-16

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#* [ 1/20] E-boek bibliotheekbeheer (Calibre)
sudo apt-get --assume-yes install calibre

#* [ 2/20] Geluid gelijkmaken (easyMP3Gain)
sudo apt-get --assume-yes install easymp3gain-gtk

#* [ 3/20] ID3-labels bewerken (EasyTAG)
sudo apt-get --assume-yes install easytag

#* [4/20] Afbeeldingenbewerker (GIMP) 1/3
sudo apt-get --assume-yes install gimp
#*         Afbeeldingenbewerker (GIMP) 2/3
sudo apt-get --assume-yes install gimp-help-en
#*         Afbeeldingenbewerker (GIMP) 3/3
sudo apt-get --assume-yes install gimp-help-nl

#* [ 5/20] Grafische frontend voor su(do) (gksu)
sudo apt-get --assume-yes install gksu

#* [ 6/20] Wachtwoordkluis (KeePassX)
sudo apt-get --assume-yes install keepassx

#* [ 7/20] Brandprogramma (K3b) 1/3
sudo apt-get --assume-yes install k3b
#*         Brandprogramma (K3b) 2/3
sudo apt-get --assume-yes install k3b-i18n
#*         Brandprogramma (K3b) 3/3
sudo apt-get --assume-yes install libk3b6-extracodecs

#* [ 8/20] Multimediaspeler (VLC)
sudo apt-get --assume-yes install vlc

#* [ 9/20] Conversie multimediaformaten (WinFF)
sudo apt-get --assume-yes install winff

#* [10/20] Kalender extensie voor Thunderbird (Lightning)
sudo apt-get --assume-yes install xul-ext-lightning

#* [11/20] Beveiligde DVDs afspelen (libdvdcss) 1/2
sudo apt-get --assume-yes install libdvdread4
#*         Beveiligde DVDs afspelen (libdvdcss) 2/2
sudo /usr/share/doc/libdvdread4/install-css.sh

#* [12/20] Niet-vrije pakketten (restricted-extras) 1/2
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#*         Niet-vrije pakketten (restricted-extras) 2/2
sudo apt-get --assume-yes install ubuntu-restricted-extras

#* [13/20] Windows-software op Linux (Wine) 1/2
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#*         Windows-software op Linux (Wine) 2/2
sudo apt-get --assume-yes install wine

#* [14/20] Gratis bellen over het Internet (Skype) 1/3
sudo sed --in-place "/^# deb .*partner/ s/^# //" /etc/apt/sources.list
#*         Gratis bellen over het Internet (Skype) 2/3
sudo apt-get update
#*         Gratis bellen over het Internet (Skype) 3/3
sudo apt-get --assume-yes install skype

#* [15/20] Video in de browser (Silverlight)
sudo bash install-silverlight.sh
#?         ******************************************************************
#?         * Voor informatie over Silverlight voer uit:                     *
#?         * ./install.sh --info --file=install-silverlight.sh              *
#?         * N.B.                                                           *
#?         * Silverlight wordt ingesteld door script setup.                 *
#?         ******************************************************************

#* [16/20] Volledige taal-ondersteuning (check-language-support)
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#* [17/20] Pakketten opschonen (1/2).
sudo apt-get --assume-yes autoclean
#*         Pakketten opschonen (2/2).
sudo apt-get --assume-yes autoremove 

#* [18/20] Firewall aanzetten (ufw)
sudo ufw enable

#* [19/20] Foutrapportage interne debugger uitschakelen (apport)
sudo sed --in-place 's/enabled=1/enabled=0/' /etc/default/apport

#* [20/20] Opstartwachttijd opstartlader verkorten (GRUB) 1/2
sudo sed --in-place 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=3/' /etc/default/grub
#*         Opstartwachttijd opstartlader verkorten (GRUB) 2/2
sudo update-grub

# Installatiebestand eindigt hier.
