#  clog> PopStash
# short> unstash clogrc from a gist
# extra> unstash clogrc from a gist
#
#  _ |_  _   _ |_     _   _   _
# _) |_ (_| _) | )   |_) (_) |_)
#                    |       |

if [ -z "$GHGIST" ] ; then
   echo "env GHGIST is unset - this should be the GitHub token alowing you to push"
fi

# from the gist:
   CLOG_STASH_ID=bd8f06a4862338ddca94856ada194348
           GHUSR=mrmxf
CLOG_STASH_REPO=$CLOG_USER/$CLOG_STASH_ID.git
    PROJECT_ZIP="mrx-website-dev.zip"
        PROJECT=${PROJECT_ZIP%%.*}
mkdir -p clogrc/tmp

cd clogrc/tmp
# remove the ZIP file if it exists in the folder
rm -f $PROJECT_ZIP
# remove the stash & unzip folder
rm -rf $CLOG_STASH_ID/
rm -fr $PROJECT/

URL="https://$GHUSR:$GHGIST@gist.github.com/$CLOG_STASH_ID.git"
git clone $URL

cd $CLOG_STASH_ID
ls -al
cp $PROJECT_ZIP .. #2>/dev/null
if [ $? -gt 0 ] ; then
   echo "$PROJECT_ZIP has not been stashed (err $?)"
   cd ..
   rm -rf $CLOG_STASH_ID/
   exit
fi

cd ..
rm -rf $CLOG_STASH_ID/
unzip $PROJECT_ZIP -d $PROJECT
rm -f $PROJECT_ZIP

echo "$PROJECT_ZIP restored to clogrc/tmp/$PROJECT/clogrc/"
echo "use file compare to restore files"
