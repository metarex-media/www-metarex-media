# clog> build  # build & push www-metarex-media docker images
#  _             _  _       _                                                                                                          _  _
# | |           (_)| |     | |                                               _                                                        | |(_)
# | |__   _   _  _ | |   __| |   _ _ _  _ _ _  _ _ _  _____  ____   _____  _| |_  _____   ____  _____  _   _  _____  ____   _____   __| | _  _____
# |  _ \ | | | || || |  / _  |  | | | || | | || | | |(_____)|    \ | ___ |(_   _)(____ | / ___)| ___ |( \ / )(_____)|    \ | ___ | / _  || |(____ |
# | |_) )| |_| || || | ( (_| |  | | | || | | || | | |       | | | || ____|  | |_ / ___ || |    | ____| ) X (        | | | || ____|( (_| || |/ ___ |
# |____/ |____/ |_| \_) \____|   \___/  \___/  \___/        |_|_|_||_____)   \__)\_____||_|    |_____)(_/ \_)       |_|_|_||_____) \____||_|\_____|
eval "$(clog Inc)"
eval "$(clog project config)"
eval "$(cat clogrc/help-hugo.sh)"
clog Check build

if $(clog is-production); then
  clog Log -W "PRODUCTION mode"
  hopts=""
  dopts="--push"
else
  clog Log -I "development mode"
  # we're in development mode, so build quickly
  hopts="--gc --logLevel info"
  dopts="--push"
fi
fHugoBuild "$opts"

dockerfile="clogrc/dockerfile"
repo="metarexmedia"

fHugoDocker "$hopts" "$dockerfile" "linux/arm64" "$repo/www-metarex-media-arm:latest" "$repo/www-metarex-media-arm:$(clog git tag ref)"
fHugoDocker "$hopts" "$dockerfile" "linux/amd64" "$repo/www-metarex-media-amd:latest" "$repo/www-metarex-media-amd:$(clog git tag ref)"

FoundLocally="$(docker images | grep -oE "metarexmedia\/www-metarex-media-arm\s+$(clog git tag ref)")"
if [ -z "$FoundLocally" ]; then
   fError "Build failed? Docker image (www-metarex-media:$(clog git tag ref)) not found locally\n"
   fError "Aborting....\n"
   exit 1
fi

if $(clog is-production); then
   clog Log -W "PRODUCTION mode build complete"
else
  clog Log -I "development build complete"
  clog Log -I "clog test  to run image port 12080"
fi
