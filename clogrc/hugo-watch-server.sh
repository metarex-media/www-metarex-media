# usage> watch
# short> start the hugo server
#  long> start the hugo server
#                          __ ___       __   __              __  __
# |  | |  | |  |  __ |\/| |_   |   /\  |__) |_  \_/    |\/| |_  |  \ |  /\
# |/\| |/\| |/\|     |  | |__  |  /--\ | \  |__ / \ .  |  | |__ |__/ | /--\
#
source <(clog Inc)


PORT=1313
fInfo "launching browser"
cmd.exe /C start "http://localhost:$PORT"

fInfo "running$cC hugo$cT server"

# start server with most reliable (but slow) options
# other options
#            --templateMetrics --templateMetricsHints
hugo server -p $PORT --watch \
           --buildDrafts --buildExpired --buildFuture  --noHTTPCache \
           --disableFastRender --forceSyncStatic --enableGitInfo
