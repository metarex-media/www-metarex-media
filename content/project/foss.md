---
title:       "Free Software"
linkTitle:   "Free Software"
date:         2022-01-01
weight:      300
type:        docs
description: What software can you expect from MetaRex.
tags: 
oldtags:    ["backers"]
---
{{< fo t = "banner"
    header = "Free Open Source Software"
    description = "Our goal is to give away [Free Open-Source Software](https://github.com/metarex-media) to allow easy implementation of the {{% metarex %}} framework."
    src = "/img/dino/mrx-logo-0300.png"
    class = "ui center aligned olive message"
/>}}
Our goal is to give away Free Open Source Software to allow easy implementation
of the {{% metarex %}} framework.

## Framework code

The Framework code is intended for developers and product designers to integrate {{% metarex %}} into a product or system. The code comprises 3 parts:

1. `wrapper` / `unwrapper` - puts metadata items into the _mrx container_
1. `inserter` / `extractor` - maps _mrx containers_ into a transport e.g. NDI or RTP or MXF multiplexer
1. `register` - interacts with the register API
1. `auto-ETL` - automatically <strong><span class="ui red text">E</span></strong>xtract, <strong><span class="ui red text">T</span></strong>ransform & <strong><span class="ui red text">L</span></strong>oad, metadata
1. `samples` - example services to act as templates for your metadata business.

Creating the framework code will be done in the following steps:

1. **Phase 1**
   1. Agree a draft specification
   1. Create some test streams for wrap / unwrap / register testing
   1. Create a [Golang](https://go.dev/) wrap / unwrap / reg implementation
   1. Test metadata transform requirements
2. **Phase 2**
   1. Create test scenarios for the framework & demonstrate at NAB 2024
3. **Phase 3**
   1. Create basic RTP network mapper
   1. Specify network mappers depending on resource availability

## Register code

The register is a simple web service that delivers text or json when requested.
An authenticated user of the system should be able to update records that they
own. A user management system is required to prevent malicious update of
register entries.

The register should also be able to run in a self-proxy mode to allow for
embedded register and private operations.

Our code is available [on GitHub][1] where you can make generic MetaRex [feature requests][w] on the website repo or raise specific issues on the [prototype code][r] and raise  specific issues and any tool such as the [demo][d] repo. All code is subject to change until the end of the project.

[1]: https://github.com/metarex-media
[d]: https://github.com/metarex-media/mrx-demo/issues
[w]: https://github.com/metarex-media/www-metarex-media/issues
[r]: https://github.com/orgs/metarex-media/repositories