---
title: "MRX container specification"
linkTitle: "MRX container specification"
date: "2023-07-25"
description: >
  A derivation  of the MXF-Live specification to start the Metarex project. This
  version will be updated and edited as the project proceeds.
notes: >
  The version of the specification on GitHub is usually ahead of the one
  published on the website. Please file issues on GitHub. The markdown from
  GitHub is directly imported onto the website every time the drafting team
  approve a set of changes for release.

---
<!-- markdownlint-disable MD025 -->

# <mark>SPECIFICATION</mark>

## Version 0.3.0

**Release Date: {{% param "date" %}}**. Send comments via the [contact] form

## Authors

Bruce Devlin (Mr. MXF, metarex.media, SMPTE)

<!-- markdownlint-disable MD051 (link fragment check) -->
<a id="version"></a>
<a id="version-history"></a>

### Version History

|  Version     |   Author  |  Change Note
|  ----------- | --------- | -------------------------------------------------
|  2023-07-27  | Devlin    | Revised structure to match [mrx-tool]
|  2019-10-23  | Neumann   | MXF-Live final version

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
{{% include "content/docs/reference/mxf-live-inc/01-scope.md"                %}}
<a id="conformance-notation"></a>
{{% include "content/docs/reference/mxf-live-inc/02-conformance-notation.md" %}}
<a id="normative-references"></a>
{{% include "content/docs/reference/mxf-live-inc/03-normative-references.md" %}}
<a id="introduction"></a>
{{% include "content/docs/reference/mxf-live-inc/04-introduction.md" %}}
<a id="implementation"></a>
{{% include "content/docs/reference/mxf-live-inc/05-implementation.md" %}}
<a id="mxf-live-DM"></a>
{{% include "content/docs/reference/mxf-live-inc/06-descriptive-metadata.md" %}}
<a id="user-metadata"></a>
{{% include "content/docs/reference/mxf-live-inc/07-user-metadata.md" %}}
<a id="considerations"></a>
{{% include "content/docs/reference/mxf-live-inc/08-considerations.md" %}}

{{% sitelinks %}}
