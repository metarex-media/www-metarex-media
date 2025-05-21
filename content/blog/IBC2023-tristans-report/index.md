---
title:       Tristan's report on IBC 2023
linkTitle:   Tristan's report on IBC 2023
date:        2023-09-25
description: "Tristan's reports on his first IBC!"
author:      Tristan Larke [@in](https://www.linkedin.com/in/tristanlarke/)
tags:        ["event", "workflow", "tech"]
oldtags:     ["project",  "backers", "tristan"]
---

MetaRex went to IBC 2023 as part of the [IBC Accelerators][acc], as a
participant in the [Responsive Narrative Factory][rnf]. The Responsive
Narrative Factory (RNF) was set the task of creating personalised dynamic video
streaming. The demo at IBC was culmination of five months work across multiple
companies and technical disciplines.

In RNF the personalisation meant the stream is tailored to the user's feedback
and preferences, while preserving the narrative of the content. Ten people
could watch the same stream, but with different content choices, such as
predation, certain presenters, or watch time and have a different stream
generated. The spring watch demo had up to approximately 4 million viewing
combinations! The dynamic element meant segments of the stream can be changed
on the fly, such as a user response to a segment causing a skip to the next
segment without that tag e.g. nudity (useful when with the kids or parents,
delete where applicable).

<div class="ui centered large image"><img src="bunnynudity.png" alt="bunny nudity"/></div>

MetaRex's role was handling the metadata tagging of the videos to segment them
up. We took metadata tagging of the videos, from multiple sources such as AI or
[Bruce Devlin][mrmxf], then used this to split up the video into segments based
on their metadata with accompanying tags. These segments were used by the
infuse video player to stream the video. To handle the different styles and
types of metadata, we used a MetaRex tool to take data from multiple sources
and clean them into a generic database. All metadata could then be handled with
the same workflow for video segmentation. This reduced the time for
segmentation, as it removed the need to make custom handling of each metadata
source. If you would like to see the tool, you can check it out [here][code],
please note it is a work in progress.

<div class="ui centered fluid image"><img src="workflow.png" alt="workflow"/></div>

It was great to see so many people visit the RNF booth, engage with demo and to
talk about the applications of RNF and MetaRex. If you were unable to make IBC
or didn't get a chance to see the demo at the booth then please check it out
[here][cuvo](this might get moved after NAB 2024).


IBC and RNF weren't the only things I got to experience in Amsterdam, apart
from sampling the famous capsule hotels and Dutch pancakes, I got to engage
with you all about metadata experiences and how MetaRex can be utilised.
Discussions about metadata and how to get people to use the same formats also
took centre stage, with efforts such as the EBU core plus to make metadata more
translatable. One thing was clear no matter what your metadata is, there should
still be a universal way of transporting it, something Metarex hopes to achieve
with the mrx file.

In conclusion the [RNF][rnf] gave us a glimpse of what may come, and the future? As Mark Smith said, _"the future will be personalised"._ The usage and types of metadata will only grow with the rise of AI, live production and more innovative technology across the industry and MetaRex will be there to ensure you can use it.

[acc]:   https://www.ibc.org/ibc-accelerators
[rnf]:   https://show.ibc.org/accelerator-project-responsive-narrative-factory
[code]:  https://gitlab.com/mm-eng/mrx-go-sql
[cuvo]:  https://cuvo.ai/ibcdemo
[mrmxf]: https://mrmxf.com/