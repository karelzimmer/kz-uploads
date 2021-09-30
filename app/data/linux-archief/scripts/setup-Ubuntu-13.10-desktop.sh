#############################################################################
# Bestand:  setup-Ubuntu-13.10-desktop-algemeen.sh                          #
# Doel:     Algemeen instellingsbestand voor het wijzigen van               #
#           gebruikersinstellingen voor Ubuntu 13.10 desktop.               #
# Gebruik:  Door script setup, zie 'setup.sh --help'.                       #
#           In het terminalvenster met script setup via                     #
#           './setup.sh --file=setup-Ubuntu-13.10-desktop-algemeen.sh'      #
#           (aanbevolen).                                                   #
#           Direct in het terminalvenster via                               #
#           'bash setup-Ubuntu-13.10-desktop-algemeen.sh'.                  #
# Gebruikt: Instellingsbestand setup-silverlight.sh.                        #
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
# RELEASE_DATE=2014-04-12

#---------------------------------------------------------------------------#
# Gebruikersinstellingen wijzigen                                           #
#---------------------------------------------------------------------------#
#* [1/7] Winkelsuggesties in zoekresultaat uitsluiten
## Aanpassen via Snelzoeker > Toepassingen-lens > Dash plugins > rechtsklik 
## <pluginnaam> > Uitschakelen.
gsettings set com.canonical.Unity.Lenses disabled-scopes "[\
'more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', \
'more_suggestions-populartracks.scope', 'music-musicstore.scope', \
'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', \
'more_suggestions-skimlinks.scope']"

#* [2/7] Enkelklik om te openen activeren
## Aanpassen via starter Bestanden > Bestanden > Voorkeuren > tab Gedrag.
gsettings set org.gnome.nautilus.preferences click-policy single

#* [3/7] Schermbeveiliging uitschakelen
## Aanpassen via Systeeminstellingen > Helderheid en vergrendelen.
gsettings set org.gnome.desktop.screensaver lock-enabled false

#* [4/7] Werkbladwisselaar inschakelen (1/2)
## Aanpassen via Systeeminstellingen > Uiterlijk > tab Gedrag.
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
hsize 2
#*       Werkbladwisselaar inschakelen (2/2)
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ \
vsize 2

#* [5/7] Datum en weeknummers inschakelen (1/3)
## Aanpassen via Systeeminstellingen > Tijd en datum > tab Klok.
gsettings set com.canonical.indicator.datetime show-date true
#*       Datum en weeknummers inschakelen (2/3)
gsettings set com.canonical.indicator.datetime show-day true
#*       Datum en weeknummers inschakelen (3/3)
gsettings set com.canonical.indicator.datetime show-week-numbers true

#* [6/7] Video in de browser (Silverlight) instellen
bash setup-silverlight.sh
#?       ********************************************************************
#?       * Voor informatie over Silverlight voer uit:                       *
#?       * ./setup.sh --info --file=setup-silverlight.sh                    *
#?       ********************************************************************

# Instellingsbestand eindigt hier.
