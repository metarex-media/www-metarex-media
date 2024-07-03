# usage> build
# short> www-metarex-media
# long>  build the hugo site
#  _             _  _       _                                                                                                          _  _
# | |           (_)| |     | |                                               _                                                        | |(_)
# | |__   _   _  _ | |   __| |   _ _ _  _ _ _  _ _ _  _____  ____   _____  _| |_  _____   ____  _____  _   _  _____  ____   _____   __| | _  _____
# |  _ \ | | | || || |  / _  |  | | | || | | || | | |(_____)|    \ | ___ |(_   _)(____ | / ___)| ___ |( \ / )(_____)|    \ | ___ | / _  || |(____ |
# | |_) )| |_| || || | ( (_| |  | | | || | | || | | |       | | | || ____|  | |_ / ___ || |    | ____| ) X (        | | | || ____|( (_| || |/ ___ |
# |____/ |____/ |_| \_) \____|   \___/  \___/  \___/        |_|_|_||_____)   \__)\_____||_|    |_____)(_/ \_)       |_|_|_||_____) \____||_|\_____|
source <(clog Inc)
[ -f clogrc/check.sh   ] && source clogrc/check.sh  "ignore-errors"

buildErrs=0
DST=public

CMD="rm -fr $DST/*"
fInfo "purging old builds:  $ $cC$CMD$cX"
$CMD
[ $? -gt 0 ] && ((buildErrs++)) && fError "purging faild - continuiing anyway"

TAG=$(git describe)
if [ -z "$TAG" ] ; then
  fWarning "No recent tag found using tag$cE dev"
  TAG=dev
fi
NAME="www-metarex-media"
IMAGE="mrmxf/$NAME"
GREP_SEARCH="mrx"
OPTS="-q --force-rm"
DoPUSH="$1"

fInfo "building the static website to $cF$DST/: $cC hugo$cX"
hugo --gc --quiet --minify
[ $? -gt 0 ] && ((buildErrs++)) && fError "hugo build failed ($err)" && exit 1

fOk   "building the static website to $cF$DST/$cs Success$cX"
fInfo "executing$cC docker build$cT with opts: $cW$OPTS\n$cX"
AMDtarget="$IMAGE-amd:$TAG"; dAMDtarget="$cW$IMAGE$cT-amd:$cE$TAG$cX"
ARMtarget="$IMAGE-arm:$TAG"; dARMtarget="$cW$IMAGE$cT-arm:$cE$TAG$cX"

fInfo "Build image $dAMDtarget"
docker build $OPTS -t "$AMDtarget" --platform linux/amd64 .
[ $? -gt 0 ] && ((buildErrs++))

fInfo "Build image $dARMtarget"
docker build $OPTS -t "$ARMtarget" --platform linux/arm64 .
[ $? -gt 0 ] && ((buildErrs++))

fInfo "Inspecting Intel:"
docker buildx imagetools inspect "$AMDtarget"  | grep -E "Digest|Platform" | head -2
fInfo "Inspecting Arm:"
docker buildx imagetools inspect "$ARMtarget"  | grep -E "Digest|Platform" | head -2

BuildImageFound="$(docker images | grep "$GREP_SEARCH")"
[[ $buildErrs > 0 ]] || [ -z BuildImageFound ]  && \
   fError "Build failed or $cE $GREP_SEARCH$cT docker images not found locally\n" \
   fError"Aborting....\n" \
   exit 1

if [ -n "$DoPush" ] ; then
  fInfo "push:    docker push $dARMtarget"
  docker push "$ARMtarget"
  fInfo "push:    docker push $dAMDtarget"
  docker push "$AMDtarget"
fi

fInfo "1. start:   docker run --detach --rm --publish 11999:80 --name$cI $NAME $dAMDtarget$cX"
fInfo "     or:    docker run --detach --rm --publish 11999:80 --name$cI $NAME $dARMtarget$cX"
fInfo "2. stop:    docker stop$cW $NAME$cX"
[ -z "$DoPUSH" ] && fInfo "3. push:    docker push $dAMDtarget"
[ -z "$DoPUSH" ] && fInfo "4. push:    docker push $dARMtarget"
