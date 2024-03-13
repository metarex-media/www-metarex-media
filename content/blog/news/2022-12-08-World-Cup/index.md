---
title:       "2022-12-08 World Cup"
linkTitle:   "2022-12-08 World Cup"
date:        2022-12-08
description: Katya reports from the SVG on metadata flows.
author:      Ekaterina Petoukhova [@in](https://www.linkedin.com/in/ekaterina-petoukhova-84141959/)
tags:        ["project",  "football", "yellowbasket"]
---

{{< f/block
  id    = "summary"
  src   = "featured-katya.jpg"
  srcOn = "left"
  srcWidth = 0.2
>}}
The [FIFA] World Cup Qatar 2022 is nearly over, and the [FIFA] World Cup
Division, which is responsible for the broadcast production, and Host Broadcast
Services ([HBS]) produce a remarkable worldwide coverage, which include
traditional broadcasting, OTT broadband and mobile streaming.

If we leave the art of the game itself and look in to the technology of the
spectacle, we can see a huge jump forwards in creating a single, unified,
UHD/HDR capture-transmission workflow for all 64 matches. This approach allows
all distribution formats to be generated in a single workflow, greatly
streamlining operations and setup.

[Fifa]: https://www.fifa.com/
[HBS]:  https://www.hbs.tv/about-us/

{{< /f/block >}}

<!-- ####################################################################### -->

{{< f/block
  id    = "block2"
  src   = "football-rigging.png"
  srcOn = "right"
>}}
For HDR (High Dynamic Range), hybrid log gamma (HLG) format is used to provide a
standardized and easy-to-manage set of colour transformations between SDR and
HDR. UHD/HDR capture coming from selected standard cameras at 50 fps, but
mostly 1080p from cameras shooting at 150 fps and higher. Replay and recording is
in HDR, and a common HDR opto-electronic transfer function is used for all
cameras. If you ask me about metadata in this setup, I would not be able to give
you a positive answer, I am afraid that many useful metadata elements were not
considered at all because of the difficulty of integrating the annotation /
metadata systems with the live production systmes.
{{< /f/block >}}
{{< f/block
  id    = "block3"
>}}
The standard camera plan has 42 cameras, and both super-slo-mo and ultra-slo-mo
are in the mix, covering key players. Several RF cameras will also be used
to capture activities — fan coverage, team arrivals, VIP and player interviews —
in and around the stadium. (By Sports Video Group material)

At the core of live content distribution are the multi-feeds allowing FIFA to
provide a wide range of match, pre- and post-match, and other content to
rightsholders. Multilateral feeds and selected isolated cameras will also be
available in different formats, including 12G-SDI UHD/HDR BT.2020 at 2160p/50
for selected isolated cameras and the Extended Stadium Feed. All multi-feeds
will be available to rightsholders in 3G SDI-HDR (BT.2020), 3G-SDI SDI
(REC.709), and HD-SDI SDI (REC.709). Each one will have up to 16 embedded audio
channels.

The lineup of feeds:

* Extended Stadium Feed
* Extended Basic International Feed
* Tactical and Additional Content Fee
* Team A and B Feeds
* Player A and B Feeds
* Fan feed
* Action clips
* Emotion clips
* Permanent highlights
{{< /f/block >}}

<!-- ####################################################################### -->

{{< f/block
  id    = "block4"
>}}

One of the features of this year broadcasting setup has been the cloud-based
media server, FIFA MAX (Media Asset Exchange), which allows rights holders to
seard for _and find_ find a treasure trove of content. The 2022 version will be
capable of holding 6,000 hours of content, all of which can be accessed via the
FIFA Content Interface. Best of all, rightsholders can access it whether or not
they are based at the IBC, giving production professionals thousands of miles
away a chance to boost content creation and output. Content will be stored via
XAVC-I at 1080p/50, and the server also supports ingest and delivery in HDR
(with SDR preview). If only we knew and could measure what portion of the live,
time based metadata associated with the media found its way to the cloud based
storage.  A {{% metarex %}} fire-hose of metadata might have enriched the quality,
quantity and **searchability** of assets.

{{< /f/block >}}

<!-- ####################################################################### -->

{{< f/block
  id    = "block5"
  src   = "feeds.png"
  srcOn = "left"
>}}
The same could be applied to the audio. Rights holders will have a choice of a
basic-stereo mix, 5.1 surround-sound mix **_and also_** a **5.1.4** immersive
mix produced in two immersive-sound galleries at the IBC. At the center of those
efforts, an eight-capsule microphone array at each stadium is supported by
additional three-dimensional microphone arrays located closer to the spectators.
{{< /f/block >}}
{{< f/image
  src = "mobile-viewer.jpg"
  caption = "Mobile Viewers"
>}}
{{< f/image
   src = "portugal-watchers.jpg"
   caption = "football spectators Morocco-Portugal match taken on Madeira island"
>}}
