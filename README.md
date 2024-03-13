# www-metarex-media website - built with Hugo

![Dynamic YAML Badge](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmetarex-media%2Fwww-metarex-media%2Fmain%2Fdata%2Fhistory.yaml&query=%24.history%5B0%5D.version&logo=github&label=mrx-main&labelColor=4F702A)

The [metarex.media] website built with [Hugo] and the [fohuw] theme. The end
result is a static website that can sit on an S3 bucket, USB stick or similar
and runs just fine without a database or high power server.

The website is public domain so that you can add issues if you find errors in
the content or want to go back in time and find out what we changed. Some
downloads are hosted only on the website as they are too big for GitHub.

Other elements of the website, such as the metarex register can be found on
[GitHub](https://github.com/metarex-media/?repositories)

## Forking, cloning & editing

Once you've (cloned or forked & cloned) the repo, you need to install both
[golang] and [hugo] in your development environment. My preference was to use
[gitpod] which runs VS Code in your browser (on a phone on a train) as the dev
environment to ensure I could update the site from anywhere, anytime on any
device 😃.

[Docsy]:             https://github.com/google/docsy
[fomantic ui]:       https://fomantic-ui.com/
[gitpod]:            https://www.gitpod.io/
[golang]:            https://go.dev/doc/install
[Hugo]:              https://gohugo.io/installation/
[Hugo theme module]: https://gohugo.io/hugo-modules/use-modules/#use-a-module-for-a-theme
[metarex.media]:     https://metarex.media
[fohuw]:             https://github.com/mrmxf/fohuw

## deploying to a web server

Checking into GiHub or GitLab on the `main` or `rc` branches will initiate and
automatic build. The destinations are part of the non-public element of the
deployment. You'll need to create the GITHUB or GITLAB variable `MRX_DOCKER_NS`
to deploy to your own Docker or website.

### testing the docker image locally

Build the docker file and push it to your favorite image registry. On the host
use this style of execution:

```sh
# pull the docker image

# run the docker image for a proxy forwarder on port 10000
docker run -d -p 10000:80 www-metarex-media

# check it's working by seeing the homepage html
curl localhost:10000

# check it's working by launching a browser
start "http://localhost:10000"
```
