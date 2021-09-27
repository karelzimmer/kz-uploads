#############################################################################
# Bestand:  install-docker.sh                                               #
# Doel:     Installatiebestand voor Docker.                                 #
# Gebruik:  Opdrachtregel in een installatiebestand (aanbevolen).           #
#           In het terminalvenster met script install (aanbevolen):         #
#           install ~/bin/install-docker.sh                                 #
#           Direct in het terminalvenster:                                  #
#           bash ~/bin/install-docker.sh                                    #
#           Een opdrachtregel kan ook uitgevoerd worden door deze eerst     #
#           te kopiëren, en daarna te plakken in het terminalvenster,       #
#           bijvoorbeeld via opdracht 'install -s install-docker.sh'.       #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0  #
# Internationaal licentie (CC BY-SA 4.0).                                   #
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie #
# te zien van de licentie of stuur een brief naar Creative Commons,         #
# PO Box 1866, Mountain View, CA 94042, USA.                                #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2016-08-20  Eerste versie.                              #
#############################################################################
# VERSION_NUMBER=1.1.15
# RELEASE_DATE=2017-06-08

#---------------------------------------------------------------------------#
# Docker installeren                                                        #
#---------------------------------------------------------------------------#

#1 [ 1/1 ] Installeer Docker - toepassingen binnen software containers
# Update package information, ensure that APT works with the https method,
# and that CA certificates are installed.
sudo apt-get install --yes apt-transport-https ca-certificates

## Add the new GPG key.
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D

## Add an entry for your Ubuntu operating system.
echo "deb https://apt.dockerproject.org/repo \
ubuntu-$(lsb_release --codename --short) main" | \
sudo tee /etc/apt/sources.list.d/docker.list

## Update the APT package index.
sudo apt-get update

## Purge the old repo if it exists.
sudo apt-get purge --yes lxc-docker

## Verify that APT is pulling from the right repository.
sudo apt-cache policy docker-engine

## Install Docker.
sudo apt-get install --yes docker-engine

## Optional configurations ##
# Create the docker group and add your user.
sudo usermod -aG docker ${SUDO_USER:-$USER}
#3
#3 Verwijder Docker - toepassingen binnen software containers
## ----------------------------------------------------------
#3 Start Terminalvenster en typ, of kopieer en plak:
#3   sudo apt purge docker-engine
#3   sudo rm /etc/apt/sources.list.d/docker.list*
#3   sudo deluser $USER docker
#3   sudo delgroup docker
#3   sudo apt update

# Einde installatiebestand.
