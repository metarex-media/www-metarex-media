---
title:       Introduction
linkTitle:   Introduction
date:        2024-06-17
type:        docs
description: How does MetaRex work under the hood?
---

{{< fo t = "banner"
    header = "MetaRex Introduction"
    description = "MetaRex is like a zip file envelope with a timeline... like an electronic FedEx service."
    src = "/img/dino/mrx-logo-0300.png"
    class = "ui center aligned olive message"
/>}}

### Core principals

The core technology works like this:

* **Sender**
  * Categorize metadata as { (`binary` or `text`) and (`clocked` or `unclocked`) }
  * Put metadata in an envelope according to category
  * Stamp envelope with a MetaRex ID (`mrxId`) & timing information
  * Publish the `mrxId` in a public register so that anyone can figure out what the metadata is
  * Map the envelope(s) into a network transport for real time distribution
* **Receiver**
  * Unmap network transport into a sequence of MetaRex envelopes
  * Store / preserve / mux / process the envelopes as a file or stream
  * Get `mrxId` registration info [from the register]({{% relref "/app/reg/" %}})
  * Process metadata / download a plugin / display a message based on the
    registration information provided by the owner of the registration record.

### The {{< metarex >}} envelope - MXF

#### Why [MXF](https://www.amazon.co.uk/MXF-Book-Introduction-Material-eXchange/dp/024080693X)

Looking at the tools available for packetizing a collection of abstract metadata
elements, there are a few requirements that were needed:

1. identification hierarchy aware of classes of data and instances of data
2. clock metadata with precise clocks
3. lock metadata timing to existing media clocks e.g. video / audio
4. synchronize metadata with other streams e.g. video / audio / rtp / gps
5. envelope text based metadata
6. envelope unsynced timed data e.g. subtitles / elapsed time / script progress
7. carry any metadata type without transcoding
8. can securely encrypt content with an established Key Management Regime
9. extend the system as it matures

Many candidates were considered including `tar`, `zip`, `quicktime`, `matroska`
yet all of them lacked one or more of the key infrastructure elements to satisfy
the requirements.

**[MXF][01]**is 20 years old, widely deployed, has a sophisticated timing
model, encapsulation model, an ID infrastructure that gives every MXF file in
existence a unique number, an extensible data model, a field-tested encryption
model, and has extension mechanisms including the ability to define in-file
dictionaries for sophisticated parsing. There are also many different
implementations including one in [ffmpeg](httpps://ffmpeg.org).

Basically, MXF already has the tools needed and the other options require
significant work to create a general purpose global solution.

#### The {{< metarex >}} MXF profile

Some features of the [MXF profile] are extensions of the [MXF-live profile] that
was demonstrated in 2019 at the [ARRI Broadcast Day].

The [MXF profile] document is a work in progress - if you want to contribute to
it or have issues with the design approach then please [contact]({{< relref "/contact" >}}) us or join the
project to help us complete the work an give away the software.

Some desires of the final {{< metarex >}} MXF profile:

* it **must** be possible to serialize & stream an `mrx.mxf` over a network
* it **must** be possible to concatenate a stream of `mrx.mfx` envelopes to an
  atomic OP1a MXF file
* every partition of an `mrx.mxf` file **must** only contain one thing (Header,
  Index, Body, GSP, Footer etc.)
* an `mrx.mxf` file **must** contain a minimum amount of descriptive metadata
  (DM-MRX) to enable rich identification via the MetaRex register.
* an `mrx.mxf` file **must** contain a minimum amount of descriptive metadata
  (DM-MRX) to enable an appropriate time stamp for the metadata contained e.g.
  NTP derived time of day in ISO 8601 Timezone format.
* an `mrx.mxf` file **might** contain richer MXF-native metadata.
* an `mrx.mxf` file **might** contain richer timing metadata.
* an `mrx.mxf` file **might** contain richer meta-metadata using KXS ([SMPTE ST
  377-2]).

[01]: https://www.amazon.co.uk/MXF-Book-Introduction-Material-eXchange/dp/024080693X
[ARRI Broadcast Day]: /blog/2019/07/20/mxf-live-at-arri-international-broadcast-day-2019/
[MXF profile]:        /docs/specifications/mrx-envelope-spec/      "Metarex MXF Profile"
[MXF-live profile]:   /docs/specifications/mxf-live-2019/          "MXF Live Profile"
[SMPTE ST 377-2]:     https://doi.org/10.5594/SMPTE.ST377-2.2019   "MXF KXS"
