---
title:       Dawn Chorus Phase 2
linkTitle:   Dawn Chorus Phase 2
date:        2024-02-21
description: The Dawn Chorus Phase 2 Specification
author:      Bruce Devlin
tags:        ["dawn-chorus", "phase-2"]
weight:      199
---

{{% banner "Dawn Chorus Phase 2." %}}

## Dawn Chorus Phase 2

Program Pods on laptop
stakes / poles
volunteers
instructions for getting setup
instructions for validating setup
instructions for recording
instructions for recording validation
instructions for submitting content to Dawn Chorus platform
instruction for validating the resulting streams

picture mapping pods to sound fields & resulting experience
Hardware for metarex - design &

app cost - write requirements

Describe the in-hall entertainment setup & listening results - tangible



- - - - - - - -
The Proof of Concept will achieve the following:

1. Show the system works
2. Create an audio experience for a single recording for a single location
3. Provide information to estimate on:
   1.1 the number of AudioMoths devices needed for a given area
   1.2 the accuracy of frequency and phase lock needed between AudioMoths
   1.3 the accuracy of achievable GPS sync using the chirp method
   1.4 the accuracy of the sound source algorithms available
   1.5 the quality of ambient sound suppression available
   1.6 the immersivity of headphone & speaker test environments

### 1. Equipment

The PoC will be performed at least twice in at least 2 locations providing at
least 4 different recorded environments.

* 3 pods containing
   * AudioMoth recorders (preferably GPS locked)
   * metarex GPS, temperature & humidity recorders (one per AudioMoth)
   * Battery power
   * Memory cards to cover the duration of the recording (30m)

### 2. Setup

Lab tests will be performed to determine a synchronisation mechanism to lock
the devices to the GPS signal. The current idea is for each metarex pod to
emit a modulated frequency sweep that can be recorded by all the pods. The
chirp will identify the pod and the metarex GPS recorder will record the GPS
time of the emitted chirp.

Software testing should enable the identification and synchronisation of the
pods to be evaluated until a reasonable accuracy can be achieved.

### 3. Recording

The recordings will run for around 30 minutes for each proof of concept and
will result in 3 streams of audio data and 3 streams of metadata for each
recording.

### 4. Post processing

Post processing of the result will attempt to isolate sound sources and to plot
graphs giving metrics for the numbered requirements.

### 5. Results

The preliminary results will be restricted and made available to project
participants for evaluation on the metarex website. If the results are signed
off by the participants, these results will be made publicly available.

### 6. Timeline (time (T) measured in weeks)

1. {**T**=_0_} Hardware & Funding available
2. {**T**+_5_} pods constructed and setup complete
3. {**T**+_6_} recording complete
4. {**T**+_10_} post processing complete
5. {**T**+_13_} preliminary results review period
5. {**T**+_15_} results published & phase 2 documented

### 7. Provisional costs

```text
Metarex:
  £3000  4wk   Full time engineering @ £150/day
  £ 450  3off  AudioMoth
  £ 225  3off  Metarex GPS kits
  £150   1off  AWS processing fees (estimate)
```

{{% sitelinks %}}
