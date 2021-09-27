#############################################################################
# Installatiebestand voor Xubuntu 12.04 desktop.                            #
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
# Versies:  1.0.0   2012-05-08  Eerste versie                               #
#           8.0.0   2013-07-28  Naamgeving bestand gewijzigd                #
#############################################################################
# VERNUM=2.0.0
# VERDAT=2013-07-28

#
# Pakketten installeren
#
sudo apt-get install --assume-yes emesene       # chatten ala MSN
sudo apt-get install --assume-yes ffmpeg        # video decoding en encoding
sudo apt-get install --assume-yes gimp          # afbeeldingen bewerken
sudo apt-get install --assume-yes k3b           # brandprogramma
sudo apt-get install --assume-yes keepassx      # wachtwoordkluis
sudo apt-get install --assume-yes xubuntu-restricted-extras     # multimedia
sudo apt-get install --assume-yes vlc           # multimediaspeler

#
# Overige opdrachten
#
sudo /usr/share/doc/libdvdread4/install-css.sh  # beveiligde DVDs afspelen
sudo apt-get autoclean  --assume-yes            # pakketten opschonen
sudo apt-get autoremove --assume-yes            # "

# Installatiebestand eindigt hier
