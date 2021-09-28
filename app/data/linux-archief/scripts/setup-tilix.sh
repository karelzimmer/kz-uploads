#############################################################################
# Bestand:  setup-tilix.sh                                                  #
# Doel:     Instellingsbestand voor Tilix.                                  #
# Gebruik:  Opdrachtregel in een instellingsbestand (aanbevolen).           #
#           In het terminalvenster met script setup (aanbevolen):           #
#           setup ~/bin/setup-tilix.sh                                      #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-tilix.sh                                       #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'setup -s setup-tilix.sh'.            #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-10-18  Eerste versie.                              #
#           2.0.0   2017-03-20  Hernoemd (v/h setup-terminix.sh).           #
#############################################################################
# VERSION_NUMBER=2.2.4
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# Tilix instellen                                                           #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Stel in Tilix - meer terminalvensters in één venster
## Tilix (boven)in Starter vastzetten (Unity).
## Als niet op Unity zorgt opdracht true voor afsluitwaarde 0.
gsettings get com.canonical.Unity.Launcher favorites | \
grep --quiet 'tilix.desktop' || \
gsettings set com.canonical.Unity.Launcher favorites \
"$(gsettings get com.canonical.Unity.Launcher favorites | \
sed "s|\\[|\\['application://tilix.desktop', |")" || true

## Tilix (boven)aan favorieten toevoegen (GNOME).
## Als niet op GNOME zorgt opdracht true voor afsluitwaarde 0.
gsettings get org.gnome.shell favorite-apps | \
grep --quiet 'tilix.desktop' || gsettings set org.gnome.shell favorite-apps \
"$(gsettings get org.gnome.shell favorite-apps | \
sed "s|\\[|\\['tilix.desktop', |")" || true
#2
#2 Stel in Tilix - meer terminalvensters in één venster
## ----------------------------------------------------
#2 1. Start Tilix.
#2 2. Ga naar Voorkeuren > Standaard.
#2 3. Klik op Opdracht (tab).
#2 4. Vink aan Opdracht uitvoeren als inlog-shell.

# Einde instellingsbestand.
