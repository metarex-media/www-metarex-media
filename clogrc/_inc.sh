#                                                  _                                                     _   _
#  __ __ __ __ __ __ __ __ __  ___   _ __    ___  | |_   __ _   _ _   ___  __ __  ___   _ __    ___   __| | (_)  __ _
#  \ V  V / \ V  V / \ V  V / |___| | '  \  / -_) |  _| / _` | | '_| / -_) \ \ / |___| | '  \  / -_) / _` | | | / _` |
#   \_/\_/   \_/\_/   \_/\_/        |_|_|_| \___|  \__| \__,_| |_|   \___| /_\_\       |_|_|_| \___| \__,_| |_| \__,_|
source <(clog Inc)
PROJECT=www-metarex-media
bEXE="www-metarex-media"
svelteFolder="svelte"
callingSCRIPT="${0##*/}"
vCodeType="hugo"
vCodeSrc="data/history.yaml"
vCODE=$(cat $vCodeSrc | grep version | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
bMSG=$(cat  $vCodeSrc | grep note | head -1 | sed -nr "s/note: (.*)/\1/p" | xargs)
