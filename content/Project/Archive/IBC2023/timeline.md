---

title:       "Timeline"
linkTitle:   "Timeline"
description: Timeline to deliver the Responsive Narrative Factory.
tags:        ["status"]
---

{{% pageinfo %}}
The Responsive Narrative Factory will be shown at IBC 2023 in
the IBC Accelerator Zone.
{{% /pageinfo %}}

```mermaid
---
displayMode: compact
---
gantt
    dateFormat    YYYY-MM-DD
    title         IBC Responsive Narrative Factory
    axisFormat    %Y-%m
    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)
    todayMarker stroke-width:5px,stroke:#0f0,opacity:0.3

    section Week Countdown
    w14                     : done, w14,  2023-06-05, 1w
    w13                     : done, w13,  2023-06-12, 1w
    w12                     : done, w12,  2023-06-19, 1w
    w11                     : done, w11,  2023-06-26, 1w
    w10                     : w10, 2023-07-03, 1w
    w9                      : w9,  2023-07-10, 1w
    w8                      : w8,  2023-07-17, 1w
    w7                      : w7,  2023-07-24, 1w
    w6                      : w6,  2023-07-31, 1w
    w5                      : w5,  2023-08-07, 1w
    w4                      : w4,  2023-08-14, 1w
    w3                      : w3,  2023-08-21, 1w
    w2                      : w2,  2023-08-28, 1w
    w1                      : w1,  2023-09-04, 1w
    w0                      : w0,  2023-09-11, 1w

    section Milestones
    Blender Clips           : milestone,       msBlend, after w14, 1w
    PoC demo                : crit, milestone, msPoC  , after w8 , 1w
    IBC 2023                : crit, milestone, msIBC. , 2023-09-14, 4d

    section Content
    tag Blender             : active,    tagBL, after msBlend, 2w
    get Springwatch Clips   : active,    getSW, after w12.   , 1w
    tag Springwatch         : active,    tagSW, after getSW  , 4w

    section Engineering
    metarex cli             : active, cli, 2023-06-01, 2023-06-30
    infuse components       :        comp, after tagBL , 4w
    integration             : crit,  intg, after comp, 3w
    testing                 : crit,  test, after comp, 6w


    section Marketing
    IBC promotion          :mkt, 2023-07-17, 2023-09-14
```

{{% sitelinks %}}
