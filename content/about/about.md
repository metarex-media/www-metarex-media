---
title:       About Us
date:        2025-07-18
linkTitle:   About Us
type:        docs

menu:
  main:
    name:    About Us
    parent:  Learn
    weight:  05

# Use the block/cover shortcode to have a picture landing page
---

<!--  ---------------------------------------------------------------------  -->

{{< hw t = "banner"
    header = "MetaRex"
    text = "is like a zip file with a timeline. It's used like an electronic FedEx service."
    src = "/img/dino/mrx-logo-0300.png"
    class = "ui olive message"
/>}}

----------

{{< metarex >}} is dedicated to developing an open-source framework for the transport of media metadata.  This framework will allow you to preserve, transport, identify, and use metadata from many sources in a single workflow. This will make it easier to preserve production and post-production metadata than it is to lose it or leave it behind.

### How does MetaRex work?

It’s super easy to send anything by FedEx - even a baby dinosaur! 🦖 
You just put your stuff in a box (or letter) and they slap two labels on it with a barcode, then send it off. 

With {{< metarex >}} it is very similar process, except no physical box or letter!   {{< metarex >}} is like Fedex for metadata.

1. **The Destination** - send to MetaRex HQ 
2. **The Manifest** - a barcode that points to a database.  Magic happens and the box travels over train networks, air networks, couriers, bicycles and just gets to where you want it to. 

-----

<div class="ui center aligned header">{{< metarex >}} Flow Diagram</div>

{{< hw t = "image-fluid"  
    src = "/img/mrx-flow.png" 
    srcClass = "ui centered large image"
    name = "The MetaRex Flow Diagram 2024" 
    id = "showCaption" 
    alt = "metarex flow diagram"
/>}}

* **Sender**
  * The Sender wraps their metadata in a standardized container.
  * A label is applied to identify the contents
  * The mapper puts the container on a transport: NDI, ST 2110, email, FTP etc.
* **Receiver**
  * The receiver takes the containers from the transport
  * The unwrapper reads the label to handle the data as clocked / unclocked,
    text / binary
  * The unwrapper extracts the metadata and may use a web service to do something automatic with the data e.g. make an overlay / transcode to the receiver's preferred format.
  * The end user now has access to, potentially, several variants of the metadata before they write their first line of code.


-----

Visit our [FAQ's][FAQ] page for more information. 

[Collaboration]:   /project/collaboration/index.md
[FAQ]:  /faq/index.md
<!-----------------------------------------------------------------------  -->
