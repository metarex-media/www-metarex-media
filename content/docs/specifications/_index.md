---
title:       Specifications
linkTitle:   Specifications
date:        2025-02-19
weight:      30
description: How does MetaRex work under the hood?
---

{{< fo t = "banner"
    header = "Technical Specifications"
    description = "MetaRex is like a zip file envelope with a timeline... like an electronic FedEx service."
    src = "/img/dino/mrx-logo-0300.png"
    class = "ui center aligned olive message"
/>}}

### The {{< metarex >}} Envelope

Start by reading the [MRX envelope introduction][01] that leads you through the
container design choices amongst the many containers available. From that
point, you can read the detailed spec of the [MRX container][02] in its
work-in-progress status. There may be further detailed discussions in the
metarex [GitHub][03] repository's [issues][03] section.

There's also the easy-access [White Paper blog from 2024][04].

### The {{< metarex >}} Register

The register converts a `metarexId` e.g. [MRX.123.456.789.reg][id] into a set
of links where you can find information and services related to that metadata
type.

The specification for the JSON that is returned from a [register query][12]
has the `metarexId` [MRX.123.456.789.reg][id]. You can use the [web app][10]
to browse the register or to add your own content (registration required) or
you can inspect the register using the API [here][11].


### The {{< metarex >}} Register API

The register API is generated from an [OpenAPI 3.0 document][d1] that can be
[viewed as an online document][d2].

[01]: {{% relref "/docs/specifications/introduction.md" %}}
[02]: {{% relref "/docs/specifications/mrx-container-spec.md" %}}
[03]: https://github.com/metarex-media/mrx-container/issues
[04]: {{% relref "/blog/white-paper-blog/" %}}

[10]: {{% relref "/app/reg/" %}}
[11]: {{% relref "/" %}}reg/
[12]: https://metarex.media/app/reg/search
[id]: https://metarex.media/app/reg/search?qry=reg&mrxId=MRX.123.456.789.reg

[d1]: {{% relref "./mrx-reg-oapi.yaml.md" %}}
[d2]: {{% relref "./mrx-reg-openapi.md" %}}
