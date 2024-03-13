# usage> hugo
# short> start the hugo server
#  long> start the hugo server
#                                            _           _   _
#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|
source clogrc/core/inc.sh

#install hugo if needed
fInstall "hugo"

CMD="hugo server --buildDrafts --environment staging"
fInfo "running$cC$CMD$cX"

hugo server --buildDrafts --environment staging