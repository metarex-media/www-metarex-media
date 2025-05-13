// Copyright ©2022-2025 Mr MXF   info@mrmxf.com
// BSD-3-Clause License   https://opensource.org/license/bsd-3-clause/

package main

// package main is a simple static web server that serves a hugo site.
//

import (
	"fmt"
	"log/slog"
	"net/http"

	"github.com/mrmxf/clog/gommi"
	"github.com/mrmxf/clog/slogger"
)

var Port = 8080

func main() {
	r, _ := gommi.Bare()
	r.NewFileServer(urlPrefix, mountPath)

	listenAddr := fmt.Sprintf("%s:%d", "", Port)
	slog.Info(fmt.Sprintf("Listening on port %d", Port))

	// run the server in a thread
	http.ListenAndServe(listenAddr, r)
}

func init() {
	slogger.UsePrettyLogger(slog.LevelError)
}
