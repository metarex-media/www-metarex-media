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

CMD="rm -fr public/*"
fInfo "purging old builds:  $ $cC$CMD$cX"
$CMD

TAG=$(git describe)
if [ -z "$TAG" ] ; then
  fWarning "No recent tag found using tag$cE dev"
  TAG=dev
fi
CONTAINER="mrmxf/mrx-website"
GREP_SEARCH="mrx"

fInfo "$cC hugo"
hugo --gc --minify
err=$?
[ $err -gt 0 ] && fError "hugo build failed ($err)" && exit 1

fInfo "$cC docker build $cF$CONTAINER:$cE$TAG$cX"
docker build -t "$CONTAINER:$TAG" .

[[ $? > 0 ]] && docker images | grep "$GREP_SEARCH" &&\
   fError "Build failed -$cE only$cT the images above exist"\
   exit 1

fInfo "1. docker run --detach --rm --publish 11999:80 --name $cW mrx-clog $cF$CONTAINER:$cE$TAG$cX"
fInfo "1. docker stop$cW mrx-clog$cX"
fInfo "3. [optional] docker push $cF$CONTAINER:$cE$TAG$cX"
