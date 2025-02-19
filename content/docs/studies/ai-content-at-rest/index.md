---
title:       AI - content at rest
linkTitle:   AI - content at rest
date:        2025-02-19
description: How metarex and VC-6 improve training and re-training workflows
---

{{% fo
   t = "image-fluid"
   src = "content-at-rest.png"
   alt = "MetaRex Generic Live Production Scenario"
   text = "MetaRex Generic Live Production Scenario"
/%}}

We're proposing a simple paradigm:

* Store your content at rest in full resolution
* Use an API to retrieve the resolution you need
* only ever link to the full res content
* Iterate your AI training
  * lowest res for all content
  * mid-res for higher-value content
  * highest res for top-tier content

<div class="ui three column grid">
<div class="ui column">
<div class="ui segment">
<img src="mrx-worker1.svg" alt="metarex worker" class="image" style="width:100%;" />
</div>
</div>
<div class="ui column">
<div class="ui segment">
<img src="mrx-worker2.svg" alt="metarex worker" class="image" style="width:100%;"  />
</div>
</div>
<div class="ui column">
<div class="ui segment">
<img src="mrx-worker3.svg" alt="metarex worker"  class="image" style="width:100%;"/>
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
