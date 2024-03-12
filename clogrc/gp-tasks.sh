# usage> Gitpod [before | init | command]
# short> run the Gitpod scripts
# long>  run the Gitpod initialisation scripts from clog
#                                            _           _   _
#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|
source clogrc/core/inc.sh
source clogrc/core/installers.sh

case $1 in
  "before")   ACTION="before" ;;
  "init")     ACTION="init" ;;
  "command")  ACTION="command" ;;
  *)          echo -e "$cW Warning$cT specify$cC before$cT |$cC init$cT | command. Using default $cC command$cX"
              ACTION="command" ;;
esac

# ------------------------------------------------------------------------------
#   ___   ___   ___    ___    ___   ___
#  | _ ) | __| | __|  / _ \  | _ \ | __|
#  | _ \ | _|  | _|  | (_) | |   / | _|
#  |___/ |___| |_|    \___/  |_|_\ |___|
# ------------------------------------------------------------------------------
if [[ $ACTION == "before" ]] ; then

  echo -e "${cK}gitpod$cC BEFORE$cT tasks"

fi

# ------------------------------------------------------------------------------
#   ___   _  _   ___   _____
#  |_ _| | \| | |_ _| |_   _|
#   | |  | .` |  | |    | |
#  |___| |_|\_| |___|   |_|
# ------------------------------------------------------------------------------

if [[ $ACTION == "init" ]] ; then

  echo -e "${cK}gitpod$cC INIT$cT tasks"
  fDivider

fi

# ------------------------------------------------------------------------------
#    ___    ___    __  __   __  __     _     _  _   ___
#   / __|  / _ \  |  \/  | |  \/  |   /_\   | \| | |   \
#  | (__  | (_) | | |\/| | | |\/| |  / _ \  | .` | | |) |
#   \___|  \___/  |_|  |_| |_|  |_| /_/ \_\ |_|\_| |___/
# ------------------------------------------------------------------------------

if [[ $ACTION == "command" ]] ; then

  echo -e "${cK}gitpod$cC COMMAND$cT tasks"

  fInstall aws
  fInstall clog
  # fInstall cuttlebelle
  # fInstall ffmpeg
  fInstall hugo
  # fInstall nvm
  # fInstall opentpg
  # fInstall terraform
  # fInstall yarn
  # fInstall zmp

  fDivider
  fInfo "Your public IP address in $cW $(curl --no-progress-meter https://api.ipify.org?format=text)$cX"
  fDivider

  fInfo "Type$cC clog hugo$cT to start the dev server or just$cC clog$cT for prompted help$cX"

fi
