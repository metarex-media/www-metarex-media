#                                                  _                                                     _   _
#  __ __ __ __ __ __ __ __ __  ___   _ __    ___  | |_   __ _   _ _   ___  __ __  ___   _ __    ___   __| | (_)  __ _
#  \ V  V / \ V  V / \ V  V / |___| | '  \  / -_) |  _| / _` | | '_| / -_) \ \ / |___| | '  \  / -_) / _` | | | / _` |
#   \_/\_/   \_/\_/   \_/\_/        |_|_|_| \___|  \__| \__,_| |_|   \___| /_\_\       |_|_|_| \___| \__,_| |_| \__,_|
PROJECT=www-metarex-media
callingSCRIPT="${0##*/}"
vCODE=$(cat data/history.yaml | grep version | head -1 | grep -oE 'v[0-9]+\.[0-9]+\.[0-9]+')
vCodeType="hugo"
bEXE="mrx-website"
bMSG=$(cat data/history.yaml | grep note | head -1 | sed -nr "s/note: (.*)/\1/p" | xargs)