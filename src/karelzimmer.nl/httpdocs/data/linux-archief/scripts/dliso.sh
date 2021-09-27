#!/bin/bash
#############################################################################
# Bestand:  dliso.sh                                                        #
# Doel:     Script voor het parallel downloaden van Ubuntu beeldbestanden   #
#           (.iso).                                                         #
# Gebruik:  ./dliso.sh [opties]                                             #
# Gebruikt: script-common.sh    (algemene variabelen en functies)           #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Auteursrecht © 2014-2015 Karel Zimmer.                                    #
#                                                                           #
# Dit programma is vrije software: u mag het herdistribueren en/of wijzigen #
# onder de voorwaarden van de GNU Algemene Publieke Licentie zoals          #
# gepubliceerd door de Free Software Foundation, onder versie 3 van de      #
# Licentie of (naar Uw keuze) elke latere versie.                           #
#                                                                           #
# Dit programma is gedistribueerd in de hoop dat het nuttig zal zijn maar   #
# ZONDER ENIGE GARANTIE; zelfs zonder de impliciete garanties die           #
# GEBRUIKELIJK ZIJN IN DE HANDEL of voor BRUIKBAARHEID VOOR EEN SPECIFIEK   #
# DOEL.  Zie de GNU Algemene Publieke Licentie voor meer details.           #
#                                                                           #
# U hoort een kopie van de GNU Algemene Publieke Licentie te hebben         #
# ontvangen samen met dit programma. Als dat niet het geval is, zie         #
# http://www.gnu.org/licenses/.                                             #
# ------------------------------------------------------------------------- #
# Versies:  1.0.0   2014-07-31  Eerste versie.                              #
#           2.0.0   2014-08-01  Naam gewijzigd.                             #
#           3.0.0   2015-04-23  Versienummer opgeven, ook ubuntu-mate dl.   #
#############################################################################
readonly VERSION_NUMBER=3.3.0
readonly RELEASE_DATE=2015-06-09

#############################################################################
# Instellingen                                                              #
#############################################################################

#---------------------------------------------------------------------------#
# Algemene instellingen                                                     #
# ------------------------------------------------------------------------- #
# Lees de algemene variabelen en functies in.                               #
#---------------------------------------------------------------------------#
source script-common.sh 2> /dev/null || {
    echo "Het algemeen scriptbestand 'script-common.sh'"    >&2
    echo 'is niet gevonden of bevat fouten.'                >&2
    echo 'Dit algemeen scriptbestand wordt gewoonlijk door'
    echo "script getscripts (gs) gedownload en in '/tmp' geplaatst."
    echo "Is 'cd /tmp;wget karelzimmer.nl/gs;bash gs' uitgevoerd?"
    echo 'Voor meer informatie zie http://karelzimmer.nl.'
    exit 1
    }

#---------------------------------------------------------------------------#
# Globale constanten                                                        #
#---------------------------------------------------------------------------#
# Algemeen ------------------------------------------------------------------
readonly SCRIPT_NEEDS_SUDO=false        # Uitvoeren als standaardgebruiker
readonly FIRST_COPYRIGHTYEAR=2014       # Eerste auteursrechtjaar

# Specifiek -----------------------------------------------------------------
readonly S1=http://cdimage.ubuntu.com   # Downloadsite #1
readonly S2=http://releases.ubuntu.com  # Downloadsite #2
readonly TO="$HOME/Downloads"           # Doelmap

# Foutcodes -----------------------------------------------------------------

#---------------------------------------------------------------------------#
# Gobale variabelen                                                         #
#---------------------------------------------------------------------------#
# Normaal -------------------------------------------------------------------
declare V="$DISTREL"                    # Versienummer, bijv. 14.10

# Array, integer ------------------------------------------------------------
# Boolean -------------------------------------------------------------------

#############################################################################
# Functies (op volgorde van uitvoering)                                     #
#############################################################################

#-Functie-------------------------------------------------------------------#
# Naam: toon_hulp                                                           #
# Doel: Uitleg werking script.                                              #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
toon_hulp() {
    toon_gebruik_sc $SCRIPT_NEEDS_SUDO $OPTION_USAGE
    cat << HULP

Beschrijving:
    Script voor het parallel downloaden van Ubuntu beeldbestanden (.iso).

    Dit script downloadt parallel diverse Ubuntu Linux beeldbestanden (.iso).
    Standaard wordt dit uitgevoerd voor versie $V,
    maar kan tijdens de uitvoering van het script gewijzigd worden.
    De namen van de downloadsites staan "hard-coded" in dit script.

$OPTIONS_HELP_SC
HULP
}

#-Functie-------------------------------------------------------------------#
# Naam: controleer_invoer                                                   #
# Doel: Initiële controles en/of acties.                                    #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
controleer_invoer() {

    #-----------------------------------------------------------------------#
    # Vraag naar versienummer en codenaam.                                  #
    #-----------------------------------------------------------------------#
    clear
    log     "$DASHES"
    normal  "$HEADER"
    normal
    read -p "Wat is de versie van de distro? [$V]: "
    if [[ $REPLY != '' ]]; then
        V="$REPLY"
    fi

    #-----------------------------------------------------------------------#
    # Stel de URL-lijst samen op grond van de antwoorden.                   #
    #-----------------------------------------------------------------------#
    URL_LIST="\
    $S1/kubuntu/releases/$V/release/kubuntu-$V-desktop-i386.iso
    $S1/kubuntu/releases/$V/release/kubuntu-$V-desktop-amd64.iso
    $S1/lubuntu/releases/$V/release/lubuntu-$V-desktop-i386.iso
    $S1/lubuntu/releases/$V/release/lubuntu-$V-desktop-amd64.iso
    $S1/ubuntu-gnome/releases/$V/release/ubuntu-gnome-$V-desktop-i386.iso
    $S1/ubuntu-gnome/releases/$V/release/ubuntu-gnome-$V-desktop-amd64.iso
    $S1/ubuntu-mate/releases/$V/release/ubuntu-mate-$V-desktop-i386.iso
    $S1/ubuntu-mate/releases/$V/release/ubuntu-mate-$V-desktop-amd64.iso
    $S1/xubuntu/releases/$V/release/xubuntu-$V-desktop-i386.iso
    $S1/xubuntu/releases/$V/release/xubuntu-$V-desktop-amd64.iso
    $S2/$V/ubuntu-$V-desktop-i386.iso
    $S2/$V/ubuntu-$V-desktop-amd64.iso
    $S2/$V/ubuntu-$V-server-i386.iso
    $S2/$V/ubuntu-$V-server-amd64.iso"
}

#-Functie-------------------------------------------------------------------#
# Naam: toon_invoer                                                         #
# Doel: Toon wat het script gaat doen.                                      #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
toon_invoer() {
    clear
    log     "$DASHES"
    normal  "$HEADER"
    normal
    normal  "Versie:       $V"
    normal  "Bron\"mappen\": (op internet)"
    normal  "$(echo "$URL_LIST" | nl --number-width=9 --body-numbering=n)"
    normal  "Doelmap:      $TO"
    normal  "Logboek:      $LOG"
    log     "$DASHES"
    normal
}

#-Functie-------------------------------------------------------------------#
# Naam: verwijder_iso_md5sums                                               #
# Doel: Downlaod de beeldbestanden (.iso) en MD5SUMS.                       #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
verwijder_iso_md5sums() {

    #-----------------------------------------------------------------------#
    # Verwerk de keuze van de gebruiker.                                    #
    #-----------------------------------------------------------------------#
    normal
    warning "Alle beeldbestanden (.iso) en controlebestanden (MD5SUMS* en \
*.md5sum)"
    warning "worden vewijderd uit $HOME/Downloads"
    read -p 'Doorgaan met verwijderen? (j/N): '
    case $REPLY in
        j*|J*)
            log 'Alle beeldbestanden en controlebestanden verwijderen.'
            ;;
        n*|N*|'')
            toon_keuze_stop_sc
            ;;
        *)
            toon_keuze_fout_sc
            ;;
    esac

    #-----------------------------------------------------------------------#
    # Naar de doelmap.                                                      #
    #-----------------------------------------------------------------------#
    cd      "$TO"       \
            &>> "$LOG"

    #-----------------------------------------------------------------------#
    # Opruimen.                                                             #
    #-----------------------------------------------------------------------#
    normal 'Opruimen...'
    rm      --verbose   \
            *.iso       \
            MD5SUMS*    \
            *.md5sum    \
            &>> "$LOG"
}

#-Functie-------------------------------------------------------------------#
# Naam: download_iso_md5sums                                                #
# Doel: Downlaod de beeldbestanden (.iso) en MD5SUMS.                       #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
download_iso_md5sums() {

    #-----------------------------------------------------------------------#
    # Download iso's                                                        #
    # --------------------------------------------------------------------- #
    # xargs -n 1 zorgt ervoor dat per invoerregel 1 opdracht wordt gestart  #
    # xargs -P 4 zorgt ervoor dat maximaal 4 parallele taken worden gestart #
    #-----------------------------------------------------------------------#
    normal 'Downloaden...'
    echo    $URL_LIST       |
    xargs   -n 1            \
            -P 4            \
    wget                    |
    tee     --append "$LOG"

    #-----------------------------------------------------------------------#
    # Download MD5SUMS.                                                     #
    #-----------------------------------------------------------------------#
    wget    $S1/kubuntu/releases/$V/release/MD5SUMS         \
            --output-document=MD5SUMS_kubuntu               |
    tee     --append "$LOG"
    wget    $S1/lubuntu/releases/$V/release/MD5SUMS         \
            --output-document=MD5SUMS_lubuntu               |
    tee     --append "$LOG"
    wget    $S1/ubuntu-gnome/releases/$V/release/MD5SUMS    \
            --output-document=MD5SUMS_ubuntu-gnome          |
    tee     --append "$LOG"
    wget    $S1/ubuntu-mate/releases/$V/release/MD5SUMS     \
            --output-document=MD5SUMS_ubuntu-mate           |
    tee     --append "$LOG"
    wget    $S1/xubuntu/releases/$V/release/MD5SUMS         \
            --output-document=MD5SUMS_xubuntu               |
    tee     --append "$LOG"
    wget    $S2/$V/MD5SUMS                                  \
            --output-document=MD5SUMS_ubuntu                |
    tee     --append "$LOG"
}

#-Functie-------------------------------------------------------------------#
# Naam: toon_afsluiten                                                      #
# Doel: Afsluitende meldingen en/of acties.                                 #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
toon_afsluiten() {
    normal
    normal "Om de MD5SUMS-controlebestanden op te splitsen typ, of kopieer \
en plak: ./splitmd5sums.sh"
}

#############################################################################
# Hoofdlijn                                                                 #
#############################################################################
# init_script
{
    verwerk_invoer_sc "$@"
    controleer_gebruiker_sc $SCRIPT_NEEDS_SUDO
    bepaal_log_sc $SCRIPT_NEEDS_SUDO LOG
    controleer_invoer
}
# verwerk
{
    toon_invoer
    toon_gestart_sc
    verwijder_iso_md5sums
    download_iso_md5sums
    toon_gestopt_sc
}
# afsl_script
{
    toon_afsluiten
    toon_afsluiten_sc
    exit $MAXRC
}

# Einde script.
