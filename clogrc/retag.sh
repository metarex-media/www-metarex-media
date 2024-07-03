# usage> retag
# short> Re-Tag local HEAD & remote to the right version
# long>  use when tweaking a build to pass all the minor tests

[ -f clogrc/_inc.sh ] && source clogrc/_inc.sh

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
      read -rsn1 -t "$SEC" key                      # bash read
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

fPrompt "Retag to version$cW $vCODE$cT $vCodeType ($cW $vCodeSrc $cT)$cX" "yN" 5

[ $? -ne 0 ] && fInfo "Nope - exit" && exit 0

CommitMSG="$(git log -1 --pretty=%B)"
fInfo "Retagging to$cW $vCODE$cT ($cS$CommitMSG$cT)...$cX"

git tag -d $vCODE
git tag -a $vCODE HEAD -m "$CommitMSG"
[ $? -eq 0 ] && fOk "HEAD is now$cW $vCODE$cT ($cS$CommitMSG$cT)$cX"
git push --delete origin "$vCODE" 2>/dev/null
git push origin "$vCODE"
[ $? -eq 0 ] && fOk "Remote is in sync with local$cX"