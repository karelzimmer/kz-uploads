#############################################################################
# Bestand:  install-Ubuntu-14.04-desktop-algemeen.sh                        #
# Doel:     Algemeen installatiebestand voor Ubuntu 14.04 LTS desktop.      #
# Gebruik:  In het terminalvenster met script install (aanbevolen):         #
#           install install-Ubuntu-14.04-desktop-algemeen.sh                #
#           Direct in het terminalvenster:                                  #
#           bash install-Ubuntu-14.04-desktop-algemeen.sh                   #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s'.                         #
# Gebruikt: -                                                               #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0 NL).                                #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-01-17  Eerste versie.                              #
#           2.0.0   2014-01-31  Naam bestand gewijzigd.                     #
#           3.0.0   2014-08-27  Recordsoorten gewijzigd.                    #
#############################################################################
# VERSION_NUMBER=3.30.0
# RELEASE_DATE=2016-04-06

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#

#2 +------------------------------------------------------------------------+
#2 |                            *** Algemeen ***                            |
#2 +------------------------------------------------------------------------+
#2 | Installeren:                                                           |
#2 | -  Start Terminalvenster en typ:                                       |
#2 |    install                                                             |
#2 |    -of-                                                                |
#2 |    install -s                                                          |
#2 |    kopieer en plak de gewenste opdrachten (schuingedrukt)              |
#2 | Verwijderen (tenzij anders aangegeven):                                |
#2 | -  Start Ubuntu softwarecentrum, zoek het programma en klik op         |
#2 |    Verwijderen.                                                        |
#2 |    -of-                                                                |
#2 |    Start Terminalvenster en typ:                                       |
#2 |    sudo apt-get purge <naam-programma>                                 |
#2 |    -of-                                                                |
#2 |    install -i                                                          |
#2 |    volg de aanwijzingen bij het programma                              |
#2 +------------------------------------------------------------------------+

#1 [ 1/8 ] Google Chrome webbrowser 64-bit (1/6)
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | \
sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null; \
else false; \
fi
#1         Google Chrome webbrowser 64-bit (2/6)
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
wget --quiet --output-document=- \
https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -; \
else false; \
fi
#1         Google Chrome webbrowser 64-bit (3/6)
## Voorkom fouten a.g.v. missende i386-pakketten op Ubuntu/Debian 64-bit.
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
sudo sed --in-place --expression='s/deb http/deb [arch=amd64] http/' \
/etc/apt/sources.list.d/google-chrome.list; \
else false; \
fi
#1         Google Chrome webbrowser 64-bit (4/6)
## Voorkom fouten a.g.v. missende i386-pakketten op Ubuntu/Debian 64-bit.
## Als Google Chrome nog niet aanwezig is, zorgt opdracht true voor
## afsluitwaarde 0.
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
sudo sed --in-place --expression='s/deb http/deb [arch=amd64] http/' \
/opt/google/chrome/cron/google-chrome || true; \
else false; \
fi
#1         Google Chrome webbrowser 64-bit (5/6)
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
sudo apt-get --assume-yes update; \
else false; \
fi
#1         Google Chrome webbrowser 64-bit (6/6)
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
sudo apt-get --assume-yes install google-chrome-stable; \
else false; \
fi
#2 +------------------------------------------------------------------------+
#2 |                          Google Chrome 64-bit                          |
#2 +------------------------------------------------------------------------+
#2 | Verwijderen:                                                           |
#2 | -  Start Terminalvenster en typ:                                       |
#2 |    sudo apt-get purge google-chrome-stable                             |
#2 |    sudo rm /etc/apt/sources.list.d/google-chrome.list*                 |
#2 |    sudo apt-get update                                                 |
#2 +------------------------------------------------------------------------+

#1 [ 2/8 ] KeePassX wachtwoordkluis
sudo apt-get --assume-yes install keepassx

#1 [ 3/8 ] Multimedia-ondersteuning (1/3)
## Accepteer vooraf de EULA.
echo 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
select true' | sudo debconf-set-selections
#1         Multimedia-ondersteuning (2/3)
sudo apt-get --assume-yes install ubuntu-restricted-extras libavcodec-extra \
libdvdread4 winff
#1         Multimedia-ondersteuning (3/3)
sudo /usr/share/doc/libdvdread4/install-css.sh

#1 [ 4/8 ] Skype (beeld)bellen over het internet (1/4)
## Ref: https://help.ubuntu.com/community/Skype
## Zet alleen de binaire partner-repo aan (de sourcecode partner-repo niet):
sudo sed --in-place=.$(date +%Y-%m-%d-%H.%M.%S) \
"/^# deb .*partner/ s/^# //" /etc/apt/sources.list
#1         Skype (beeld)bellen over het internet (2/4)
## Installatie voorbereiden - pakketlijsten verversen
sudo apt-get --assume-yes update
#1         Skype (beeld)bellen over het internet (3/4)
sudo apt-get --assume-yes install skype
#1         Skype (beeld)bellen over het internet (4/4)
## Alleen 64-bit systeem:
if [[ $(dpkg --print-architecture) = 'amd64' ]]; then \
sudo apt-get --assume-yes install gtk2-engines-murrine:i386 \
gtk2-engines-pixbuf:i386 sni-qt:i386; \
fi

#1 [ 5/8 ] Mozilla Thunderbird Agenda
sudo apt-get --assume-yes install xul-ext-lightning

#1 [ 6/8 ] VLC multimediaspeler
sudo apt-get --assume-yes install vlc

#1 [ 7/8 ] Taalondersteuning controleren
## Dit als laatste "programma" "installeren"!
sudo apt-get --assume-yes install $(check-language-support)

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
#1 [ 8/8 ] Foutrapportage interne debugger uitschakelen (1/2)
sudo sed --in-place=.$(date +%Y-%m-%d-%H.%M.%S) 's/enabled=1/enabled=0/' \
/etc/default/apport
#1         Foutrapportage interne debugger uitschakelen (2/2)
## Als apport al is gestopt, zorgt opdracht true voor afsluitwaarde 0.
sudo service apport stop || true

# Einde installatiebestand.
