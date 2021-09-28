#!/bin/sh
#############################################################################
# Bestand:  init-debian.sh                                                  #
# Doel:     Script voor het initialiseren van Debian (+sudo, -root).        #
# Gebruik:  ./init-debian.sh                                                #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst te  #
#           kopiëren, en daarna te plakken in het terminalvenster.          #
# Gebruikt: Eén verplicht argument: <gebruikersnaam>                        #
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
# VERSION_NUMBER=1.3.0
# RELEASE_DATE=2015-06-22

#---------------------------------------------------------------------------#
# !! Overbodig als root wachtwoord leeg wordt gelaten bij de installatie !! #
#---------------------------------------------------------------------------#

#---------------------------------------------------------------------------#
# Systeeminstellingen wijzigen                                              #
#---------------------------------------------------------------------------#
# sudo instellen
echo "sudo instellen - geef wachtwoord van 'root'..."
su --command "adduser $USERNAME sudo"

# root uitschakelen
echo "root uitschakelen - geef wachtwoord van 'root'..."
su --command 'passwd -l root'

# effectueren
echo
echo "\033[43mVoer nu de volgende akties uit:\033[0m"
echo "\033[43m1. Meld gebruiker $USERNAME af\033[0m"
echo "\033[43m2. Meld gebruiker $USERNAME aan\033[0m"
echo
echo "\033[42mDaarna is sudo te gebruiken en is root uitgeschakeld.\033[0m"

# Einde initialisatiescript.
