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
{{< o/features >}}
  {{< o/feature
    divClass = "ui green segment"
    msgClass = "ui green message"
    name     = "Rexy clips"
    src      = "{{% relref /mp4/mrx2-fire.mp4 %}}"
    srcStyle = "max-width: 300px;"
    link     = "/about"
  />}}
<!-- ---------------------------------------------------------------------- -->
  {{< o/feature
    divClass = "ui yellow segment"
    msgClass = "ui yellow message"
    link     = "https://github.com/orgs/metarex-media/repositories"
  >}}
<div class="ui pink message"><i class="tv icon"></i></i> Any resolution, any colour space </div>
<div class="ui red message"><i class="ruler combined icon"></i> 8 | 10 | 12 | float RGBA | YCbCr </div>
<div class="ui orange message"><i class="python icon"></i> Marimo Browser user experience</div>
<div class="ui green message"><i class="blender icon"></i> Rectangular & Blender 3D images</div>
<div class="ui blue message"><i class="laptop code icon"></i> SaaS, Kubernetes, Desktop, Laptop</div>
  {{</o/feature>}}
<!-- ---------------------------------------------------------------------- -->
  {{< o/feature
    divClass = "ui red segment"
    msgClass = "ui red message"
    name     = "How does it work?"
    src      = "/r/img/eg-resize.png"
    link     = "/docs"
  >}}

  <i class="book icon"></i> Read the docs.
  {{</o/feature>}}
{{< /o/features >}}

{{< f/message
    header="Docs"
    description="Metarex is like a zip file with a timeline. It's used like an electronic FedEx service."
    src="/img/dino/mrx-logo-0300.png"
    class="ui center aligned olive message"
>}}

### Metarex Documentation

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
has the `metarexId` [MRX.123.456.789.reg][id]. You can use the [web app][rux]
to browse the register or to add your own content (registration required) or
you can inspect the register using the API [here][reg].

[01]: {{% relref "/docs/specifications/introduction/" %}}
[02]: {{% relref "/docs/specifications/mrx-container-spec/" %}}
[03]: https://github.com/metarex-media/mrx-container/issues
[04]: {{% relref "/blog/2024-03-21-white-paper-blog" %}}

[rux]:  https://metarex.media/appapp/reg
[reg]:  https://metarex.media/appreg
[12]:   https://metarex.media/app/reg/search
[id]:   https://metarex.media/app/reg/search?qry=reg&mrxId=MRX.123.456.789.reg
