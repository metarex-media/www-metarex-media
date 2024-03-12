# usage> stage
# short> execute stage.sh to build & upload {{REPO}} to staging
# long>  execute stage.sh to build & upload {{REPO}} to staging. No other option needed. Edit script to configure upload.
#                                            _           _   _
#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|
CLOGRC=clogrc
source clogrc/core/inc.sh
PROJECT=mrx-website-dev
fInfo "Project(${cS}$PROJECT${cT})$cF: $cC$(basename $0)"
# ------------------------------------------------------------------------------

 CACHE="s3://mmh-cache"
   BOT=$MM_BOT
BRANCH="staging"
  REPO=mrx-website-dev

SRC="stage hugo website"

OPT="--include \"*\" "
ACTION=Upload

# do preflight checks & abort if user does not want to continue
source $CLOGRC/core/s3sync.sh
fValidate
# ------------------------------------------------------------------------------

#define the folders to sync(upload) - one per line
SYNCS=(
#  hugo
   "$OPT public/   $CACHE/$BOT/$BRANCH/$REPO/"
)

# do sync
fSync

# do anything remedial like single file copies here....
# aws s3 cp                           ./clog         s3://mmh-cache/bot-bdh/staging/get/clog
# aws s3 sync  --include="*" --delete ./clogrc/core  s3://mmh-cache/bot-bdh/staging/clog/clogrc/core
