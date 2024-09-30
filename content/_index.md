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
{{< o/features >}}
  {{< o/feature
    divClass = "ui green segment"
    msgClass = "ui green message"
    name     = "Why a Dinosaur?"
    src      = "/img/dino/mrx-logo.svg"
    link     = "/rexy"
  />}}
  {{< o/feature
    divClass = "ui yellow segment"
    msgClass = "ui yellow message"
    name     = "What does it Do?"
    src      = "/project/introduction/featured-fedex.jpg"
    link     = "/project/introduction/"
  />}}
  {{< o/feature
    divClass = "ui red segment"
    msgClass = "ui red message"
    name     = "How does it work?"
    src      = "/img/mrx-flow.png"
    link     = "/project/flow-diagram/"
  />}}
  {{< o/feature
    divClass = "ui blue segment"
    msgClass = "ui blue message"
    name     = "What's the benefit?"
    src      = "/project/admin/metarex-ltd/featured-boardroom.jpg"
    link     = "/project/faq/"
  />}}
{{< /o/features >}}

<!--   ___   _                             _            -->
<!--  | _ ) | |  ___   __ _   ___    ___  | |_   __     -->
<!--  | _ \ | | / _ \ / _` | (_-<   / -_) |  _| / _|    -->
<!--  |___/ |_| \___/ \__, | /__/   \___|  \__| \__|    -->
<!--                  |___/                             -->
{{< o/block blockType = "blog" count = 2 skip = 0 />}}

{{< o/block
    blockType = "cover"
    header = "BUG - without header the include fails"
    from = "project/coverpages/rexycover.md"
    src = "project/coverpages/rexycover-240806.jpg"
/>}}

{{< o/block
    blockType = "include"
    from = "blog/2024-03-07-rnf-best-accelerator"
/>}}

{{< o/block blockType = "include" from = "project/goals" />}}

{{< o/block
    blockType = "include"
    from = "project/flow-diagram"
    src = "/img/mrx-flow.png"
/>}}

{{< o/block
    blockType = "include"
    from = "project/Admin/backer-list"
    src = "/img/dino/mrx-logo.svg"
/>}}

{{< o/block blockType = "include" from = "project/introduction" />}}

<!-- {{< o/block blockType = "include" from = "project/videos" />}} -->

{{< o/block blockType = "include" from = "project/admin/metarex-ltd" />}}
