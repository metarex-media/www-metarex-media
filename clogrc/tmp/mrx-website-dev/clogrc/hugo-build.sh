# usage> build
# short> build the hugo site
# long>  build the hugo site
#   _             _   _      _     _
#  | |__   _  _  (_) | |  __| |   | |_    _  _   __ _   ___
#  | '_ \ | || | | | | | / _` |   | ' \  | || | / _` | / _ \
#  |_.__/  \_,_| |_| |_| \__,_|   |_||_|  \_,_| \__, | \___/
#                                               |___/
source clogrc/core/inc.sh

CMD="rm -fr public/*"
fInfo "purging old builds:  $ $cC$CMD$cX"
$CMD

TAG=$(git describe)
if [ -z "$TAG" ] ; then
  fWarning "No recent tag found using tag$cE dev"
  TAG=dev
fi
CONTAINER="mrmxf/mrx-static"
GREP_SEARCH="mrx"

fInfo "$cC hugo"
hugo
echo "hugo returned $?"
[[ $? > 0 ]] && fError "hugo build failed" && exit 1

fInfo "$cC docker build $cF$CONTAINER:$cE$TAG$cX"
docker build -t "$CONTAINER:$TAG" .

[[ $? > 0 ]] && docker images | grep "$GREP_SEARCH" &&\
   fError "Build failed -$cE only$cT the images above exist"\
   exit 1

fInfo "Test: docker run -d -p 11999:80 $cF$CONTAINER:$cE$TAG$cX"
fInfo "Next: docker push $cF$CONTAINER:$cE$TAG$cX"
