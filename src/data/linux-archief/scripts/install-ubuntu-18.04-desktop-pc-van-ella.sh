# shellcheck shell=bash
# ##############################################################################
# Bestand: install-ubuntu-18.04-desktop-pc-van-ella.sh
# Doel:    Installatiebestand voor Ubuntu 18.04 LTS desktop op pc-van-ella
# Auteur:  Karel Zimmer (https://karelzimmer.nl, info@karelzimmer.nl)
# ------------------------------------------------------------------------------
# Dit werk valt onder een Creative Commons Naamsvermelding-GelijkDelen 4.0
# Internationaal licentie (CC BY-SA 4.0).
# Bezoek http://creativecommons.org/licenses/by-sa/4.0/deed.nl om een kopie te
# zien van de licentie of stuur een brief naar Creative Commons, PO Box 1866,
# Mountain View, CA 94042, USA.
# ##############################################################################
# REL_NUM=03.04.01
# REL_DAT=2020-04-22
# REL_MSG='Installatie Virtualbox gewijzigd'

#@virtualbox
#1 VirtualBox virtualisatieprogramma
## Images staan in ~/VirtualBox VMs/.
echo 'virtualbox-ext-pack virtualbox-ext-pack/license select true' | sudo debconf-set-selections
sudo apt-get install --yes virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso
#2 Met een AMD-processor zal AMD-V wel aanstaan, maar bij Intel moet vaak VT-x
#2 aangezet worden in het BIOS of UEFI-firmware!
#3 Start Terminalvenster en voer uit:
#3    sudo apt remove virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso

# Einde installatiebestand
