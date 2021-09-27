#############################################################################
# Bestand:  setup-Xubuntu-14.04-desktop-algemeen.sh                         #
# Doel:     Instellingsbestand voor Xubuntu 14.04 LTS desktop algemeen.     #
# Gebruik:  In het terminalvenster met script setup via                     #
#           './setup.sh --file=setup-Xubuntu-14.04-desktop-algemeen.sh'     #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'bash setup-Xubuntu-14.04-desktop-algemeen.sh'.                 #
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
# Versies:  1.0.0   2014-07-19  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.2.0
# RELEASE_DATE=2014-07-26

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#* [1/1] Video in de browser instellen (Silverlight)          1/3
#?       ####################################################################
#?       #                          Silverlight                             #
#?       # Controle:                                                        #
#?       # 1. Ga naar Firefox webbrowser.                                   #
#?       # 2. Klik op 'Silverlight activeren'.                              #
#?       # 3. Klik op 'Toestaan en onthouden'.                              #
#?       # 4. Op pagina 'Silverlight Balls Animation Test' zijn dansende    #
#?       #    ballen zijn zichtbaar.                                        #
#?       ####################################################################
firefox http://bubblemark.com/silverlight2.html
#?       ********************************************************************
#?       *                          Silverlight                             *
#?       * Gebruik:                                                         *
#?       * Met Firefox webbrowser.                                          *
#?       * Informatie:                                                      *
#?       * Silverlight is nodig voor Netflix, Uitzending Gemist, etc.       *
#?       * Voor meer informatie over User Agent Overrider zie               *
#?       * karelzimmer.nl > Linux > ALGEMEEN >                              *
#?       * Linux opdrachten en informatie.                                  *
#?       ********************************************************************

#*       Video in de browser instellen (User Agent Overrider) 2/3
## Voeg toe via Firefox webbrowser > Extra > Add-ons > Add-ons verkrijgen,
## zoek op User Agent Overrider, installeer User Agent Overrider.
wget    --no-clobber            \
        --directory-prefix=/tmp \
        https://addons.mozilla.org/firefox/downloads/latest/429678/\
addon-429678-latest.xpi
#*       Video in de browser instellen (User Agent Overrider) 3/3
firefox /tmp/addon-429678-latest.xpi
#?       ********************************************************************
#?       *              Firefox add-on User Agent Overrider                 *
#?       * Gebruik:                                                         *
#?       * 1. Start, of ga naar, Firefox webbrowser.                        *
#?       * 2. Klik rechtsboven op pijltje en kies een combinatie van        *
#?       *    Windows en Firefox.                                           *
#?       * 3. Klik rechtsboven op symbool, blauw is actief (voor Netflix),  *
#?       *    grijs is niet actief (normaal gebruik).                       *
#?       * Informatie:                                                      *
#?       * User Agent Overrider is, in combinatie met Silverlight, nodig    *
#?       * voor Netflix.                                                    *
#?       * Voor meer informatie over User Agent Overrider zie               *
#?       * karelzimmer.nl > Linux > ALGEMEEN >                              *
#?       * Linux opdrachten en informatie.                                  *
#?       ********************************************************************

# Instellingsbestand eindigt hier.
