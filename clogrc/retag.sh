# usage> retag
# short> Re-Tag local HEAD & remote to the right version
# long>  use when tweaking a build to pass all the minor tests

[ -f clogrc/_cfg.sh ] && source clogrc/_cfg.sh

fInfo "Retagging to $cW $vCODE$cT $vCodeType ($cW $bMSG $cT)"

# silently delete existing tag if it exists
fInfo "${cC}git tag$cS -d$cW \"$vCODE\""
            git tag    -d      $vCODE       2>/dev/null

# set the tag to the HEAD
fInfo "${cC}git tag$cS -a$cW \"$vCODE\"$cS HEAD -m$cW \"$bMSG\""
            git tag    -a      "$vCODE"    HEAD -m     "$bMSG"

fInfo "${cC}git push$cS --delete$cW origin$cS \"$vCODE\""
            git push    --delete    origin "$vCODE"      2>/dev/null


fInfo "${cC}git push$cS origin$cS \"$vCODE\""
            git push    origin     "$vCODE"