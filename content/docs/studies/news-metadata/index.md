---
title:       News Metadata
linkTitle:   News Metadata
date:        2025-05-15
description: How to manage your news metadata software stack in a dynamic world
---
<!-- markdownlint-disable MD033 -->

Many media workflows are becoming dependent on accurate metadata. That often requires up-front integration effort and 
on-going maintenance as the metadata evolves to meet fast changing business needs.

{{<metarex>}} is a framework to allow metadata to flow between creators and consumers of metadata, especially
in networks where non-AV transport can be problematic.

{{< fo t = "media" src = "mrx-news.svg" srcClass = "ui centered image" header = "figure 1" text = "mrx-news example" />}}

The figure 1, above, shows a simple example of what {{<metarex>}} can achieve. The yellow boxes show the `mrx-worker`
that is a platform & operating system agnostic piece of code that you can download from the [metarex GitHub][gh] site.

The intention of the `mrx-worker` is to provide most of the tedious functionality required to get at & validate the core metadata types in a workflow. In each application there are likely to be a few  lightweight functions needed to adapt
the core services to specific requirements.

The diagram shows a simple example of a demonstration done in 2024 where an LPX feed (live production exchange) was
being queried by a workflow controller.  The `mrx-worker` acted as a proxy for the query and it took the response and
was able to translate it and provide alternative transforms of the data to other workflow controllers in the demo.

{{<metarex>}} is agnostic to the nature of the metadata. It relies on identifying the metadata to be processed, 
discovering the services provided for that metadata and then publishing or acting as a proxy for those services
to downstream devices.

Using {{<metarex>}} to abstract the services allows a common interface for the cleaning, validation and fire-walling of
data that might be toxic to a workflow.
<br><br><br><br><br><br><br>

{{< fo t = "media" src = "mrx-worker.svg" srcClass = "ui centered image" header = "figure 2" text = "mrx-worker" />}}

The core features of the `mrx-worker` are shown in the diagram above. Inside the `mrx-worker` is a register of known
metadata types. The `mrx-worker` can synchronize the internal register with parent nodes and child nodes so that a
device / team / facility / corporation / global hierarchy of metadata types can be shared and exchanged.

Caching services code locally can reduce costs and latency. Synchronizing the register with parent devices can ensure
a global source of truth for dynamic metadata types - especially those that are invented in the morning and used in
productions in the afternoon.

Encryption, Authentication and Authorization features can be put into the worker on request.

{{<metarex>}} wants to partner with organisations thant see the value in the secure flow of metadata.

Contact information at [metarex.media][mrx]

[gh]: "https://github.com/orgs/metarex-media/"
[mrx]: https://metarex.media

