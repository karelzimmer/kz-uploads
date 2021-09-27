#############################################################################
# Installatiebestand voor Lubuntu 12.04 desktop.                            #
# ------------------------------------------------------------------------- #
# Dit bestand bevat opdracht- en commentaarregels en wordt gebruikt door    #
# script install.sh, zie install.sh --help. Een opdrachtregel kan ook       #
# uitgevoerd worden door deze te kopiëren in het terminalvenster.           #
# ------------------------------------------------------------------------- #
# Gemaakt door Karel Zimmer, http://karelzimmer.nl, info@karelzimmer.nl.    #
# Dit werk is gelicenseerd onder een                                        #
# Creative Commons Naamsvermelding-GelijkDelen 3.0 Nederland licentie.      #
# Bezoek http://creativecommons.org/licenses/by-sa/3.0/nl/ om een kopie te  #
# zien van de licentie of stuur een brief naar Creative Commons,            #
# 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.      #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2012-05-05  Eerste versie                               #
#           2.0.0   2013-07-28  Naamgeving bestand gewijzigd                #
#############################################################################
# VERNUM=2.0.0
# VERDAT=2013-07-28

#---------------------------------------------------------------------------#
# Pakketten installeren.                                                    #
#---------------------------------------------------------------------------#
sudo sh -c "echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefont\
-eula select true | debconf-set-selections"     # accepteer EULA MS-fonts [a]
sudo apt-get install --assume-yes ffmpeg        # video decoding en encoding
sudo apt-get install --assume-yes gimp          # afbeeldingenbewerker
sudo apt-get install --assume-yes keepassx      # wachtwoordkluis
sudo apt-get install --assume-yes lubuntu-restricted-extras # multimedia [a]
sudo apt-get install --assume-yes vlc           # multimediaspeler

#---------------------------------------------------------------------------#
# Overige opdrachten.                                                       #
#---------------------------------------------------------------------------#
sudo sed --in-place 's/enabled=1/enabled=0/' /etc/default/apport    # schake\
l apport uit
sudo /usr/share/doc/libdvdread4/install-css.sh  # beveiligde DVDs afspelen
sudo apt-get autoclean  --assume-yes            # pakketten opschonen
sudo apt-get autoremove --assume-yes            # pakketten opschonen

# Installatiebestand eindigt hier
