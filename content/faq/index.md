---
title:       FAQs
linkTitle:   FAQs
date:        2025-05-31
type:        faq
menu:
  main:
    name:       FAQs
    identifier: faq
    parent:     project
    weight:     09

note-to-bruce: Accordion demo for CG (with items - like history)
tags:        ["faq"]
---
<!-- ####################################################################### -->

{{< fo t = "banner"
    header = "Have a question?"
    text = "MetaRex's FAQ's"
    src = "/img/dino/mrx-logo-0300.png"
    alt = "metarex logo"
    class = "ui olive message"

/>}}

{{< fo t = "block"  id = "block1" >}}

# Project FAQ

* **_What does the name {{% metarex %}} stand for?_**

**Meta**data **R**esource **Ex**press:  the streamlined way to deliver and use metadata!

____________________________________

* **_Why the dinosaur logo?_**

The idea for Rexy was first created between Amber, Simi and Bruce.  The original idea was to represent the media industry and how old-fashioned the ways of working with metadata can be.  
This is represented by the train and dinosaur. 

Also, who doesn’t love a cute, baby dinosaur!

For more information look at our Rexy page. 
____________________________________

* **_Why is {{% metarex %}} needed?_**

There is currently no standard and interoperable way to transport media metadata. Without a transport medium, these are the biggest issues to affect metadata:

It is lost or corrupted during the production process.
Incompatibility with different software applications.
Difficulties in managing and searching metadata. 
____________________________________
* **_How will {{% metarex %}} help imporve metadata management?_**

**Standardisation:**  MetaRex will create a standardised way to transport metadata, ensuring that metadata is always transported in the same way, regardless of the software application used. This will make it easier to manage and search metadata, and it will also reduce the risk of metadata being lost or corrupted.

**Interoperability:**  MetaRex will make metadata interoperable, which means that it will be compatible with different software applications. This will make it easier to share metadata between different systems, and it will also make it easier to access metadata from different sources.

**Extensibility:** MetaRex will be extensible, meaning new metadata formats can be easily added to the framework.  This will ensure that MetaRex can support the latest metadata standards, and it will also make it easier to add new metadata fields to the framework.
____________________________________
* **_Our workflows are already set up and we are reciving the metadata we need.  Why use {{% metarex %}}?_**

Many workflows treat metadata as disposable.  Once it has been used for its immediate use, it can be discarded.  Downstream and when content is archived often very little metadata survives, leading to it having to be regenerated when required at additional cost and time.  MetaRex will help preserve data for future use.

The need for richer data sets is growing, and the performance of AI and automated metadata generation tools is constantly improving.  MetaRex can allow for seamless swapping out of tools without additional integration costs and time.

Who doesn’t love saving some time and money!

{{</fo>}}
{{< fo t = "block"
    id   = "block2"
>}}

# Engineering FAQ

* **_.zip with a timeline?_**

Media metadata almost always needs to be realted to one or more assets (video, audio, data) as well as to the timeline of the media clip, composition or programme.

Zipping up metadata or putting it in a tarball are common concepts, but associating it with frame accurate video, sample accurate audio, or the timebase of the stepper motors of a lens would have to be invented for these common formats.

The MXF standard was designed for the job, has been in production for 20 years and is seen by every consumer on the planet when they go to the cinemas. It seems an obvious candidate, given that putting the zip or the tarbal inside an MXF container is already standardised.
____________________________________
* **_What is the {{% metarex %}} Registry?_**

When FedEx put a barcode on your parcel, they're actually putting a reference to a register that contains metadata about the package.   What's in it?  How heavy is it?  Does it contain a live dinosaur so needs air??

MetaRex uses the same idea.  A magic number - the MetaRex ID - allows software to read specifications, schema and lists of online services to process classes of metadata.

You can view the {{% metarex %}} **Registry [here](https://metarex.media/ui/reg/)**.
____________________________________
* **_Where can I see the MetaRex GitHub?_**

You can view the MetaRex GitHub [here](https://github.com/metarex-media/)

{{</fo>}}
{{< fo t = "block"
    id   = "block3"
>}}

# Extra

* **_I have another question?_**

MetaRex is a small team with no offices.  We have regular meeting online and you can find us remotely in places like on our [LinkedIn](https://www.linkedin.com/company/metarex-media) and [Instagram](https://www.instagram.com/metarex.media?igsh=MWNidHNudDB5MXlwMA%3D%3D) pages. 

Otherwise, you can book a meeting with us if you or your company have any issues with metadata and think MetaRex can help. 

Or fill in our [Contact Form](https://metarex.media/contact/) if you have any questions about {{% metarex %}}.

We would be happy to help! 🦖

{{< /fo >}}

