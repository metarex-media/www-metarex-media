---
#                         _  _                       ___
#   _ __    _ _  __ __   | || |  ___   _ __    ___  | _ \  __ _   __ _   ___
#  | '  \  | '_| \ \ /   | __ | / _ \ | '  \  / -_) |  _/ / _` | / _` | / -_)
#  |_|_|_| |_|   /_\_\   |_||_| \___/ |_|_|_| \___| |_|   \__,_| \__, | \___|
#                                                                |___/
title:     Metarex
linkTitle: Metarex
date:      2024-08-13
---
<!--  ___                _                             -->
<!-- | __|  ___   __ _  | |_   _  _   _ _   ___   ___  -->
<!-- | _|  / -_) / _` | |  _| | || | | '_| / -_) (_-<  -->
<!-- |_|   \___| \__,_|  \__|  \_,_| |_|   \___| /__/  -->
{{< fo t = "features" >}}
  {{< fo t = "feature"
    divClass = "ui green segment"
    msgClass = "ui green message"
    name     = "Why a Dinosaur?"
    src      = "img/dino/mrx-logo.svg"
    link     = "rexy/"
  />}}
  {{< fo t = "feature"
    divClass = "ui yellow segment"
    msgClass = "ui yellow message"
    name     = "What does it Do?"
    src      = "project/introduction/featured-fedex.jpg"
    link     = "project/introduction/"
  />}}
  {{< fo t = "feature"
    divClass = "ui red segment"
    msgClass = "ui red message"
    name     = "Case Studies"
    src      = "docs/studies/case-studies.webp"
    link     = "docs/studies/"
  />}}
  {{< fo t = "feature"
    divClass = "ui blue segment"
    msgClass = "ui blue message"
    name     = "What's the benefit?"
    src      = "/project/admin/metarex-ltd/featured-boardroom.jpg"
    link     = "/project/faq/"
  />}}
{{< / fo t = "features" >}}

<!--   ___   _                             _            -->
<!--  | _ ) | |  ___   __ _   ___    ___  | |_   __     -->
<!--  | _ \ | | / _ \ / _` | (_-<   / -_) |  _| / _|    -->
<!--  |___/ |_| \___/ \__, | /__/   \___|  \__| \__|    -->
<!--                  |___/                             -->
{{< fo t = "blog" count = 4 skip = 2 />}}

{{< fo t = "cover"
    header = "BUG - without header the include fails"
    from = "project/coverpages/rexycover.md"
    src = "project/coverpages/rexycover-240806.jpg" />}}

{{< fo t = "include" from = "blog/2024-03-07-rnf-best-accelerator" />}}

{{< fo t = "include" from = "project/goals" />}}

{{< fo t = "include" from = "project/flow-diagram" 
src = "/img/mrx-flow.png" 
/>}}

{{< fo t = "include" from = "project/Admin/backer-list"
src = "/img/dino/mrx-logo.svg" 
/>}}

{{< fo t = "include" from = "project/introduction" />}}

<!-- {{< fo t = "include" from = "project/videos" />}} -->

{{< fo t = "include" from = "project/admin/metarex-ltd" />}}
