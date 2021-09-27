#############################################################################
# Bestand:  install-Ubuntu-16.04-desktop-algemeen.sh                        #
# Doel:     Algemeen installatiebestand voor Ubuntu 16.04 LTS desktop.      #
# Gebruik:  In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-Ubuntu-16.04-desktop-algemeen.sh          #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-Ubuntu-16.04-desktop-algemeen.sh             #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht                                       #
#           'install -s install-Ubuntu-16.04-desktop-algemeen.sh'.          #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-03-25  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.20.3
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# Software installeren                                                      #
#---------------------------------------------------------------------------#
#2
#2 Installeer software (algemene instructie)
## -----------------------------------------
#2 1. Klik op het Ubuntu-logo linksboven in de Starter of druk éénmaal (kort)
#2    op de Super-toets¹.
#2    Dit open de Snelzoeker, zoek sof en klik op Ubuntu Software.
#2 2. Zoek het programma en klik op Installeren.
#2 3. Druk druk éénmaal (kort) op de Super-toets¹.
#2    Dit open de Snelzoeker, zoek ter en klik op Terminalvenster.
#2    Typ:
#2      install
#2      -of-
#2      install -s
#2      en kopieer en plak de gewenste opdrachten (in blauw)
#2      -of-
#2      install -i
#2      en volg Installeer <programma>
#2 ____________________
#2 ¹  De Super-toets is de Windows-toets of Apple-toets.
#3
#3 Verwijder software (algemene instructie)
## ----------------------------------------
#3 1. Klik op het Ubuntu-logo linksboven in de Starter of druk éénmaal (kort)
#3    op de Super-toets¹.
#3    Dit open de Snelzoeker, zoek sof en klik op Ubuntu Software.
#3 2. Zoek het programma en klik op Verwijderen.
#3 3. Druk druk éénmaal (kort) op de Super-toets¹.
#3    Dit open de Snelzoeker, zoek ter en klik op Terminalvenster.
#3    Typ:
#3      sudo apt purge <programma>
#3      -of-
#3      install -i
#3      en volg Verwijder <programma>
#3 ____________________
#3 ¹  De Super-toets is de Windows-toets of Apple-toets.

#1 [ 1/10] Installeer multimedia-ondersteuning
## Script getstarted past locatie /home/... aan.
sudo bash /home/karel/scripts/install-multimedia.sh

#1 [ 2/10] Installeer Google Chrome 64-bit - webbrowser
## Script getstarted past locatie /home/... aan.
sudo bash /home/karel/scripts/install-google-chrome.sh

#1 [ 3/10] Installeer KeePassX - wachtwoordkluis
sudo apt-get install --yes keepassx

#1 [ 4/10] Installeer Skype - (beeld)bellen over het internet
## Script getstarted past locatie /home/... aan.
sudo bash /home/karel/scripts/install-skype.sh

#1 [ 5/10] Installeer Lightning - agenda voor Thunderbird - e-mail/nieuws
sudo apt-get install --yes xul-ext-lightning

#1 [ 6/10] Installeer VLC - multimediaspeler
sudo apt-get install --yes vlc

#1 [ 7/10] Installeer extra stuurprogramma's
: # Geen opdracht. Gebruik optie info-install (-i) voor informatie.
#2
#2 Installeer extra stuurprogramma's
## ---------------------------------
#2 1. Zoek sof en klik op Software & Updates.
#2 2. Ga naar Extra stuurprogramma's.
#2 3. Selecteer de aanwezige niet-vrije stuurprogramma's en klik op
#2    Wijzigingen doorvoeren.

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#

#1 [ 8/10] Wijzig taalondersteuning
sudo apt-get install --yes $(check-language-support)

#1 [ 9/10] Wijzig foutrapportage
## Configuratiebestand aanpassen.
sudo sed --in-place --expression='s/enabled=1/enabled=0/' /etc/default/apport
## Service uitzetten.
sudo systemctl disable --now apport.service

#1 [10/10] Wijzig opstartwachttijd
## Opstartlader toont 2 seconden het opstartmenu (was 10 seconden).
sudo sed --in-place --expression='s/GRUB_TIMEOUT=10/GRUB_TIMEOUT=2/' \
/etc/default/grub
## Wijziging toepassen.
sudo update-grub

# Einde installatiebestand.
