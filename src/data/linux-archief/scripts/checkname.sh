#!/bin/bash
#############################################################################
# Bestand:  checkname.sh                                                    #
# Doel:     Script voor het controleren van NTFS map- en bestandsnamen.     #
# Gebruik:  ./checkname.sh [opties]                                         #
# Gebruikt: script-common.sh    (algemene variabelen en functies)           #
# Auteur:   Karel Zimmer (http://karelzimmer.nl, info@karelzimmer.nl)       #
# ------------------------------------------------------------------------- #
# Auteursrecht © 2012-2014 Karel Zimmer.                                    #
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
# Versies:  1.0.0   2012-05-18  Eerste versie.                              #
#           2.0.0   2014-12-05  Van optie 'start MAP' naar argument MAP.    #
#############################################################################
readonly VERSION_NUMBER=2.0.0
readonly RELEASE_DATE=2014-12-05

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
    echo "Is 'cd /tmp; wget karelzimmer.nl/gs; bash gs' uitgevoerd?"
    echo 'Voor scripts zie http:/karelzimmer.nl, klik op Linux.'
    exit 1
    }

#---------------------------------------------------------------------------#
# Globale constanten                                                        #
#---------------------------------------------------------------------------#
# Algemeen ------------------------------------------------------------------
readonly SCRIPT_NEEDS_SUDO=false        # Uitvoeren als standaardgebruiker
readonly FIRST_COPYRIGHT_YEAR=2012      # Eerste auteursrechtjaar
readonly OPTIONS_HELP=$(cat << OPTIONS_HELP
    MAP                 begin te controleren vanaf map MAP
OPTIONS_HELP
)                                       # Extra hulp-opties (-h)
readonly OPTIONS_USAGE=$(cat << OPTIONS_USAGE

                   [MAP]
OPTIONS_USAGE
)                                       # Extra gebruiks-opties (-u)

# Specifiek -----------------------------------------------------------------
# Foutcodes -----------------------------------------------------------------
readonly E_STARTLOC_NOT_FOUND=64

#---------------------------------------------------------------------------#
# Globale variabelen                                                        #
#---------------------------------------------------------------------------#
# Normaal -------------------------------------------------------------------
declare STARTLOC="$(pwd)"               # Startlocatie

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
    toon_gebruik "$SCRIPT_NEEDS_SUDO" "$OPTION_USAGE"
    cat << HULP

Beschrijving:
    Script voor het controleren van NTFS map- en bestandsnamen.

    Dit script controleert op toegestane tekens in map- en bestandsnamen.
    Handig om te draaien vóór het kopiëren naar een NTFS (netwerk)schijf.

    Bij NTFS zijn niet toegestaan de tekens ? " / \ < > * | :
    Bij ext4   is niet toegestaan het teken     /
    daarom testen we hier op de tekens      ? "   \ < > * | :
    Bij NTFS zijn symbolische verwijzingen ook niet toegestaan.

    Als er bij de aanroep geen MAP is opgegeven wordt gezocht vanaf de map
    van waaruit dit script is aangeroepen.

$OPTIONS_HELP_SC
$OPTIONS_HELP
HULP
}

#-Functie-------------------------------------------------------------------#
# Naam: controleer_invoer                                                   #
# Doel: Initiële controles en/of acties.                                    #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
controleer_invoer() {
    if [[ ! -e $STARTLOC ]]; then
        error "Map $STARTLOC bestaat niet."
        exit $E_STARTLOC_NOT_FOUND
    fi
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
    normal  "Startlocatie: $STARTLOC"
    normal  "Logboek:      $LOG"
    log     "$DASHES"
    normal
}

#-Functie-------------------------------------------------------------------#
# Naam: zoek_mappen                                                         #
# Doel: Zoek alle mappen op en controleer op niet-toegestande tekens.       #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
zoek_mappen() {
    local file
    local good
    local -i count=0

    normal 'Op zoek naar foutieve mapnamen (DIR)...'

    #-----------------------------------------------------------------------#
    # Het maakt niet uit of in de bestandsnaam speciale tekens voorkomen    #
    # zoals tab, spatie, enz.  Hiervoor zorgt de find met print0,           #
    # en de read met IFS= en als delimiter de null character die            #
    # niet mag voorkomen in een bestandsnaam.                               #
    #-----------------------------------------------------------------------#
    while IFS= read -r -d $'\0' file; do

        # Verwijder de slechte tekens,  \ is escape voor " en :
        good=$(echo "$file" | tr --delete '\?\"\\\<\>\*\|\:')

        if [[ $file != $good ]]; then
            let count++
            normal "Badname DIR.: $file"
        fi
    done < <(
        find    "$STARTLOC" \
                -type d     \
                -print0
        )

    if [[ $count -eq 0 ]]; then
        success 'Er zijn geen foutieve mapnamen gevonden.'
    elif [[ $count -eq 1 ]]; then
        warning 'Er is één foutieve mapnaam gevonden.'
    else
        warning "Er zijn $count foutieve mapnamen gevonden."
    fi
}

#-Functie-------------------------------------------------------------------#
# Naam: zoek_bestanden                                                      #
# Doel: Zoek alle bestanden op en controleer op niet-toegestande tekens.    #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
zoek_bestanden() {
    local dirname
    local file
    local filename
    local good
    local -i count=0

    normal 'Op zoek naar foutieve bestandsnamen (FILE) en symlinks (SYML)...'

    while IFS= read -r -d $'\0' file; do

        good=$(echo "$file" | tr --delete '\?\"\\\<\>\*\|\:')

        if [[ $file != $good ]]; then
            let count++
            filename=$(basename "$file")
            dirname=$(dirname "$file")
            normal "Badname FILE: $filename in $dirname"
        fi

        if [[ -h $file ]]; then
            let count++
            normal "Badname SYML: $file"
        fi
    done < <(
        find    "$STARTLOC" \
                -type f     \
                -print0     \
                -or         \
                -type l     \
                -print0
        )

    if [[ $count -eq 0 ]]; then
        success 'Er zijn geen foutieve bestandsnamen en symlinks gevonden.'
    elif [[ $count -eq 1 ]]; then
        warning 'Er is één foutieve bestandsnaam en symlink gevonden.'
    else
        warning "Er zijn $count foutieve bestandsnamen en symlinks gevonden."
    fi
}

#-Functie-------------------------------------------------------------------#
# Naam: toon_afsluiten                                                      #
# Doel: Afsluitende meldingen en/of acties.                                 #
# Arg.: Geen argumenten.                                                    #
#---------------------------------------------------------------------------#
toon_afsluiten() {
    : # no-op
}

#############################################################################
# Hoofdlijn                                                                 #
#############################################################################
# init_script
{
    verwerk_invoer "$@"
    controleer_gebruiker "$SCRIPT_NEEDS_SUDO"
    bepaal_log "$SCRIPT_NEEDS_SUDO" LOG
    controleer_invoer
}
# verwerk
{
    toon_invoer
    toon_gestart
    zoek_mappen
    zoek_bestanden
    toon_gestopt
}
# afsl_script
{
    toon_afsluiten
    toon_afsluiten_sc
    exit $MAXRC
}

# Einde script.
