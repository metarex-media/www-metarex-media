# www-metarex-media static website - built with Hugo
<!-- CLOG-BADGE-START -->
![Dynamic YAML Badge](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmetarex-media%2Fwww-metarex-media%2Fmain%2Fdata%2Freleases.yaml&query=%24.releases%5B0%5D.version&logo=github&label=www-metarex-media&labelColor=4F702A)
![GitHub Build](https://img.shields.io/github/actions/workflow/status/mrmxf/mm-www-metarex-media/hugo-build-container?branch=main&labelColor=4F702A)
<!-- CLOG-BADGE-END -->
The [metarex.media] website built with [Hugo] and the [fohuw] theme. The end
result is a static website that can sit on an S3 bucket, USB stick or similar
and runs just fine without a database or high power server.

The website is public domain so that you can add issues if you find errors in
the content or want to go back in time and find out what we changed. Some
downloads are hosted only on the website as they are too big for GitHub.

## Components of the full website

There are other elements of the website that make it work. Here are the high
level components, most of which can be found on
[GitHub](https://github.com/metarex-media/?repositories):

|  url       | repo                    | docker  | purpose                                     |
|------------|-------------------------|---------|---------------------------------------------|
| /          | [www-metarex-media][ww] |   -     | main website (this repo)                    |
| /app/demos | [spa-mrx-demos][de]     |   -     | svelte web app to drive demos (GitHub)      |
| /app/reg   | [spa-mrx-reg-ux][rg]    |   -     | svelte web app to browse register  (GitHub) |
| /downloads | _bulky storage_         |   -     | externally hosted download store            |
| /r         | _bulky storage_         |   -     | externally hosted media store               |
| /reg       | [mrx-reg-svr][rs]       |   -     | register service (GitHub)                   |
| /svc/demos | [mrx-svc-demos][ds]     |   -     | demo service (GitHub)                       |

## Forking, cloning & editing

Once you've (cloned or forked & cloned) the repo, you need to install both the
latest [golang] and the latest [hugo] in your development environment. My
preference was to use [gitpod] which runs VS Code in your browser (on a phone
on a train) as the dev environment to ensure I could update the site from
anywhere, anytime on any device 😃.

```sh
# pull the hugo theme and other dependencies
hugo mod get
# run the dev server and view http://localhost:1313
hugo server
# production build the site in /public
hugo --gc --minify --baseURL "http://my-metarex.local/"
```

[gitpod]:            https://www.gitpod.io/
[golang]:            https://go.dev/doc/install
[Hugo]:              https://gohugo.io/installation/
[metarex.media]:     https://metarex.media
[fohuw]:             https://github.com/mrmxf/fohuw
[ww]:                https://github.com/metarex-media/www-metarex-media
[de]:                https://github.com/metarex-media/spa-mrx-demos
[ds]:                https://gitlab.com/mm-eng/mrx-elt-first-demo
[rg]:                https://github.com/metarex-media/spa-mrx-reg-ux
[rs]:                https://gitlab.com/mm-eng/glmrx-svr-dev

## deploying

The site is fully static so once built, the resulting docker container can
be served by any reverse proxy such as nginx or traefik. The build scripts for
GitHub and GitLab are published in the repo, but the keys are not (obviously).

### testing the docker image locally - static site only

Build the docker file and push it to your favorite image registry. On the host
use this style of execution:

```sh
# pull the docker image

# run the docker image for a proxy forwarder on port 10000
docker run --detach --publish 10000:80 metarex,edia/www-metarex-media

# check it's working by seeing the homepage html
curl localhost:10000

# check it's working by launching a browser
start "http://localhost:10000"
```
