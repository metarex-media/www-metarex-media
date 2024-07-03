---
title:       Specifications
linkTitle:   Specifications
date:        2024-07-03
weight:      30
type:       docs
description: How does metarex.media work under the hood?
---

{{< f/message
    header="Technical Specifications"
    description="Metarex is like a zip file with a timeline. It's used like an electronic FedEx service."
    src="/img/dino/mrx-logo-0300.png"
    class="ui center aligned olive message"
>}}

### The Metarex Container

Start by reading the [MRX container introduction][01] that leads you through the
container design choices amongst the many containers available. From that
point, you can read the detailed spec of the [MRX container][02] in its
work-in-progress status. There may be further detailed discussions in the
metarex [GitHub][03] repository's [issues][03] section.

There's also the easy-access [White Paper blog from 2024][04].

### The Metarex Register

The register converts a `metarexId` e.g. [MRX.123.456.789.reg][id] into a set
of links where you can find information and services related to that metadata
type.

The specification for the JSON that is returned from a [register query][12]
has the `metarexId` [MRX.123.456.789.reg][id]. You can use the [web app][10]
to browse the register or to add your own content (registration required) or
you can inspect the register using the API [here][11].

[01]: /specifications/introduction/
[02]: /specifications/mrx-container-spec/
[03]: https://github.com/metarex-media/mrx-container/issues
[04]: /blog/2024/03/21/2024-03-25-white-paper-blog/

[10]: /app/reg/
[11]: /reg/
[12]: https://metarex.media/app/reg/search
[id]: https://metarex.media/app/reg/search?qry=reg&mrxId=MRX.123.456.789.reg
