---
title:       Project
linkTitle:   Project
date:        2025-02-19
weight:      10
type:       docs
description:  What is the {{% metarex %}} project? Where did it come from?  What will it deliver?
menu:
  main:
    identifier: project
    weight: 100
tags:      []  
oldtags:   ["docs", "project"]
---
<!-- markdownlint-disable MD033-->

{{< fo t = "banner"
    header = "MetaRex"
    text = "is like a zip file with a timeline. It's used like an electronic FedEx service."
    src = "/img/dino/mrx-logo-0300.png"
    class = "ui olive message"
/>}}

**IBC Accelerator 2023** [Responsive Narrative Factory](/project/archive/ibc2023/).

## Rationale

It's super easy to send anything by FedEx - even a baby dinosaur! You just put your stuff in a box and they slap two labels on it.

1. The Destination - send to {{% metarex %}} HQ
2. The Manifest - a bar code that points to a database. The record in the database says **_Baby Dinosaur - do not drop_**

Magic happens and the box travels over train networks, air networks, couriers, bicycles and just gets to where you want it.

**So why is it so hard to send media metadata?**

That's the problem that {{% metarex %}} solves

1. Map the `mrx` container into networks so that destination addresses work.
2. Define a database (register) of manifests so that you know what's in the
   `mrx` container.

An added bonus is that the `mrx` register can publish cloud endpoints to manage the metadata - this can lead to **no code integrations**. That should be nice!

## So what is it?

A project to create a body of free to use Open Source software that allows media metadata to be created, transmitted and stored over common links and file
systems.

## Why do I want it?

Because today, every Virtual Set and engineering heavy production is a custom build. Every QC report is unlinked to the master content and version workflows lose metadata when content is processed by third parties.

* **What is it good for?** Carrying binary, text, isochronous and event driven metadata. Identifying the metadata via a registry and providing links to  applications and schemas that can shed light on how to process that metadata. By harmonising the identification and transport of the metadata, an infrastructure can be built to keep the stuff that we currently lose.

* **What is it not good for?** We will not harmonize schemas for tripod data, lens data, QC data or any other sort of metadata carried. That's outside the scope. MetaRex will carry any metadata through the value chain to where it's needed. MetaRex will identify that metadata and allow applications to enlighten the metadata or move it based on business rules.

* **What is it *not yet* good for?**: At the end of 2022 MetaRex is just a paper specification, some pictures and a prototype register. At the end of 2023 we should have code for different computer languages and a framework for common tools and apps. By the end of 2024 we should have end to end workflows with common tools and a body of free software that reduces the barrier to transporting and preserving media chain metadata.

<a id="history"></a>

## History

Throughout 2022, at [NAB], [IBC] and the [DPP] Leader's Briefing, the MetaRex team did a lot of talking to  content creators, facility owners, software vendors and many others about what were the blockers that stopped metadata being a first class citizen. The biggest issue was "_the metadata gets lost_".

{{< fo t = "block"
    alt =      "mxf-live demo at ARRI"
    position = "left"
    size =     "small"
    imageUrl = "/blog/2019/07/20/mxf-live-at-arri-international-broadcast-day-2019/international-broadcast-day-2019-demo.jpg"
    linkUrl =  "/blog/2019/07/20/mxf-live-at-arri-international-broadcast-day-2019/"
>}}

MetaRex was shown to work back in 1998, when the original MXF team demonstrated file workflows with [metadata preservation][01] at the BBC in a project called [G-FORS][02] (see page 219 of linked PDF). The demo was brought up to date with live networking and VFX and shown at the [ARRI Broadcast Day][03] in 2019, but in 2022 there still wasn't a similar solution available on the market. Games companies complained that every new virtual set was a custom engineering job, just to get the metadata to the right place at the right time.

[01]: https://www.govinfo.gov/content/pkg/GOVPUB-C13-de2599f27af453fcf0f525f99cebe66c/pdf/GOVPUB-C13-de2599f27af453fcf0f525f99cebe66c.pdf
[02]: https://www.tvtechnology.com/news/mxf-gets-ready-for-nab-are-you-ready-for-it-242793
[03]: {{% relref "/blog/ARRI-Open-Day/index.md" %}}

{{</fo>}}

{{< metarex >}} has successfully completed its first phase and has created a pool of software available on {{% github %}}.

[DPP]:         /blog/2022/11/16/2022-11-16-dpp-leaders-briefing/
[IBC]:         /blog/2022/09/18/ibc-show-2022/
[NAB]:         /blog/2022/04/23/metarex-at-nab-2022-in-las-vegas/
[status]:      /project/status/