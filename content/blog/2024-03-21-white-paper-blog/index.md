---
title:       2024-03-25 White Paper Blog
linkTitle:   2024-03-25 White Paper Blog
date:        2024-03-21
description: "{{% metarex %}} needs you - come and see why at W.1931"
author:      Bruce Devlin [@in](https://www.linkedin.com/in/mrmxf/)
tags:        ["project",  "award"]
params:
  publish:
    linkedin:  true
---

{{< f/block
  id    = "summary"
  src   = "featured-nabshow-2024.png"
  srcOn = "left"
  srcWidth = 0.2
>}}
<!-- markdownlint-disable MD025 -->

## {{% metarex %}} needs you

The [award winning][0], philanthropic, non-profit {{%  metarex %}} project
makes metadata flow. The more metadata you have, the more you will benefit. But
we need more [backers][4] to get the project over the finish line. Ideally we'd
like 2 more **<span class="ui violet text">silver</span>** [backers][4] or 15
more **<span class="ui brown text">regular</span>** [backers][4]; but first,
let's lay out our objectives:

1. 🆓 {{<  metarex >}} is a _**<span class="ui red text">free</span>**_
   [software framework][1]
2. 😎 {{%  metarex %}} lets you define _your own_ metadata.
3. 📦 {{%  metarex %}} [defines a container][2] for your metadata.
4. 🌐 {{%  metarex %}} maps containers to many types of network so that you
   get metadata transport for _**<span class="ui red text">free</span>**_!
5. 🆔 {{%  metarex %}} gives you a [unique Id][3] for your new **_type_** of
   metadata.
6. 📢 {{%  metarex %}} lets you publish _services_ for your metadata
   **_type_**.
7. 💲 You can _**<span class="ui red text">monetize</span>**_ those _services_.
8. 🔎 {{%  metarex %}} lets you discover _services_ for _unknown_ metadata
   types.
9. 👨‍👩‍👧‍👧 {{%  metarex %}} supports **all** types of metadata including <span
   class="ui red text">text & binary</span>, <span class="ui green
   text">timeline & static</span>, <span class="ui brown text">frame locked,
   sample locked & stochastic</span>, <span class="ui violet text">single
   stream & mixed streams</span> of metadata.
10. ⚖️ {{%  metarex %}} is built on standard tools, standard formats & standard
    frameworks.
11. 😎 {{%  metarex %}} can run in a product, on-premise or globally.

[0]: /blog/2024/03/06/2024-03-06-rnf-wins-best-accelerator/
[1]: https://github.com/metarex-media
[2]: https://github.com/metarex-media/mrx-container
[3]: https://metarex.media/ui/reg/
[4]: /backers/

{{% sitelinks %}}
{{< /f/block >}}

{{< f/block
  id    = "why"
  src   = "money.png"
  srcOn = "right"
  srcWidth = 0.2
  srcClass ="ui small image"
  srcCredit = "by [Karthikeyan Perumal](https://www.pexels.com/photo/various-currencies-from-several-different-countries-4695995/)"
>}}

### But why is it useful?

Like most things, it comes down to money. Over the last 30 years we've figured
out how to move video and audio around at reasonable cost, but the metadata
always gets lost!

It's often faster and easier to invent your own metadata than it is to use
someone else's - often because there's not a good description of what the
metadata is. {{% metarex %}} makes those descriptions readily available and so
reduces the amount of engineering for metadata interchange and introduces a new
monetization opportunity between metadata creators and consumers - _even if the
two companies have never met_.

{{< /f/block >}}

{{< f/block
  id    = "examples"
>}}

### Some examples

Here are some examples from the {{% metarex %}} use-case :

<table class="ui celled definition table">
  <thead class="center aligned">
    <tr>
    <th>&nbsp;</th>
    <th>Live<br>Production</th>
    <th>Virtual<br>Production</th>
    <th>Post<br>Production</th>
    <th>Distribution</th>
    <th>Distribution</th>
    </tr>
    </thead>
  <tbody class="center aligned">
    <tr>
      <td>Application</td>
      <td>News</td>
      <td>On Set</td>
      <td>QC</td>
      <td>Localization</td>
      <td>Avails</td>
    </tr>
    <tr>
      <td>Common<br>Interchange<br>Formats</td>
      <td>NewsML<br>NinJS<br>arbitrary <code>.xls</code></td>
      <td>Cooke Lens<br>Arri Lens<br>Custom Telemetry</td>
      <td>qc.ebu.io<br>Venera xml<br>custom csv</td>
      <td>imf<br>ttml<br>webVTT</td>
      <td>Movielabs<br>custom json<br>custom csv</td>
    </tr>
  </tbody>
</table>

Today, most systems in each of these segments have to convert between the
formats they are likely to see. Each format converter will have its own
eclectic mix of behaviors because the code for these convertors is often a
custom integration/plugin by the MAM or Playout or Editor vendor. This results
in lots of effort being wasted just to interchange metadata between systems in
a reliable format.

{{< sitelinks >}}
{{< /f/block >}}

{{< f/block
  id    = "live"
>}}

### Transport makes things worse

For each and every data format of the metadata, there is often a custom
protocol or signalling mechanism to identify the metadata. You'll often find
that a simple piece of metadata will have different signalling in different
file formats or on different networks, despite the fact that **IT'S AN
IDENTICAL XML**.

If you're not familiar with this problem, just find an engineer who's
implemented an interoperable subtitling transport system, then buy them a drink
and ask <span class="ui blue text">"_Sounds like moving a few bytes per frame
is pretty easy, isn't it?_"</span> then sit back and enjoy the show for the
next hour or two while they let off steam.

<table class="ui celled definition table">
  <thead class="center aligned">
    <tr>
    <th>&nbsp;</th>
    <th>Live<br>Production</th>
    <th>Virtual<br>Production</th>
    <th>Post<br>Production</th>
    <th>Distribution</th>
    <th>Distribution</th>
    </tr>
    </thead>
  <tbody class="center aligned">
    <tr>
      <td>Application</td>
      <td>News</td>
      <td>On Set</td>
      <td>QC</td>
      <td>Localization</td>
      <td>Avails</td>
    </tr>
    <tr>
      <td>Common<br>Transports</td>
      <td>API<br>NDI<br>SDI<br>ST 2110</td>
      <td>API<br>ZiXi<br>SRT<br>ST 2110</td>
      <td>file xfer<br>API<br>embedded</td>
      <td>embedded<br>QT<br>imf</td>
      <td>api<br>email<br>carrier pigeon</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="5"> To get an idea of how much this costs, multiply the
      number of products in each segment by the number of protocols and the
      number of file formats and then take some arbitrary engineering cost for
      20 weeks of engineering (8 for sending metadata, 8 for receiving and 4
      for ongoing version upgrades and support). I've called this the (very
      rough) <em>integration factor</em> below and, yes, I've ignored volume
      of transactions.
      </td>
    </tr>
    <tr>
      <td><em>Integration Factor</em></td>
      <td><span class="ui header text">36</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">36</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">20</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">30</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">40</span><span class="ui violet text"> rif</span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="5"><span class="ui violet text"> rif</span><small> = relative
        integration factor - A rough comparative measure of the
        metadata integration effort in each segment</small>
      </td>
    </tr>
  </tbody>
</table>

**<span class="ui red header text">There must be a better way!</span>**

{{< sitelinks >}}
{{< /f/block >}}

{{< f/block
  id    = "live"
>}}

### Compare with {{% metarex %}}

The {{% metarex %}} framework requires someone to register meta-meta-data that
allows a decoding device to say <span class="ui blue text">"_Aha, there is
NinJS in the MetaRex container_"</span>. It allows a network interface to say
<span class="ui blue text">"_Aha, I know how to put MetaRex containers on my
network_"</span>.

The {{% metarex %}} framework also allows transformers to be registered that
can perform a canonical conversion from format A to format B (and possibly
charge for it), so if your application receives NewsML but needs NinJS then you
can write your own or try a 3rd party one BEFORE YOU WRITE CODE.

The integration factor for {{% metarex %}} is simply the number of base formats
& networks added together rather than being multiplied together and then
multiplied by all the implementations.

<table class="ui celled definition table">
  <thead class="center aligned">
    <tr>
    <th>&nbsp;</th>
    <th>Live<br>Production</th>
    <th>Virtual<br>Production</th>
    <th>Post<br>Production</th>
    <th>Distribution</th>
    <th>Distribution</th>
    </tr>
    </thead>
  <tbody class="center aligned">
    <tr>
      <td>Application</td>
      <td>News</td>
      <td>On Set</td>
      <td>QC</td>
      <td>Localization</td>
      <td>Avails</td>
    </tr>
    <tr>
      <td>Today's<br>Workflows</td>
      <td><span class="ui header text">36</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">36</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">20</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">30</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui header text">40</span><span class="ui violet text"> rif</span></td>
    </tr>
    <tr>
      <td>Tomorrow With<br>MetaRex</td>
      <td><span class="ui green header text">7</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui green header text">7</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui green header text">6</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui green header text">6</span><span class="ui violet text"> rif</span></td>
      <td><span class="ui green header text">7</span><span class="ui violet text"> rif</span></td>
    </tr>  </tbody>
</table>

I've tweaked the non-{{% metarex %}} number to compensate for the range
of products available in each segment.

What I've not included in the numbers is how {{% metarex %}} can give an almost
GitHub-like robustness to versioning and updating metadata flow. That's for a
future study.

{{< sitelinks >}}
{{< /f/block >}}

{{< f/block
  id    = "live"
>}}

### So who benefits?

**<span class="ui red header text">Everyone Benefits!</span>**

{{% metarex %}} enables a generic metadata supply chain with the rigour that we
are starting to develop with video and audio.

* **Content Creators** can now track and convert metadata from camera to screen
* **Product Vendors** can now integrate more metadata types for less initial
  and significantly less engineering costs
* **Data Warehousing** can benefit by integrating disparate timeline metadata
  with the same ease as static metadata
* **Metadata Producers** can benefit with greater access to more networks and
  file formats with no extra effort
* **Metadata Consumers** can benefit by simultaneously managing and using
  multiple transformed variants of source metadata without increasing costs
* **The Industry** can benefit by spending the money saved by {{% metarex %}}
  on creating rich, metadata driven workflows instead of just leaving the
  metadata on the floor
* **The planet** might benefit if we spent microWatts of energy remembering the
  source metadata rather than spending kiloWatts of energy guessing what was
  lost by using an AI algorithm

The {{% metarex %}} project needs **you!**
Please become a [backer][3] - We're offering a
10% discount until April 30th 2024. We will happily shout your company's name
across the globe if you can help us get the project over the finish line.

Don't forget to come and see us at NAB 2024 on the [Signiant][1] booth
[W.1931][2]

[1]: https://signiant.com/
[2]: https://nab24.mapyourshow.com/8_0/floorplan/?hallID=W&selectedBooth=W1931
[3]: /backers/

{{< sitelinks >}}
{{< /f/block >}}
