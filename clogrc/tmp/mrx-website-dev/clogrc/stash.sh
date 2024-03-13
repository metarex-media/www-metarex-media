# usage> Stash
# short> stash clogc to a gist
# long>  stash clogc to a gist
#                                            _           _   _
#   _ __    _ _  __ __  ___  __ __ __  ___  | |__   ___ (_) | |_   ___
#  | '  \  | '_| \ \ / |___| \ V  V / / -_) | '_ \ (_-< | | |  _| / -_)
#  |_|_|_| |_|   /_\_\        \_/\_/  \___| |_.__/ /__/ |_|  \__| \___|
source clogrc/core/inc.sh

if [ -z "$GHGIST" ] ; then
   echo "env GHGIST is unset - this should be the GitHub token alowing you to push"
fi

# from the gist:
   CLOG_STASH_ID=bd8f06a4862338ddca94856ada194348
           GHUSR=mrmxf
CLOG_STASH_REPO=$CLOG_USER/$CLOG_STASH_ID.git
        PROJECT=$(basename $(pwd))
    PROJECT_ZIP="$PROJECT.zip"

# ensure tmp exists and that the stash tmp folder does not
mkdir -p clogrc/tmp
rm -rf clogrc/tmp/$CLOG_STASH_ID
rm -rf clogrc/tmp/$PROJECT
rm -rf clogrc/tmp/$PROJECT_ZIP

zip --recurse-patterns --paths clogrc/tmp/$PROJECT_ZIP  clogrc/*

cd clogrc/tmp
URL="https://$GHUSR:$GHGIST@gist.github.com/$CLOG_STASH_ID.git"
git clone $URL

cd $CLOG_STASH_ID

cp ../$PROJECT_ZIP .

git add $PROJECT_ZIP

git commit -m "Stashing clogrc"
#add authentication to remote
git remote set-url origin https://$GHUSR:$GHGIST@gist.github.com/$CLOG_STASH_ID.git
git push origin main
cd ..
fInfo Added $cF$PROJECT_ZIP$cT to stash Gist
# don't add a * to the rm line otherwise hidden folders will persist
#rm -rf $CLOG_STASH_ID/