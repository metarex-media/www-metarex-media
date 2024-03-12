---
title:       MXF-LIVE at ARRI International Broadcast Day 2019
linkTitle:   2019-07-20 ARRI day
date:        2019-07-20
description: The ARRI International Broadcast Day in 2019
author:      Bruce Devlin ([@mrmxf](https://twitter.com/mrmxf))
tags:        ["mxf", "project", "ARRI", "Mr MXF", "Trackmen", "Nablet"]

resources:
- name: spec
  src: ./MXF_Live*.pdf
- name: "flyer"
  src: ./mxf-live-ibc-flyer-2019.pdf
- src: "**.{png,jpg}"
  title: "Image #:counter"
  params:
    byline: "Photo: ARRI"

---

MXF-Live was demonstrated at the [ARRI International Broadcast Day
2019](https://www.arri.com/en/solutions/broadcast/broadcast-day-2019).

## Live Metadata Capture and Rendering in MXF

This 2 year project was a pre-cursor to **[metarex]**

{{< f/image-fluid
  "international-broadcast-day-demo.jpg"
  "2019 International Broadcast Demo Day"
  "caption"
>}}

Ideal for semi-custom metadata such as position,  logging, device parameters
**Shoot** with on-set metadata from devices and from humans<br>
**Wrap** the metadata in MXF using open standards<br>
**Move** the video, audio and metadata over a standard IP network<br>
**Store** the stream as an open MXF file with enhanced metadata<br>
**Share** the content live and in files environments re-wrapping

<a id="what" style="float:none;clear:both;">&nbsp;</a>

### What is it?

An existing open standard for transporting containers of synchronous metadata
over IP networks for use in both live and file environments.

An [Arri] Camera and Head sent MXF containers over IP. These were multiplexed
with Metadata from the [Trackmen] system that gather pan, tilt, yaw, zoom,
position, and lens metadata. [Nablet] software managed MXF multiplexing and
demultiplexing as well as serialising the MXF from the network into a file that
could be opened in Avid.

<a id="why" ></a>

### Why?

Many productions have rich metadata such as lens information, gimble telemetry,
camera position information, shot logging and other bulky metadata that is
created. The workflows to get it into the show are often ad-hoc. This project
uses open standards to preserve metadata in a way that minimises re-wrap and
re-engineering the data.

<a id="who" ></a>

### Who?

Led by **[Arri]**, the team included **[Nablet]**, **[Trackmen]**,
**[Fusionmedia]** and **[Mr MXF]** as coordinator. What's Next? The system
works and we're looking for partners to develop a framwework for handling any
kind of metadata. See the [metarex] website for details

### Contact

Use the [contact] form to ask questions and suggestions.

#### Photos

<div class="ui tiny images">
{{< f/image "mxf-live-team-sm.jpg"                    "Team"   "#team"   >}}
{{< f/image "mxf-live-system-sm.jpg"                  "System" "#system" >}}
{{< f/image "mxf-live-rig-sm.jpg"                     "Rig"    "#rig"    >}}
{{< f/image "mxf-live-cgi-sm.jpg"                     "CGI1"   "#cgi1"   >}}
{{< f/image "mxf-live-cgi2-sm.jpg"                    "CGI2"   "#cgi2"   >}}
{{< f/image "mxf-live-camera-sm.jpg"                  "Camera" "#camera" >}}
{{< f/image "international-broadcast-day-demo-sm.jpg" "Demo"   "#demo"   >}}
</div>

<a id="team"></a>

{{< f/image-fluid
  "featured-mxf-live-team.jpg"
  "MXF Live Team"
  "showCaption"
>}}

<a id="system" ></a>

{{< f/image-fluid  "mxf-live-system.jpg" "MXF Live Demo System" "showCaption" >}}

<a id="rig" ></a>

{{< f/image-fluid  "mxf-live-rig.jpg" "MXF Live Demo Rig" "showCaption" >}}

<a id="cgi1" ></a>

{{< f/image-fluid  "mxf-live-cgi.jpg" "MXF Live CGI Demo" "showCaption" >}}

<a id="cgi2" ></a>

{{< f/image-fluid  "mxf-live-cgi2.jpg" "MXF Live CGI Demo" "showCaption" >}}

<a id="camera" ></a>

{{< f/image-fluid
  "mxf-live-camera.jpg"
  "MXF Live Demo Camera"
  "showCaption"
>}}

<a id="demo" ></a>

{{< f/image-fluid
  "international-broadcast-day-demo.jpg"
  "MXF Live Demo"
  "showCaption"
>}}

# Partners

<a id="nablet"></a>
<div class="ui horizontal fluid card">
  <div class="content">
    <div class="header">
      <a target="_blank" href="https://nablet.com">Nablet</a>
    </div>
    <div class="meta">
      <span class="category">Partner</span>
    </div>
    <div class="description">
    <div class="ui small right floated image">
      <img src="logo-nablet.png">
    </div>
      <p><strong>Video Processing Technologies for Professionals.</strong>
      </p>
      <p>Our products are used widely in content creation, broadcasting, OTT,
         post-production, and other related industries. From low-level software
         development toolkits and video codecs to Avid Media Composer plugins,
         video transcoding engines and AI-powered video processing components,
         we provide a complete ecosystem of tools to meet ever-changing market
         needs.
      </p>
    </div>
  </div>
</div>

<a id="trackmen"></a>
<div class="ui horizontal fluid card">
  <div class="content">
    <div class="header">
      <a target="_blank" href="https://www.trackmen.de/">Trackmen</a>
    </div>
    <div class="meta">
      <span class="category">Partner</span>
    </div>
    <div class="description">
    <div class="ui small right floated image">
      <img src="logo-trackmen.jpg">
    </div>
      <p><strong>TrackMen has been inventing real-time tracking solutions
          for live Virtual Broadcast Graphics since 1997.</strong>
      </p>
      <p>TrackMen provides turnkey solutions and products in the field of 3D
         camera and object tracking, smart automation systems and keying
         technologies. Those technologies are used for Virtual Broadcast
         Graphics, Augmented Reality and Virtual Studios. Trackmen also covers
         live streaming events, concerts, television shows, exhibitions,
         and sports events worldwide.
      </p>
    </div>
  </div>
</div>

<a id="arri"></a>
<div class="ui horizontal fluid card">
  <div class="content">
    <div class="header">
      <a target="_blank" href="https://arri.com">ARRI</a>
    </div>
    <div class="meta">
      <span class="category">Partner</span>
    </div>
    <div class="description">
    <div class="ui tiny right floated image">
      <img src="logo-arri.svg">
    </div>
      <p><strong>Inspiring Images since 1917.</strong></p>
      <p>ARRI is a global player within the motion picture industry, employing
       around 1,200 staff worldwide. Named after its founders August Arnold and
       Robert Richter, ARRI was established in Munich, Germany, where the
       headquarters is still located today.</p>
       <p>The Academy of Motion Picture Arts and Sciences has recognized ARRI’s
       engineers and their contributions to the industry with 19 Scientific and
       Technical Awards.</p>
    </div>
  </div>
</div>

<a id="mrmxf"></a>
<div class="ui horizontal fluid card">
  <div class="content">
    <div class="header">
      <a target="_blank" href="https://mrmxf.com">Mr MXF</a>
    </div>
    <div class="meta">
      <span class="category">Partner</span>
    </div>
    <div class="description">
    <div class="ui tiny right floated image" >
      <img src="logo-mrmxf.svg" style="height:6em;">
    </div>
      <p><strong>Helping Technology into existence.</strong></p>
      <p>Mr MXF is a media technology consultancy helping to turn difficult
      problems into business reality. Led by Bruce Devlin, SMPTE's past
      Standards Vice President, the team turns test patterns into art, metadata
      into a gas pedal for business, complexity into explainer videos and
      turgid documents into entertaining training days.
      </p>
    </div>
  </div>
</div>

### Some Resources from the initial project

* <i class="file pdf outline icon"></i>[Original specificatino as PDF](/downloads/mxf-live/MXF_Live_Streaming_Specification_Draft_v.100_2019-10-23.pdf)
* <i class="file word icon"></i>[Original specificatino as DOCX](/downloads/mxf-live/metastream-specification(github).docx)
* <i class="file pdf outline icon"></i>[Original flyer](/downloads/mxf-live/mxf-live-ibc-flyer-2019.pdf)

[metarex]:      https://metarex.media
[arri]:         #arri
[nablet]:       #nablet
[mr mxf]:       #mrmxf
[trackmen]:     #trackmen
[fusionmedia]:  mailto:kevin@fusionmedia.uk.com

{{% sitelinks %}}
