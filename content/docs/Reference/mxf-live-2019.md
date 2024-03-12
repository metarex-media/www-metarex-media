---
title:       MXF-Live-2019
linkTitle:   mxf-live-2019
date:        2022-10-23
description: The original MXF-Live specification as used in the mxf-live project.
---
<!-- markdownlint-disable MD051 (link fragment check) -->
<a id="version"></a>

## Version 0.100

Date: **30 October 2019**

**Send comments to <metastream@mrmxf.com>**

| **Authors**                   |  Company      |
|-------------------------------|---------------|
| Wolfgang Wegner, Hermann Popp | ARRI GmbH     |
| Peter Neumann                 | Nablet GmbH   |
| Kevin Burrows                 | Fusion Media  |
| Bruce Devlin                  | Mr. MXF       |

<a id="version-history"></a>

### Version History

|  Version     |   Author  |  Change Note
|  ----------- | --------- | -------------------------------------------------
|  2019-01-10  | Neumann  | Initial MXF Live Streaming Spec Outline
|  2019-02-08  | Neumann  | (MXF Live Streaming Spec) Add Streaming Mode definitions
|  2019-02-15  | Wegner   | Initial Version of MXF Live DM Spec|
|  2019-02-19  | Wegner   | (MXF Live DM Spec) Integrated first comments by Peter Neumann
|  2019-04-10  | Neumann  | (MXF Live Streaming Spec) Refined Streaming Modes
|  2019-04-15  | Wegner   | (MXF Live DM Spec) Removed indirect Link to DM set, added Streaming Mode
|  2019-10-23  | Neumann  | Merged former separate MXF Live Streaming generic spec and MXF Live DM spec. Reviewed

## Table of Contents

* [Version 0.100](#version)
* [Version History](#version-history)

1. [Scope](#scope)
2. [Conformance Notation](#conformance-notation)
3. [Normative References](#normative-references)
4. [Introduction](#introduction)
5. [Implementation](#implementation)
   * [5.1 MXF Live Encoder](#5-1)
      * [5.1.1 Basic Stream Structure Constraints](#5-1-1)
      * [5.1.2 MXF Live Streaming Modes](#5-1-2)
      * [5.1.3 Multiple linked MXF Live streams](#5-1-3)
   * [5.2 MXF Live Decoder/Receiver](#5-2)
      * [5.2.1 Receiver for Continuous Stream](#5-2-1)
      * [5.2.2 Receiver for Continuous Segmented Stream and Intermittent Segmented Stream](#5-2-2)
6. [MXF Live Descriptive Metadata](#mxf-live-DM)
   * [6.1 Header Metadata Mapping](#6-1)
   * [6.2 UL Keys used for Coding](#6-2)
   * [6.3 Specification of Sets, Descriptors and Properties](#6-3)
      * [6.3.1 MXF Live Streaming Specific Descriptive Metadata Framework Set](#6-3-1)
7. [User Meta Data](#meta-data)
8. [Considerations](#considerations)

<a id="scope"></a>
{{% include ">content/assets/mxf-live-inc/01-scope.md"                %}}
<a id="conformance-notation"></a>
{{% include ">content/assets/mxf-live-inc/02-conformance-notation.md" %}}
<a id="normative-references"></a>
{{% include ">content/assets/mxf-live-inc/03-normative-references.md" %}}
<a id="introduction"></a>
{{% include ">content/assets/mxf-live-inc/04-introduction.md" %}}
<a id="implementation"></a>
{{% include ">content/assets/mxf-live-inc/05-implementation.md" %}}
<a id="mxf-live-DM"></a>
{{% include ">content/assets/mxf-live-inc/06-descriptive-metadata.md" %}}
<a id="user-metadata"></a>
{{% include ">content/assets/mxf-live-inc/07-user-metadata.md" %}}
<a id="considerations"></a>
{{% include ">content/assets/mxf-live-inc/08-considerations.md" %}}

2019-10-23
Peter Neumann
