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
    blockClass = "ui green segment"         divClass = blockClass
    class      = "ui green message"         msgClass = class
    header     = "Why a Dinosaur?"          name = header
    src        = "img/dino/mrx-logo.svg"
    link       = "rexy/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui yellow segment"        divClass = blockClass
    class      = "ui yellow message"        msgClass = class
    header     = "What does it Do?"         name = header
    src        = "project/introduction/featured-fedex.jpg"
    link       = "project/introduction/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui red segment"           divClass = blockClass
    class      = "ui red message"           msgClass = class
    header     = "Case Studies"             name = header
    src        = "docs/studies/case-studies.webp"
    link       = "docs/studies/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui blue segment"          divClass = blockClass
    class      = "ui blue message"          msgClass = class
    header     = "What's the benefit?"      name = header
    src        = "/project/admin/metarex-ltd/featured-boardroom.jpg"
    link       = "/project/faq/"
  />}}
  {{< /fo >}}
<!-- ---------------------------------------------------------------------- -->
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
