module github.com/metarex-media/www-metarex-media

go 1.24.3

//replace github.com/mrmxf/clog => ../../pub-mrmxf/clog

require (
	github.com/mrmxf/clog v0.7.8
	github.com/mrmxf/fohuw v0.5.2 // indirect
)

require (
	github.com/go-chi/chi/v5 v5.2.1 // indirect
	github.com/samber/slog-chi v1.15.0 // indirect
	go.opentelemetry.io/otel v1.29.0 // indirect
	go.opentelemetry.io/otel/trace v1.29.0 // indirect
)
