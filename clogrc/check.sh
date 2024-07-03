 # clog> check
# short> pre-build & deploy checks
# extra> $1 = "ignore-errors" or "no-fixup"
#                                                  _                                                     _   _
#  __ __ __ __ __ __ __ __ __  ___   _ __    ___  | |_   __ _   _ _   ___  __ __  ___   _ __    ___   __| | (_)  __ _
#  \ V  V / \ V  V / \ V  V / |___| | '  \  / -_) |  _| / _` | | '_| / -_) \ \ / |___| | '  \  / -_) / _` | | | / _` |
#   \_/\_/   \_/\_/   \_/\_/        |_|_|_| \___|  \__| \__,_| |_|   \___| /_\_\       |_|_|_| \___| \__,_| |_| \__,_|
[ -n "$CHECK_ALREADY_SOURCED" ] && return 0
CHECK_ALREADY_SOURCED=YES
[ -f clogrc/_inc.sh   ] && source clogrc/_inc.sh    # repo name etc.
[ -f clogrc/common.sh ] && source clogrc/common.sh  # helper functions

fShowBranchBanner
fAddReport "project" "clogrc/_inc.sh" "$cS" "$PROJECT" "project"

ignoreErrs=""; [[ "$1" == "ignore-errors" ]] && ignoreErrs="YES"
noFix=""     ; [[ "$1" == "no-fixup"      ]] && ignoreErrs="YES" && noFix="YES"

# --- status ------------------------------------------------------------------
OOPS=0                                   # non zero is bad - count the problems

# --- git repo dependencies ---------------------------------------------------
dC=() ; dVer=()
#n="opentsg-node"   ; dName=("$n");  dRepo=("https://github.com/mrmxf/$n.git")

# --- git working tree handling -----------------------------------------------
untrackedCount=$(git ls-files --others --exclude-standard | wc -l)
modifiedCount=$(git ls-files --modified --exclude-standard | wc -l)

issue=$(git status | grep 'ntracked files')
[ -n "$issue" ] && fAddReport "worktree" "untracked:" $cE "$untrackedCount to stage" && ((OOPS++))

issue=$(git status | grep 'hanges not staged for commit')
[ -n "$issue" ]  && fAddReport "worktree" "modified files:" $cE "$modifiedCount to commit" && ((OOPS++))
#printf "${cE}Commit$cT changes before build$cX\n" && ((OOPS++))

issue=$(git status | grep 'branch is ahead')
[ -n "$issue" ]  &&  fAddReport "worktree" "branch is ahead- push" $cE "changes" && ((OOPS++))
#printf "${cE}Push$cT changes before build$cX\n" && ((OOPS++))

issue=$(git status | grep 'working tree clean')
[ -z "$issue" ] &&  fAddReport "worktree" "unclean" $cE "stage changes?" && ((OOPS++))
#printf "${cE}Changes detected$cT Working tree must be$cS clean$cT before build$cX\n" && ((OOPS++))

# --- tag handling ------------------------------------------------------------
vLOCAL=$(git tag  -l --sort=v:refname | tail -1) && [ -z "$vLOCAL" ] && vLOCAL="notag"
vHEAD=$(git tag --points-at HEAD) && [ -z "$vHEAD" ]                 && vHEAD="notag"
vREPO=$(getRemoteTag "default"); OOPS=$?

vREF="$vCODE"                                     # vCODE is defined in _inc.sh

hashLOCAL=$(git rev-list -n 1 $vLOCAL 2>/dev/null)
[ "$?" -gt 0 ] && hashLOCAL="none (L)"

# ^{} is the git suffix to dereference the commit hash
hashREPO=$(git ls-remote 2>/dev/null | grep "$vREF\^{}" | head -1 | sed -r 's/^([0-9a-f]{40}).*/\1/')
[ -z "$hashREPO" ] && hashREPO="none (R)"


# print out the BRANCH we're on - show main in red, rc in green
case "$gBRANCH" in
  "main") fAddReport "local" "MAIN branch" "$cE" "$gBRANCH" ;;
  "rc")   fAddReport "local"   "rc branch" "$cS" "$gBRANCH" ;;
  *)      fAddReport "local"      "branch" "$cT" "$gBRANCH" ;;
esac

#print out the matching tags
fAddReport "$vCodeType" "$vCodeSrc" "$cS" $vCODE "reference tag"

fAddReport "local"      "git latest" ""    $(colourTag "$vREF" "$vLOCAL")
fAddReport "local"      "git HEAD"   ""    $(colourTag "$vREF" "$vHEAD")
fAddReport "remote"     "git latest" ""    $(colourTag "$vREF" "$vREPO")


# get tag from the repos & update error count from the subprocess
for i in ${!dRepo[@]}; do
  ver=$( getRemoteTag ${dRepo[$i]} ) ; OOPS=$?
  dVer+=ver
  fAddReport "dep: github" "${dName[$i]}" "$cT" "$(colourTag $vREF $ver)"
done

# --- local tag fixup ---------------------------------------------------------

if [[ "$vLOCAL" != "$vREF" ]] && [[ -z "$noFix" ]]; then
  printf "${cT}ref tag (${cW}$vREF$cX) != local tag  (${cW}$vLOCAL$cX)\n" && ((OOPS++))
  printf "Suggest tagging local with $vREF.\n"
fi

# --- head tag fixup ---------------------------------------------------------

if [[ "$vHEAD" != "$vREF" ]] && [[ -z "$noFix" ]]; then
  fAddReport "tags"   "ref tag (${cW}$vREF$cX) != HEAD tag" "$cW" "$(colourTag $vREF $vHEAD)" && ((OOPS++))
  fAddReport "action" "try: re-tag $vREF to HEAD?"
fi

# --- remote tag fixup --------------------------------------------------------

if [[ ( "$vHEAD" == "$vREF" ) && ( "$vREPO" != "$vREF" ) ]]  && [[ -z "$noFix" ]] ; then
  fAddReport "tags"   "reference (${cW}$vREF$cX) != origin" "$cW" "$(colourTag $vREF $vREPO)" && ((OOPS++))
  fAddReport "action" "try: git push origin $vREF"
else
  # local and remote tags match but do they point to the right repo?
  if [[ "$hashLOCAL" != "$hashREPO" ]] ; then
    hLoc=$(printf "$cI${hashLOCAL:0:8}")
    hRem="${hashREPO:0:8}"
    fAddReport "hash"   "local (${cW}$vREF$cX) !=" "$cW" "($vREPO) $hRem" && ((OOPS++))
    fAddReport "action" "try: git push --delete origin $cW$vREF?$cT"
  fi
fi
# --- check for local theme ---------------------------------------------------

configFile="config/_default/module.yaml"
isLocalTheme=$(cat $configFile | grep -Eon "^replacements")
if [ -n "$isLocalTheme" ]; then
  linenumber=$(echo $isLocalTheme | sed 's/:.*//')
  fAddReport "hugo"   "local theme in use"               "$cE" "$configFile" "fix this" && ((OOPS++))
  fAddReport "action" "try: $cW#replacements$cT in line" "$cE" "$linenumber" "fix this"
fi

# --- environemnt variables ---------------------------------------------------

[ -z "$PROJECT " ] && fAddReport "project"   "env$cE PROJECTI$cT not set" "$cE" "-" "fix this" && ((OOPS++))

# export the commit ID & date & type for the build
DATE=$(date +%F)
[[ "main" == "$gBRANCH" ]] && gBRANCH=""

# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# pull in any keys for uploads/builds etc.
[ ! -f .env ] && fAddReport "project"   "using script defaults" "$cT" ".env absent"
[   -f .env ] && fAddReport "project"   "source overrides from" "$cI" "$(pwd)/.env" && source .env
# -----------------------------------------------------------------------------

fShowReport

# --- exit handling -----------------------------------------------------------
if [[ -n "$ignoreErrs" ]] ; then
  [ $OOPS -gt 0 ] && printf "${cT}Ignoring $cW$OOPS$cT issues from$cC check$cX.\n"
else
  if [ $OOPS -gt 0 ] ; then
    printf "${cE}Error $cW$OOPS$cT issues from$cC check$cX.\n"
    exit $OOPS
  fi
fi
