#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|
source clogrc/core/inc.sh
source clogrc/core/installers.sh

## this script is included to test if the install process has taken place

#install hugo if needed
fInfo "checking$cC hugo$cT installaion"
fInstall "hugo"

# check that the postcss is all installed
fInfo "checking$cC postcss$cT installaion"
$(cd themes/fohuw && yarn)

#check tht the top level postcss is installed
fInfo "checking$cC javascript build$cT installaion"
yarn
CMD="hugo server --buildDrafts --environment staging"

hugo server --buildDrafts --environment staging