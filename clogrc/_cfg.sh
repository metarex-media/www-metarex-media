#                                                  _                                                     _   _
#  __ __ __ __ __ __ __ __ __  ___   _ __    ___  | |_   __ _   _ _   ___  __ __  ___   _ __    ___   __| | (_)  __ _
#  \ V  V / \ V  V / \ V  V / |___| | '  \  / -_) |  _| / _` | | '_| / -_) \ \ / |___| | '  \  / -_) / _` | | | / _` |
#   \_/\_/   \_/\_/   \_/\_/        |_|_|_| \___|  \__| \__,_| |_|   \___| /_\_\       |_|_|_| \___| \__,_| |_| \__,_|
if [ -z "$(echo $SHELL|grep zsh)" ];then eval "$(clog Inc)";else source <(clog Inc);fi
PROJECT=www-metarex-media
bEXE="$PROJECT"
bDOCKER_NS="metarexmedia"
svelteFolder="svelte"
callingSCRIPT="${0##*/}"
vCodeType="hugo"
vCodeSrc="data/releases.yaml"
# A golang module must have a "v" semver prefix. A website does not
vCODE=$(clog Sh vCODE)
bMSG=$(clog Sh git-message-ref)
