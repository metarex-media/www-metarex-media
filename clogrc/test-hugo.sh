# usage> test
# short> run the docker image of the site
# long>  run the docker image of the site
#                                            _           _   _
#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|

source clogrc/core/inc.sh

$PORT=12020
fin
docker run -d -p 12020:80 html-server-image:v1