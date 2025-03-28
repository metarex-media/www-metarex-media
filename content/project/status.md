---

title:       "Status"
linkTitle:   "Status"
weight:      50
type:        docs
description: Current Status.
tags: ["status"]
---

{{< f/message 
    header = "We're over half way through & on target!"
    src = "/img/dino/mrx-logo-0300.png" 
    class = "ui center aligned olive message"
>}}

{{% metarex %}} is looking for more [backers] to create a financial reserve
from which we can give out grants to engineering teams to create the Open
Source that we need to enable free tooling for all. Please make a small
financial or engineering contribution if a working global media meta data
ecosystem is of interest to you or your company.

```mermaid
gantt
    dateFormat    YYYY-MM-DD
    title         High level timing of Metarex
    tickInterval  1month - broken - upgrade to mermaid 9.3
    axisFormat    %Y-%m
    excludes      weekends
    %% (`excludes` accepts specific dates in YYYY-MM-DD format, days of the week ("sunday") or "weekends", but not the word "weekdays".)

    section Setup
    IBC feasibility                      :                done,   A1, 2022-09-01, 2022-09-30
    Create company                       :                done,   A2, 2022-10-01, 2022-12-31
    Website & Tools                      :                done,   A3, 2022-10-01, 2022-12-31


    section Marketing & Funds
    Awareness                           :                 done,   M1, 2023-01-01, 12w
    NAB 2023                            :      milestone, done,       2023-04-16, 1d
    MPTS 2023                           :      milestone, done,       2023-05-14, 1d
    IBC 2023                            :      milestone, done,       2023-09-14, 1d
    Best IBC Accelerator Award 2023     :crit, milestone, done,       2024-03-07, 1d
    NAB 2024                            :crit, milestone, done,       2024-04-16, 1d
    MPTS 2024                           :crit, milestone, done,       2024-04-16, 1d

    section Work
    GoLang dev packager                 :                 done,   W0, 2023-02-01, 2023-05-31
    IBC Accelerator                     :                 done,   W0, 2023-05-01, 2023-09-20
    System Design updates               :                 done,   Wi, 2023-09-01, 2023-12-31
    Extract-Transform-Load demos        :                 done,   We, 2024-01-01, 2024-04-30
    production register (read only)     :      active,    done,   Wr, 2024-03-01, 2024-06-30
    production register (user accounts) :      active,            Wa, 2024-07-01, 2024-12-20
    documentation & specifications      :                         Wd, 2024-05-01, 2024-12-20
    All Work Packages                   :                         Ww, 2023-07-14, 2024-11-30


    section Termination
    Final IBC                           :crit, milestone,             2024-09-14, 1d
    End R&D Activities                  :crit, milestone,             2024-12-31, 1d
    Administer Sustaining               :                             2025-01-01, 2025-06-30
    Major Metadata Projects start       :                             2025-002-01, 6w
```

{{% sitelinks %}}

[backers]: /backers