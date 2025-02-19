---
title:       AI - content at rest
linkTitle:   AI - content at rest
date:        2025-02-19
description: How metarex and VC-6 improve training and re-training workflows
---

{{% fo
   t = "image"
   src = "content-at-rest.png"
   srcClass = "ui centered image"
   alt = "MetaRex Generic Live Production Scenario"
   text = "MetaRex Generic Live Production Scenario"
   header = "Figure 1"
/%}}

#### We're proposing a simple paradigm:

* Store your content at rest in full resolution
* Use an API to retrieve the resolution you need
* only ever link to the full res content
* Iterate your AI training
  * lowest res for all content
  * mid-res for higher-value content
  * highest res for top-tier content

{{% fo
   t = "image"
   src = "car.svg"
   srcClass = "ui fluid image"
   alt = "Workflow"
   text = "Content at rest workflow"
   header = "Figure 2"
/%}}

#### To make this a reality for everyone ...

We need to complete our `mrx-worker` module. This code integrates all the
necessary building blocks of metarex into a single repo that allows several
different operating modes

1. Stand alone executable (intel, arm, Win, Mac, Linux)
2. Embedded network service for use inside a product or cluster
3. Authenticated network service for use in a mixed security environment

<div class="ui three column grid">
<div class="ui column">
<div class="ui segment">
{{% fo
   t = "image"
   src = "mrx-worker1.svg"
   srcClass = "ui fluid image"
   alt = "MetaRex Concept"
   text = "mrx-worker embedded API build"
   header = "Figure 3"
/%}}
</div>
</div>
<div class="ui column">
<div class="ui segment">
{{% fo
   t = "image"
   src = "mrx-worker2.svg"
   srcClass = "ui fluid image"
   alt = "MetaRex Concept"
   text = "mrx-worker embedded services"
   header = "Figure 4"
/%}}
</div>
</div>
<div class="ui column">
<div class="ui segment">
{{% fo
   t = "image"
   src = "mrx-worker3.svg"
   srcClass = "ui fluid image"
   alt = "MetaRex Concept"
   text = "mrx-worker authenticated worker"
   header = "Figure 5"
/%}}
</div>
</div>
</div>

### Status 2025-02-10

Most of the components exist to trial this workflow:

* a readable online register
* an envelope specification
* golang code for inserting and extracting documents from the envelope
* a specification for service representation in the register
* a [prototype register](https://metarex.media/reg)

We are looking for supporters to turn this into a real Proof Of Concept in
two phases:

1. Q1/Q2 2025 - optimise the {{%metarex%}} software for a vendors sending and
   listening equipment. This will involve creating, registering and testing
   a proprietary document format in a simulated or real network.
2. Deploying the test system at a real event.

We estimate about 5 weeks of engineering for each phase.
