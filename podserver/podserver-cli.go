// Copyright ©2022-2025 Mr MXF   info@mrmxf.com
// BSD-3-Clause License   https://opensource.org/license/bsd-3-clause/

package main

import "flag"

// package main is a simple static web server that serves a hugo site.
//

var mountPath string
var urlPrefix string

func init() {
	flag.StringVar(&mountPath, "path", "/var/www", "a path to mount the root file system, default=\"/var/www\" (empty string==embedFS)")
	flag.StringVar(&urlPrefix, "prefix", "", "a url prefix for the file server, default=\"/\"")
	flag.Parse()
}
