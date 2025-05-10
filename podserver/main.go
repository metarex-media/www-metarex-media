// Copyright ©2022-2025 Mr MXF   info@mrmxf.com
// BSD-3-Clause License   https://opensource.org/license/bsd-3-clause/

package main

// package main is a simple static web server that serves a hugo site.
//

import (
	"fmt"
	"log/slog"
	"net/http"
	"os"

	"github.com/mrmxf/clog/gommi"
	"github.com/mrmxf/clog/slogger"
)

var Port = 8080

func main() {
	log := gommi.GetLogger()

	r, err := gommi.Bare()
	if err != nil {
		log.Error("cannot initialize static server", "err", err)
		os.Exit(1)
	}

	// use the default logger
	r.Use(middleware.Logger)
	// recover from panics and set return status
	r.Use(middleware.Recoverer)

	//set up routes
	r.Get("/", RouteLanding)

	// simple embedded file server for logs & static images, pages etc.
	embedFileServer(r, embedFs, "/r/", "www")
	listenAddr := fmt.Sprintf("%s:%d", "", Port)
	slog.Info(fmt.Sprintf("Listening on port %d", Port))

	// run the server in a thread
	http.ListenAndServe(listenAddr, r)
}

func init() {
	slogger.UsePrettyLogger()
}
