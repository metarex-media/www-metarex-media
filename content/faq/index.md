---
title:       FAQs
linkTitle:   FAQs
date:        2025-05-31
menu:
  main:
    name:      FAQs
    parent:    Contact
    weight:    50

note-to-bruce: Accordion demo for CG (with items - like history)
tags:        ["faq"]
---
<!-- ####################################################################### -->

{{< hw t = "banner"
    header = "Have a question?"
    text = "MetaRex's FAQ's"
    src = "/img/dino/mrx-logo-0300.png"
    alt = "metarex logo"
    class = "ui olive message"
/>}}


<div class="ui basic styled accordion">
    <div class="title">
      <i class="dropdown icon"></i>
      What does the name {{< metarex >}} stand for?
    </div>
    <div class="content">
      <p class="transition hidden">METAdata Resource EXpress:  the streamlined way to deliver and use metadata!</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Why the dinosaur logo?
    </div>
    <div class="content">
       <p class="transition hidden">The idea for Rexy was first created between Amber, Simi and Bruce.  The original idea was to represent the media industry and how old-fashioned the ways of working with metadata can be.  
       This is represented by the train and dinosaur.</p>
       </p>Also, who doesn’t love a cute, baby dinosaur!</p>
       </p>For further detail on the creative side of MetaRex and Rexy, have look at our Rexy's Corner.</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Why is {{< metarex >}} needed?
    </div>
    <div class="content">
      <p class="transition hidden">There is currently no standard and interoperable way to transport media metadata. Without a transport medium, these are the biggest issues to affect metadata:<p>
      <p>It is lost or corrupted during the production process. Incompatibility with different software applications Difficulties in managing and searching metadata.</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      How will {{< metarex >}} help imporve metadata management?
    </div>
    <div class="content">
      <p class="transition hidden">Standardisation:  MetaRex will create a standardised way to transport metadata, ensuring that metadata is always transported in the same way, regardless of the software application used. This will make it easier to manage and search metadata, and it will also reduce the risk of metadata being lost or corrupted.</p>
      </p>Interoperability: MetaRex will make metadata interoperable, which means that it will be compatible with different software applications. This will make it easier to share metadata between different systems, and it will also make it easier to access metadata from different sources.</p>
      </p>Extensibility: MetaRex will be extensible, meaning new metadata formats can be easily added to the framework.  This will ensure that MetaRex can support the latest metadata standards, and it will also make it easier to add new metadata fields to the framework.</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Our workflows are already set up and we are reciving the metadata we need - why use {{< metarex >}}?
    </div>
    <div class="content">
      <p class="transition hidden">Many workflows treat metadata as disposable.  Once it has been used for its immediate use, it can be discarded.  Downstream and when content is archived often very little metadata survives, leading to it having to be regenerated when required at additional cost and time.  MetaRex will help preserve data for future use.</p>
      </p>The need for richer data sets is growing, and the performance of AI and automated metadata generation tools is constantly improving.  MetaRex can allow for seamless swapping out of tools without additional integration costs and time.</p>
      </p> Who doesn’t love saving some time and money!</p>
    </div>
</div>

<div class="ui basic styled accordion">
    <div class="title">
      <i class="dropdown icon"></i>
      .zip with a timeline?
    </div>
    <div class="content">
      <p class="transition hidden">Media metadata almost always needs to be realted to one or more assets (video, audio, data) as well as to the timeline of the media clip, composition or programme.</p>
      </p>Zipping up metadata or putting it in a tarball are common concepts, but associating it with frame accurate video, sample accurate audio, or the timebase of the stepper motors of a lens would have to be invented for these common formats.</p>
      </p>The MXF standard was designed for the job, has been in production for 20 years and is seen by every consumer on the planet when they go to the cinemas. It seems an obvious candidate, given that putting the zip or the tarbal inside an MXF container is already standardised.</p>
   </div>
    <div class="title">
      <i class="dropdown icon"></i>
      What is the {{< metarex >}} Registry?
    </div>
    <div class="content">
      <p class="transition hidden">When FedEx put a barcode on your parcel, they're actually putting a reference to a register that contains metadata about the package.   What's in it?  How heavy is it?  Does it contain a live dinosaur so needs air??</p>
      </p>MetaRex uses the same idea.  A magic number - the MetaRex ID - allows software to read specifications, schema and lists of online services to process classes of metadata.</p>
      </p>You can view the {{< metarex >}} Registry here</p>
      </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Where can I see the {{< metarex >}} Github?
    </div>
    <div class="content">
      <p class="transition hidden">You can view the MetaRex GitHub here</p>
      </div>
    <div class="title">
      <i class="dropdown icon"></i>
      So why is it so hard to send media metadata?
    </div>
    <div class="content">
      <p class="transition hidden">That’s the problem that MetaRex solves.  
      Map the mrx container into networks so that destination addresses work. Define a database (register) of manifests so that you know what’s in the mrx container. An added bonus is that the mrx register can publish cloud endpoints to manage the metadata - this can lead to no code integrations. That should be nice!</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Why would I want to use {{< metarex >}}?
    </div>
    <div class="content">
      <p class="transition hidden">Because today, every Virtual Set and engineering heavy production is a custom build. Every QC report is unlinked to the master content and version workflows lose metadata when content is processed by third parties.</p>
    </div>
    <div class="title">
    <i class="dropdown icon"></i>
      What is {{< metarex >}} good for?
    </div>
    <div class="content">
      <p class="transition hidden">
      Carrying binary, text, isochronous and event driven metadata. Identifying the metadata via a registry and providing links to applications and schemas that can shed light on how to process that metadata. By harmonising the identification and transport of the metadata, an infrastructure can be built to keep the stuff that we currently lose.</p>
    </div>
    <div class="title">
    <i class="dropdown icon"></i>
      How could {{< metarex >}} benefit me?
    </div>
    <div class="content">
      <p class="transition hidden">We can help you streamline your workflows and connect you with our growing network of companies.  Your involvement will give you the opportunity to adapt the MetaRex framework to your requirements and make life easier, workflow faster and cheaper for you!</p>
    </div>
    <div class="title">
      <i class="dropdown icon"></i>
      Ummm.... I have another question?
    </div>
    <div class="content">
      <p class="transition hidden">We firmly believe here that there is no such thing as a stupid question!  If you or your company are having issues with metadata and think MetaRex can help.  Get in touch with us.</p>
      </p>We would be happy to help! 🦖</p>
    </div>
</div>

[RC]:   "/rexy-area/_index.md"
[form]:  https://metarex.media/contact/
[linkedin]:  https://www.linkedin.com/company/metarex-media
[Instagram]: https://www.instagram.com/metarex.media?igsh=MWNidHNudDB5MXlwMA%3D%3D
[Github]:   https://github.com/metarex-media/
[here]:     https://metarex.media/ui/reg/