#############################################################################
# Bestand:  setup-gradio.sh                                                 #
# Doel:     Instellingsbestand voor Gradio.                                 #
# Gebruik:  Opdrachtregel in een instellingsbestand (aanbevolen).           #
#           In het terminalvenster met script setup (aanbevolen):           #
#           setup ~/bin/setup-gradio.sh                                     #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/setup-gradio.sh                                      #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'setup -s setup-gradio.sh'.           #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-10-18  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.1.2
# RELEASE_DATE=2017-07-06

#---------------------------------------------------------------------------#
# Gradio instellen                                                          #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Stel in Gradio - desktop internetradio-speler
## Gradio (boven)in Starter vastzetten (Unity).
## Als niet op Unity zorgt opdracht true voor afsluitwaarde 0.
gsettings get com.canonical.Unity.Launcher favorites | \
grep --quiet 'de.haeckerfelix.gradio.desktop' || \
gsettings set com.canonical.Unity.Launcher favorites \
"$(gsettings get com.canonical.Unity.Launcher favorites |\
sed "s|\\[|\\['application://de.haeckerfelix.gradio.desktop', |")" || true

## Gradio (boven)aan favorieten toevoegen (GNOME).
## Als niet op GNOME zorgt opdracht true voor afsluitwaarde 0.
gsettings get org.gnome.shell favorite-apps | \
grep --quiet 'de.haeckerfelix.gradio.desktop' || \
gsettings set org.gnome.shell favorite-apps \
"$(gsettings get org.gnome.shell favorite-apps | \
sed "s|\\[|\\['de.haeckerfelix.gradio.desktop', |")" || true

# Einde instellingsbestand.
