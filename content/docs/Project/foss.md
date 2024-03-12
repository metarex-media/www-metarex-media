---
title:       "Free Software"
linkTitle:   "Free Software"
weight:      300
description: What software can you expect from Metarex.
categories: ["Backer"]
tags: ["backer"]
---
Our goal is to give away Free Open Source Software to allow easy implementation
of the {{% metarex %}} framework.

## Framework code

The Framework code is intended for developers and product designers to integrate
{{% metarex %}} metarex into a product or system. The code comprises 3 parts:

1. `wrapper` / `unwrapper` - puts metadata items into the mrx container
1. `inserter` / `extractor` - maps mrx containers into a transport e.g. NDI or RTP or MXF multiplexer
1. `register` - interacts with the register API

Creating the framework code will be done in the following steps

1. **Phase 1**
   1. <span class="ui small right pointing red basic label">2023-04</span> Agree the specification
   1. Create some test streams for wrap / unwrap / register testing
   1. Create an [ffmpeg](https://ffmpeg.org/) wrap / unwrap / register implementation
   1. Create Javascript, Golang,  Python & C++ wrap / unwrap / register libraries
1. **Phase 2**
   1. create basic RTP network mapper
   1. create network mappers depending on resource availability
2. **Phase 3** (stretch goal)
   1. Specify requirements for end-user app
   1. Create Android & iOS apps

## Register code

The register is a simple web service that delivers text or json when requested.
An authenticated user of the system should be able to update records that they
own. A user management system is required to prevent malicious update of
register entries.

The register should also be able to run in a self-proxy mode to allow for
embedded register and private operations.

<span class="ui small right pointing red basic label">2023-04</span> A github
repo will be created for the register requirements that will allow backer to
triage and prioritize issues raised.