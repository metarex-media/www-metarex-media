---
#                         _  _                       ___
#   _ __    _ _  __ __   | || |  ___   _ __    ___  | _ \  __ _   __ _   ___
#  | '  \  | '_| \ \ /   | __ | / _ \ | '  \  / -_) |  _/ / _` | / _` | / -_)
#  |_|_|_| |_|   /_\_\   |_||_| \___/ |_|_|_| \___| |_|   \__,_| \__, | \___|
#                                                                |___/
title:     MetaRex
linkTitle: MetaRex
date:      2024-08-13
---
<!--  ___                _                             -->
<!-- | __|  ___   __ _  | |_   _  _   _ _   ___   ___  -->
<!-- | _|  / -_) / _` | |  _| | || | | '_| / -_) (_-<  -->
<!-- |_|   \___| \__,_|  \__|  \_,_| |_|   \___| /__/  -->

{{< fo t = "feature-group" >}}
  {{< fo t = "feature"
    blockClass = "ui green segment"         divClass = blockClass
    class      = "ui green message"         msgClass = class
    header     = "Why a Dinosaur logo?"          name = header
    src        = "img/dino/mrx-logo.svg"
    srcClass   = "ui fluid image"
    alt        = "metarex logo"
    link       = "rexy/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui yellow segment"        divClass = blockClass
    class      = "ui yellow message"        msgClass = class
    header     = "What does MetaRex do?"         name = header
    src        = "project/introduction/featured-fedex.jpg"
    srcClass   = "ui fluid image"
    alt        = "dino stacking a box"
    link       = "project/introduction/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui red segment"           divClass = blockClass
    class      = "ui red message"           msgClass = class
    header     = "Case Studies"             name = header
    src        = "docs/studies/case-studies.webp"
    srcClass   = "ui fluid image"
    alt        = "dino doing research"
    link       = "docs/studies/"
  />}}
  {{< fo t = "feature"
    blockClass = "ui blue segment"          divClass = blockClass
    class      = "ui blue message"          msgClass = class
    header     = "What's the benefit?"      name = header
    src        = "/project/admin/metarex-ltd/featured-boardroom.jpg"
    alt        = "dino in a suit"
    link       = "/project/faq/"
  />}}
  {{< /fo >}}
{{< fo t = "feature-group" >}}
  {{< fo t = "feature"
    blockClass = "ui red segment"         divClass = blockClass
    class      = "ui pink message"         msgClass = class
    header     = "Case Study - Live Production"     name = header
    src        = "docs/studies/monitoring/monitoring-generic.png"
    srcClass   = "ui fluid image"
    alt        = "monitoring-generic"
    link       = "docs/studies/monitoring"
  />}}
  {{< fo t = "feature"
    blockClass = "ui red segment"                   divClass = blockClass
    class      = "ui pink message"                   msgClass = class
    header     = "VC-6"                    name = header
    src        = "img/vc6.png"
    srcClass   = "ui fluid image"
    alt        = "vc6 logo"
    link       = "https://vc6.metarex.media"
  />}}
  {{< fo t = "feature"
    blockClass = "ui red segment"           divClass = blockClass
    class      = "ui pink message"           msgClass = class
    header     = "Case Study - AI efficiency"
    src        = "docs/studies/ai-content-at-rest/aicar.svg"
    srcClass   = "ui fluid image"
    alt        = "monitoring-generic"                                     name = header
    link       = "docs/studies/ai-content-at-rest/"
  />}}
  {{< /fo >}}

{{< fo t = "item-group" >}}
<!-- ---------------------------------------------------------------------- -->
<!--   ___   _                             _            -->
<!--  | _ ) | |  ___   __ _   ___    ___  | |_   __     -->
<!--  | _ \ | | / _ \ / _` | (_-<   / -_) |  _| / _|    -->
<!--  |___/ |_| \___/ \__, | /__/   \___|  \__| \__|    -->
<!--                  |___/                             -->
{{< fo t = "item-blog-group" count = 4 skip = 3 />}}

{{< fo t = "item-include"
    header = "BUG - without header the include fails"
    from = "project/coverpages/rexycover.md"
    src = "project/coverpages/rexycover-240806.jpg"
    alt = "rexycover page"
/>}}

{{< fo t = "item-include"
    from = "/blog/2024-03-07-rnf-best-accelerator/index.md"
/>}}

{{< fo t = "item-include"
    from = "/project/goals/index.md"
/>}}

{{< fo t = "item-include"
    from = "/project/flow-diagram.md" 
    src = "/img/mrx-flow.png" 
    alt = "flow diagram"
/>}}

{{< fo t = "item-include"
    from = "/project/Admin/backer-list.md"
    src = "/img/dino/mrx-logo.svg" 
    alt = "rexy logo"
/>}}

<!-- {{< fo t = "item-include" 
    from = "/project/introduction/index.md" 
/>}} -->

<!-- {{< fo t = "include" from = "/project/videos.md" />}} -->

<!-- {{< fo t = "item-include" 
    from = "/project/Admin/metarex-ltd/index.md" 
/>}} -->
{{</fo>}}