# common file data for building openwebsite
#           common (+ link to docs)
#      ↗     ↗       ↑      ↖       ↖
#  check → build → test → deploy → postfix
#
#  opentsg-node component: github build / deploy / release
#
# --- clog functions ----------------------------------------------------------
# [ -n "$COMMON_ALREADY_SOURCED" ] && echo "multiple source of COMMON" && exit 0
COMMON_ALREADY_SOURCED=YES
[ -f clogrc/_inc.sh ] && source clogrc/_inc.sh
export isZSH="$ZSH_VERSION"                # [ -n "isZSH" ] && echo "shell=zsh"

# --- colors ------------------------------------------------------------------
c="\e[3"; R=1m; G=2m; B=4m; C=6m; M=5m; Y=3m; K=0m; W=7m; cX="\e[0m"
cC=$c$B; cU=$c$C; cT=$c$K; cI=$c$Y; cE=$c$R; cW=$c$M; cS=$c$G; cF=$c$W; cH=$c$C
# printf "$cC cmd$cU url$cT txt$cI inf$cE err$cW wrn$cS ok!$cF fle$cH hdr$cX\n"

# --- platform & branch-- only set ic clog is installed and sourced -----------

bCPU="$cPU"
bOSV="$cOS"
gBRANCH=$(git branch --show-current)

# --- tagging -----------------------------------------------------------------

function fTagLocal () {  git tag -a "$1" HEAD -m "$2" ; }
function fTagRemote() {  git push origin "$1" ; }
function fDivider  () { printf "$cT---------=---------=---------=---------=---------=---------=---------=---------$cX\n";}
# --- user interaction --------------------------------------------------------

# --- comon data --------------------------------------------------------------

# fPrompt "Continue?" "yN" 7 ; index=$?       # 0 based index or len() after 7s
#
function fPrompt () {
  local SEC OPT DFT opt
  SEC="$3";  [ -z "$SEC" ] && SEC=5                   # timeout in seconds
  OPT="$2";  [ -z "$OPT" ] && OPT="Yn"                # valid option chars
  DFT=$(echo "$OPT" |grep -E -o "[A-Z]")              # default == CAPS char
  [ -z "$DFT" ] && DFT=${OPT:0:1}                     # 1st char if no caps
  opt=$(echo "$OPT" | tr '[:upper:]' '[:lower:]')     # to lowercase

  printf -- "$1 (%s) " "$OPT"                           # prompt and options
  while true; do
    # force bash to reparse the options of `read` every time through loop
    unset OPTIND
    if [[ -n "$isZSH" ]] ; then
      read -t "$SEC" -k key                           # zsh readh
      [ $? -gt 0 ] &&  key="$DFT"                     # timeout -> default
    else
      read -s -t "$SEC" -n 1 key                      # bash read
      [ ${#key} -eq 0 ] && key="$DFT"                 # timeout -> default
    fi
    key=$( echo "$key" | tr '[:upper:]' '[:lower:]' ) # make lowercase
    if [[ $opt == *"$key"* ]] ; then                  # key in opt?
      index=${opt%%$key*}
      [ -n "$isZSH" ] && printf "%s\n" "${(U)key}"    # print uppercase key
      [ -z "$isZSH" ] && printf "%s\n" "${key^^}"     # print uppercase key
      return ${#index}                                # 0 based index
    fi
    printf -- "\b  \b"                        # erase char & try again
  done
}

# --- check functions - getRemoteTag ------------------------------------------

# getRemoteTag - returns "notag" if empty
# $OOPS - inbound error count
# $? - newly incremented error count
# $1 - url of a repo e.g. https://mrmxf.com/opentsg-node.git
# $2 - [ -z "$2" ] && adds warning & error colors
# usage: ver=$( getRemoteTag "https://dom/repo/project.git" ) ; OOPS=$?

function getRemoteTag () {
  local TAG=""
  # choose default or specified URL based on $1
  case "$1" in
  ""|"default"|"origin") TAG=$(git ls-remote --tags  2>/dev/null) ;;
  *)                     TAG=$(git ls-remote --tags "$1" v\* 2>/dev/null) ;;
  esac
  # if there was an error then return the current error count
  [ "$?" -ne 0 ]  && ((OOPS++)) && return $OOPS       # unknown error on stdout
  TAG=$(echo $TAG | head -1 | sed -r 's/.*\/([\.0-9]*).*/\1/')

  [[ "$TAG" == "" ]] && printf "notag" && ((OOPS++))
  printf  "%s" $TAG
  return $OOPS
}

# colourTag
# $1 - reference tag A.B.C
# $2 -  semantic tag X.Y.Z
# usage: pretty=$( colourTag 1.2.3 1.2.4 )

function colourTag () {
  # color major & minor rev: Success / Error
  # color patch              Success / Warning
  local ref tag msg opt

  opt="-ra" && [ -n "isZSH" ] && opt="-ra"

  IFS='.' read $opt ref <<< "$1"                    # array of raef
  IFS='.' read $opt tag <<< "$2"                    # array of tag

  if [[ "${ref[0]}" == "${tag[0]}" ]]; then  msg="$cS${tag[0]}";  else  msg="$cE${tag[0]}"; fi
  if [[ "${ref[1]}" == "${tag[1]}" ]]; then msg+="$cS.${tag[1]}"; else msg+="$cW.${tag[1]}"; fi
  if [[ "${ref[2]}" == "${tag[2]}" ]]; then msg+="$cS.${tag[2]}"; else msg+="$cI.${tag[2]}"; fi

  printf "$msg$cT"
}
# --- check functions - fAddReport  ----------------------------------------------

# Print out the status of something
# $1 = category string e.g. "github"
# $2 = message text
# $3 = color for the thing (e.g. $cE for error)
# $4 = value of the thing
# $5 = show highlight arrow with this text if present
function fAddReport() {
  #initialise storage if empty
  [ -z ${reportStrings+x} ] && reportStrings=()

  local catColor="" message="" value="" arrow=""

  [[ -n "$5" ]] && arrow="$cE<$cW--$cI--$cS--$5$cX"
  case "$1" in
    project                      ) catColor=${cS} ;;
    golang|python|code|hugo      ) catColor=${cC} ;;
    local|action                 ) catColor=${cI} ;;
    remote                       ) catColor=${cH} ;;
    bitbucket|"dep: bitbucket"   ) catColor=${cF} ;;
    github|"dep: github"         ) catColor=${cS} ;;
    gitlab|"dep: github"         ) catColor=${cW} ;;
    worktree|tree|hash|tags      ) catColor=${cE} ;;
    *                            ) catColor=${cT} ;;
  esac
  message=$(printf "${catColor}%12s $cT %22s" "$1" "$2")
  value="$3$4"
  reportStrings+=("$(printf "${category} $message $value $arrow$cX")")
}

# --- check functions - fShowReport  ----------------------------------------------

function fShowReport() {
  [ -z ${reportStrings+x} ] && "No Report available" && exit 1

  for i in ${!reportStrings[@]}; do echo "${reportStrings[$i]}"; done
}

function fReport() {
  isRef=""
  [[ -n "$5" ]] && isRef="$cE<$cW--$cI--$cS--ref tag$cX"
  case "$1" in
    "local")                         category=$(printf "${cI}%12s" "$1") ;;
    "golang"|"python"|"code"|"hugo") category=$(printf "${cC}%12s" "$1") ;;
    "local")                         category=$(printf "${cI}%12s" "$1") ;;
    "remote")                        category=$(printf "${cH}%12s" "$1") ;;
    "github"    | "dep: github")     category=$(printf "${cS}%12s" "$1") ;;
    "gitlab"    | "dep: github")     category=$(printf "${cW}%12s" "$1") ;;
    "bitbucket" | "dep: bitbucket")  category=$(printf "${cF}%12s" "$1") ;;
    *)                               category=$(printf "${cT}%12s" "$1") ;;
  esac
  msg=$(printf "$cT %17s" "$2")
  printf "${category} $msg $3$4 $isRef$cX\n"
}

# --- build documentation with sphinx -----------------------------------------

# supply extra args as $1

function fSphinx(){
  printf "${cI}INFO$cT Building documentation$cT with$cC sphinx-build$cX\n"
  sphinx-build $1 docs/ docs/_build/
}

# --- remind dev they're on a critical branch ---------------------------------

function fShowBranchBanner(){
    m=$cE'   __  __     _     ___   _  _     ___   ___     _     _  _    ___   _  _ '$cX"\n"
  m=$m$cE'  |  \/  |   /_\   |_ _| | \| |   | _ ) | _ \   /_\   | \| |  / __| | || |'$cX"\n"
  m=$m$cE'  | |\/| |  / _ \   | |  | .` |   | _ \ |   /  / _ \  | .` | | (__  | __ |'$cX"\n"
  m=$m$cE'  |_|  |_| /_/ \_\ |___| |_|\_|   |___/ |_|_\ /_/ \_\ |_|\_|  \___| |_||_|'$cX"\n"
  [[ "$_COMMON_SH_DONE" != "TRUE" ]] && [[ "$gBRANCH" == "main" ]] && printf "$m"

    m=$cS'                _                               _    '$cX"\n"
  m=$m$cS'   _ _   __    | |__   _ _   __ _   _ _    __  | |_  '$cX"\n"
  m=$m$cS'  | `_| / _|   | `_ \ | `_| / _` | | ` \  / _| | ` \ '$cX"\n"
  m=$m$cS'  |_|   \__|   |_.__/ |_|   \__,_| |_||_| \__| |_||_|'$cX"\n"
  [[ "$_COMMON_SH_DONE" != "TRUE" ]] && [[ "$gBRANCH" == "rc" ]] && printf "$m"
}

# --- end ---------------------------------------------------------------------
_COMMON_SH_DONE=TRUE
