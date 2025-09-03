---
title:       Docs
linkTitle:   Docs
date:        2025-02-03
weight:      30
type:        docs
description: Learn about metarex?
---
<!-- markdownlint-disable MD033 MD034 -->
<!--  __                _
    / _|  ___   __ _  | |_   _  _   _ _   ___   ___
   |  _| / -_) / _` | |  _| | || | | '_| / -_) (_-<
   |_|   \___| \__,_|  \__|  \_,_| |_|   \___| /__/
-->
{{< hw t = "banner"
    header = "Docs"
    description = "MetaRex is like a zip file with a timeline. It's used like an electronic FedEx service."
    src =   "/img/dino/mrx-logo-0300.png"
    class = "ui center aligned olive message"
/>}}

{{< hw t = "feature-group" >}}
<!-- ---------------------------------------------------------------------- -->
  {{< hw t = "feature"
    header     = "Rexy clips"
    blockClass = "ui green segment"
    class      = "ui green message"
    src        = "/meeja/mrx2-fire.mp4"
    srcClass   = "ui fluid image"
    link       = "/rexy-area/_index.md"
    alt        = "rexy fire clip"
  />}}
<!-- ---------------------------------------------------------------------- -->
  {{< hw t = "feature"
    header     = "Repositories"
    blockClass = "ui yellow segment"
    class      = "ui yellow message"
    src        = "/ico/logo-github.svg"
    srcClass   = "ui small centered image"
    link       = "https://github.com/mrmxf"
    alt        = "repositories"
  />}}
<!-- ---------------------------------------------------------------------- -->
  {{< hw t = "feature"
    header     = "How does it work?"
    blockClass = "ui red segment"
    class      = "ui red message"
    src        = "/img/mrx-flow.png"
    link       = "/docs"
    alt        = "metarex how does it work dinosaur"
 >}}

  <i class = "book icon"></i> Read the docs.
  <!-- ---------------------------------------------------------------------- -->
{{< /hw>}}
{{< /hw>}}

### MetaRex Documentation

Start by reading the [MRX container introduction][01] that leads you through the
container design choices amongst the many containers available. From that
point, you can read the detailed spec of the [MRX container][02] in its
work-in-progress status. There may be further detailed discussions in the
MetaRex [GitHub][03] repository's [issues][03] section.

There's also the easy-access [White Paper blog from 2024][04].

### The MetaRex Register

The register converts a `metarexId` e.g. [MRX.123.456.789.reg][id] into a set
of links where you can find information and services related to that metadata
type.

The specification for the JSON that is returned from a [register query][12]
has the `metarexId` [MRX.123.456.789.reg][id]. You can use the [web app][rux]
to browse the register or to add your own content (registration required) or
you can inspect the register using the API [here][reg].

[01]: {{% relref "/docs/specifications/introduction/" %}}
[02]: {{% relref "/docs/specifications/mrx-container-spec/" %}}
[03]: https://github.com/metarex-media/mrx-container/issues
[04]: {{% relref "/blog/white-paper-blog" %}}

[rux]:  https://metarex.media/appapp/reg
[reg]:  https://metarex.media/appreg
[12]:   https://metarex.media/app/reg/search
[id]:   https://metarex.media/app/reg/search?qry=reg&mrxId=MRX.123.456.789.reg
