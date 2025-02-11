# clog> build  # build www-metarex-media docker images
#  _             _  _       _                                                                                                          _  _
# | |           (_)| |     | |                                               _                                                        | |(_)
# | |__   _   _  _ | |   __| |   _ _ _  _ _ _  _ _ _  _____  ____   _____  _| |_  _____   ____  _____  _   _  _____  ____   _____   __| | _  _____
# |  _ \ | | | || || |  / _  |  | | | || | | || | | |(_____)|    \ | ___ |(_   _)(____ | / ___)| ___ |( \ / )(_____)|    \ | ___ | / _  || |(____ |
# | |_) )| |_| || || | ( (_| |  | | | || | | || | | |       | | | || ____|  | |_ / ___ || |    | ____| ) X (        | | | || ____|( (_| || |/ ___ |
# |____/ |____/ |_| \_) \____|   \___/  \___/  \___/        |_|_|_||_____)   \__)\_____||_|    |_____)(_/ \_)       |_|_|_||_____) \____||_|\_____|
eval "$(clog Inc)"
eval "$(clog project config)"
eval "$(cat clogrc/help-hugo.sh)"
# clog Check

$devMode=[ -z "$1" ]

if $devMode; then
   fInfo "${cE}DEVELOPMENT$cW mode"
  # we're in development mode, so build quickly
  opts="--gc --logLevel info"
else
   fInfo "${cE}Production$cW mode"
fi
fHugoBuild "$opts"

# override these values to use development friendly values
if $devMode; then
   opts="--push"
fi
dockerfile="clogrc/dockerfile"
VV="$(clog git tag ref)"
# ignore the repo environment if set
repo="metarexmedia"

fHugoDocker "$opts" "$dockerfile" "linux/arm64" "$repo/www-metarex-media-arm:latest" "$repo/www-metarex-media-arm:$VV"
fHugoDocker "$opts" "$dockerfile" "linux/amd64" "$repo/www-metarex-media-amd:latest" "$repo/www-metarex-media-amd:$VV"

BuildImageFound="$(docker images | grep -oE "metarexmedia\/www-metarex-media-arm\s+$VV")"
if [ -z "$BuildImageFound" ]; then
   fError "Build failed? Docker image (www-metarex-media:$VV) not found locally\n"
   fError "Aborting....\n"
   exit 1
fi

if $devMode; then
  fInfo "1.$cC clog test$cT to try the docker image"
fi
