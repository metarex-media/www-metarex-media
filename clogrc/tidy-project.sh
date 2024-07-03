# usage> tidy
# short> tidy artifacts
# long>  empty the tmp folder, clean the pipeline, stop images etc
#   _     _      _
#  | |_  (_)  __| |  _  _
#  |  _| | | / _` | | || |
#   \__| |_| \__,_|  \_, |
#                    |__/
#
# tidy this project up - uncomment things you want to do or add your own
#
# delete old pipelines on gitlab
glab pipeline delete --older-than 24h
#
# empty the tmp folder
mv tmp/readme.md ./tmp-readme.md && rm -r tmp/* && mv tmp-readme.md tmp/readme.md
