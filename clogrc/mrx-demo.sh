# usage> demo
# short> www-metarex-media demos
# long>  start the components

mrxAppSvr="mmtristan/mrx-elt-demo-amd"         ; appSvrName="mrx-app-svr" ;appSvrPorts=8080:8080
mrxRegSvr="metarexmedia/mrx-reg-svr-amd"       ; regSvrName="mrx-reg-svr" ;regSvrPorts=12013:8070
mrxRegUx="metarexmedia/mrx-reg-ux-amd"         ; uxSvrName="mrx-ux-svr"  ;uxSvrPorts=12014:80
mrxWebSvr="metarexmedia/www-metarex-media-amd" ; webSvrName="mrx-web-svr" ;webSvrPorts=8888:80
[ -n "$(uname -m | grep arm)" ] && mrxAppSvr="mmtristan/mrx-elt-demo-arm"

unset appSvrRunning; [ -z "$(docker container ls | grep mrx-svr)" ] && appSvrRunning=running
unset regSvrRunning; [ -z "$(docker container ls | grep mrx-svr)" ] && regSvrRunning=running
unset mrxNetExists;  [ -z "$(docker network ls | grep mrx-net)" ] && mrxNetExists=alive



if [[ "$1" == "preview" ]]; then
  # run the demo as an online preview using only docker containers

  # start the app server and connect it to mrx-net
  docker run --rm --detach --network mrx-net --name mrx-svr $mrxAppSvr
else
  # run the demo as a hugo local preview with app-server docker containers

  if [ -z "$(docker container ls | grep $appSvrName)" ]; then
    docker run --rm --detach --publish $appSvrPorts --name $appSvrName $mrxAppSvr
  else
    echo "Docker $appSvrName is running"
  fi

  if [ -z "$(docker container ls | grep $regSvrName)" ]; then
    docker run --rm --detach --publish $regSvrPorts --name $regSvrName $mrxRegSvr
  else
    echo "Docker $regSvrName is running"
  fi

  if [ -z "$(docker container ls | grep $uxSvrName)" ]; then
    docker run --rm --detach --publish $uxSvrPorts --name $uxSvrName $mrxRegUx
  else
    echo "Docker $uxSvrName is running"
  fi

  PORT=1313

  hugo server -p $PORT --watch \
            --buildDrafts --buildExpired --buildFuture  --noHTTPCache \
            --disableFastRender --forceSyncStatic --enableGitInfo
fi