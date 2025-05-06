---
title:         Flow Diagram
linkTitle:     Flow Diagram
date:         2024-02-29
description:  How Metarex flows metadata
type:        docs

params:
  src: img/mrx-flow.png
---

{{< fo t = "block" 
    id = "gg" 
/>}}

<div class="ui center aligned header">{{% metarex %}} Flow Diagram</div>

{{< fo t = "image-fluid"  
    src = "/" 
    name = "The MetaRex Flow Diagram 2024" 
    id = "showCaption" 
>}}

{{% metarex %}} is like Fedex for metadata.

* **Sender**
  * The Sender wraps their metadata in a standardized container.
  * A label is applied to identify the contents
  * The mapper puts the container on a transport: NDI, ST 2110, email, FTP etc.
* **Receiver**
  * The receiver takes the containers from the transport
  * The unwrapper reads the label to handle the data as clocked / unclocked,
    text / binary
  * The unwrapper extracts the metadata and may use a web service to do something
    automatic with the data e.g. make an overlay / transcode to the receiver's
    preferred format.
  * The end user now has access to, potentially, several variants of the metadata
    before they write their first line of code.

{{< /fo >}}