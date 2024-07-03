---
title:     Container Specification
linkTitle: Container Spec.
date:      2024-07-03
weight:    20
description: >
  Work in progress container specification.
notes: >
  The implementation of the specification on GitHub is usually ahead of the one
  published on the website. Please file issues on GitHub.
params:
   docTitle: "Metarex Container Specification"
   version:  0.5.0
   author:   Devlin
   note:     Update to match NAB 2024 demos
   history:
   - version: 2023-07-27
     author:  Devlin
     note:    Revised structure to match mrx-tool
   - version: 2019-10-23
     author:  Neumann
     note:    MXF-Live final version
---
<!-- markdownlint-disable MD025 -->

{{< techDocBanner >}}

<!-- markdownlint-disable MD051 (link fragment check) -->

{{< techDocHistory >}}

## Table of Contents <small><small>[Version {{% param version %}}](#version) ([History](#version-history))</small></small>

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

{{% H/resetAutoNumbering %}}
{{% H/anchor "scope" %}}

# {{% H/1 %}} Scope

This document specifies constraints for an MXF Live Streaming format and a
method for mapping of metadata related to MXF Live streaming into a DM Framework
static track within an MXF Generic Container.

# {{% H/1 %}}  Conformance Notation

Normative text is text that describes elements of the design that are
indispensable or contains the conformance language keywords: "**shall**",
"**should**", or "**may**". Informative text is text that is potentially helpful
to the user, but not indispensable, and can be removed, changed, or added
editorially without affecting interoperability. Informative text does not
contain any conformance keywords.

All text in this document is, by default, normative, except: Introduction, any
section explicitly labeled as "Informative" or individual paragraphs that start
with "Note:"

The keywords "**shall**" and "**shall not**" indicate requirements strictly to
be followed in order to conform to the document and from which no deviation is
permitted.

The keywords, "**should**" and "**should not**" indicate that, among several
possibilities, one is recommended as particularly suitable, without mentioning
or excluding others; or that a certain course of action is preferred but not
necessarily required; or that (in the negative form) a certain possibility or
course of action is deprecated but not prohibited.

The keywords "**may**" and "**need not**" indicate courses of action permissible
within the limits of the document.

The keyword "**reserved**" indicates a provision that is not defined at this
time, shall not be used, and may be defined in the future. The keyword
"**forbidden**" indicates "**reserved**" and in addition indicates that the
provision will never be defined in the future.

A conformant implementation according to this document is one that includes all
mandatory provisions ("shall") and, if implemented, all recommended provisions
("should") as described. A conformant implementation need not implement optional
provisions ("may") and need not implement them as described.

Unless otherwise specified, the order of precedence of the types of normative
information in this document shall be as follows: Normative prose shall be the
authoritative definition; Tables shall be next; followed by formal languages;
then figures; and then any other language forms.

# {{% H/1 %}}  Normative References

The following standards contain provisions which, through reference in this
text, constitute provisions of this recommended practice. At the time of
publication, the editions indicated were valid. All standards are subject to
revision, and parties to agreements based on this recommended practice are
encouraged to investigate the possibility of applying the most recent edition of
the standards indicated below.

- SMPTE ST 377-1:2011 -- Material Exchange Format (MXF) -- File Format
Specification
- SMPTE ST 378:2004 -- Material Exchange Format (MXF) -- Operational Pattern 1a
- SMPTE ST 379-2:2010 -- Material Exchange Format (MXF) -- MXF Generic Container
- SMPTE ST 2049:2012 - Low Latency Streaming MXF Op1a
- SMPTE ST 326:2000 -- SDTI Content Package Format (SDTI-CP)
- SMPTE ST 331:2011 -- Element and Metadata Definitions for the SDTI-CP
- SMPTE ST 382:2007 -- Material Exchange Format (MXF) -- Mapping AES3 and
Broadcast Wave Audio into the MXF Generic Container
- SMPTE ST 384:2005 -- Material Exchange Format (MXF) -- Mapping of Uncompressed
Pictures into the Generic Container
- SMPTE ST 385:2004 -- Material Exchange Format (MXF) -- Mapping SDTI-CP Essence
and Metadata into the MXF Generic Container
- SMPTE ST 394:2006 -- Material Exchange Format (MXF) -- System Scheme 1 for the
  MXF Generic Container
- SMPTE ST 405:2006 -- Material Exchange Format (MXF) -- Elements and Individual
Data Items for the MXF Generic Container System Scheme 1
- SMPTE RDD 18:2012 -- Acquisition Metadata Sets for Video Camera Parameters
- SMPTE RP 210v13:2012 -- Metadata Dictionary Registry of Metadata Element
Descriptions
- SMPTE RP 224v12:2011 -- SMPTE Labels Register
- SMPTE RP 2057:2011 -- Text-Based Metadata Carriage in MXF
- SMPTE EG 42:2004 Material Exchange Format (MXF) -- MXF Descriptive
Metadata

# {{% H/1 %}} Introduction (informative)

The Metarex Container is designed to enable metadata to flow in media networks
and workflows. This means it has to be able to carry the following:

* Metadata with **_no timing_** information e.g. cast list.
* Metadata with **_embedded timing_** information like a Subtitle file.
* Metadata with **_timed by the container_** like the frame based XML documents
  found in Dolby Vision™

To make the framework beneficial, the metadata must be self describing. This is
done by assigning a `metarexId` that can then be used by tools to find
specifications, schemas, services and other properties to allow automatic
processing.

To simplify transport, the file needs the following properties:

* Each instance of a container needs a consistent Unique Id
* The container must be able to encapsulate one or more metarex containers
* The container must allow precise timekeeping, especially when metadata clocks
  are independent of video and audio clocks
* The container must be able to carry several ordered sequences of text files
* The container must be able to carry several ordered sequences of binary blobs
* A networked stream should be serializable as a file with minimal processing
* A file should be streamable on a network with minimal processing

With those properties moving data from one network type to another (e.g. from
NDI to ST 2110) becomes a simple mapping of the container. No need for protocol
change, and the metarexId can be used by firewalls for allow / deny lists.

# {{% H/1 %}}  Implementation

<a id="5-1"></a>

## {{% H/2 %}} MXF Live Encoder

<a id="5-1-1"></a>

### {{% H/3 %}} Basic Stream Structure Constraints

SMPTE ST 2049 already defines a low latency MXF streaming. Based on this and
additional constraints the general rules for an MXF Live stream are:

-   Operational Pattern 1A.
-   Duration values in Header Metadata shall be -1 except for the repeated
    header meta data in a footer partition. (On a stream captured to disk a
    receiver may update the initial header meta data however)
-   The stream shall be segmented into multiple Body Partitions for any kind of
    essence, be it variable or constant edit unit size.
-   Segment durations shall be from 1 to 60 seconds configurable in a
    granularity of \~1 second. In case the edit rate does not allow to divide
    the segment duration into an integer count of edit units the segment
    duration shall be as close as possible to the desired duration.
-   Essence Body Partitions, except the first one, shall be preceded by a Body
    Partition which contains the repeated header metadata. The header meta data
    may contain updated descriptive meta data objects. Repeated header metadata
    allow a decoder/receiver to join the stream at any segment.
-   Each Essence Body Partition shall be followed by a Body Partition with an
    Index Table segment indexing the previous essence body partition. This is
    mandatory also for simple index tables for constant edit unit size.
-   The Timecode Track in the repeated header meta data shall have a start time
    code value which matches the initial start timecode plus the essence
    elements count of all previous partitions to allow instant access. This
    allows a receiver that starts capturing on the fly to get an actual time
    code.
-   Header meta data shall carry a static descriptive meta data object which
    contains MXF Live related meta data as described in chapter 6. The MXF Live
    related meta data contents may vary in the repeated header meta data for
    example to signal the start of a segment of interest.
-   For Long GOP Video essence, the Body Partitions shall start at GOP
    Boundaries.
-   The Footer Partition shall repeat all index table segments and contain a
    RIP.
-   The Footer Partition shall repeat the header meta data but updated with
    final duration values. The Timecode track in that final repeated header meta
    data shall have the initial start value again.

<a id="5-1-2"></a>

### {{% H/3 %}} MXF Live Streaming Modes

Different streaming modes and additional control signals allow a variety of use
cases, including a remote control of an MXF Live receiver. Streaming modes and
various control flags are signaled in static descriptive metadata (DM) objects
which shall be carried in the repeated header metadata. The layout of those DM
objects is specified later in chapter 6.

-   **Continuous Streaming Mode**<br>
    A device streams from power on to power off. The stream is starting with a
    header partition and ends with a footer partition.<br>
    In some case header and footer partition may be omitted, e.g. when it is
    intended that a receiver joins the stream on the fly or is merging multiple
    MXF Live streams which causes a re-multiplexing.
-   **Continuous Segmented Streaming Mode**<br>
    A device streams continuously from power on to power off, starting with a
    header partition, but on a certain event it finalizes the current MXF stream
    with a footer partition. It then starts a new stream beginning with a header
    partition again which grows until the next event.<br>
    <br>
    An event can for example be a camera's REC START and REC STOP.<br>
    <br>
    A header partition shall carry a static meta data object as specified in
    chapter 6 which signals SEGMENT OF INTEREST among other live stream related
    meta data. Such signal can advise a specialized receiver which listens and
    monitors to capture this stream segment.
-   **Intermittent Segmented Streaming mode (Record only mode)**<br>
    <br>A device streams only for a certain time, then there may be a break
    until the next segment is started. All segments may be segments of
    interest.<br>
    e.g. a camera streams from REC START to REC STOP.

In the scope of a receiver which continuously listens, this is very similar to
the Continuous Segmented Mode. It may not be able to distinguish between the two
modes. Therefore, also in this mode a stream meta data object shall signal
SEGMENT OF INTEREST to trigger the capturing of segments on a specialized
receiver.

Typically, only a primary MXF Live stream, e.g. from a camera, may stream in
segmented mode. If secondary MXF Live streams are segmented, segmentation shall
be synchronized with the primary stream at the receiver side.

<a id="5-1-3"></a>

### {{% H/3 %}} Multiple linked MXF Live streams {{% H/4 %}} | {{% H/4 %}}

On Set, multiple MXF Live streams may be transmitted from different sources, to
be gathered at a central receiver. In such scenario one stream, typically from a
video source, shall be the master stream, ruling streaming mode and Segment of
Interest flags. The master stream is signaled in the MXF Live related DM. All
streams must share the same timecode. All streams must use the same edit rate.

<a id="5-2"></a>

## {{% H/2 %}} MXF Live Decoder/Receiver {{% H/4 %}}

<a id="5-2-1"></a>

### {{% H/3 %}}  Receiver for Continuous Stream

A receiver which shall capture and process an incoming continuous stream from
beginning (Header partition) to the end (RIP) can be simple. Capturing to file
is a simple dump.<br>
<br>
However, the structure of an MXF Live stream allows a decoder to start to
decode, demultiplex or record the stream on the fly from any position or time
only limited by the granularity of the partition duration. When a Body Partition
with repeated header meta data has been received, all necessary information to
further interpret and process the incoming KLV containers is available.<br>
<br>
A receiver that joins a stream later than at the beginning and which wants to
store the MXF stream to file must reflag/remap that first body partition to a
Header partition and write it out, followed by all further KLV packets.
Furthermore it may be necessary to remap index tables to match the index start
values and offsets.<br>
If a receiver that wants to stop capturing and writing while the stream is still
continuing, it shall stop capturing after having received the completed body
partition with the index segment of the previous essence body partition or
discard any incomplete index partition. It shall then create a footer partition
with all received index table segments and updated header meta data.<br>
In a special case creation of a footer partition may be omitted and thus the
file will be left in a 'growing' state if the decoders which shall later parse
such file are able to handle growing files.<br>
<br>
Alternatively a receiver may re-multiplex the incoming MXF Live stream into a
new stream or file.<br>
In case a receiver is merging multiple incoming MXF Live streams it would have
to re-multiplex them all into a single stream anyway.

<a id="5-2-2"></a>

### {{% H/3 %}}  Receiver for Continuous Segmented Stream and Intermittent Segmented Stream

A simple Receiver which listens to and monitors segmented streams and also shall
capture segments to file must start a new file for each segment, triggered by
the appearance of a header partition.

A specialized receiver shall be able to read and interpret the static MXF Live
descriptive meta data object present in the header partition of a segment in
order know which segment is of interest and which shall be captured to file or
be streamed further on or be treated differently in any other way.

If multiple MXF Live streams are to be merged, the primary stream rules the
segment of interest. Secondary streams may be unsegmented.

A receiver may also be configured to ignore segment boundaries and further
process all segments as a continuous stream

# {{% H/1 %}}  MXF Live Descriptive Metadata

For streaming MXF content, an easy transition between streaming media and
file-based storage is desired while keeping flexibility for different scenarios.
Most MXF structural metadata can be used for both stream and file without
modification while additional data may be useful to ease handling at the
boundaries, i.e. in the stream transmitter and receiver.

`Note`: The UL keys used for description and coding of data are being taken from
ARRI private space. While trying to establish a consistent assignment of keys
within this private area, we may have failed at some point or the other. Any
comments to improve consistency are welcome.

<a id='6-1'></a>

## {{% H/2 %}} Header Metadata Mapping

Files adhering to this specification shall be compliant with the MXF Live
specification, the MXF generic container and OP 1a as defined in SMPTE ST
377-1:2011, SMPTE ST 379-2:2010 and SMPTE ST 378:2004, respectively.

An additional static descriptive metadata track is added to the header metadata.
The descriptive metadata framework is of type "MXF Live Streaming Descriptive
Metadata" which is further described in this document. As such, the framework is
referenced in the Preface Set while the track itself is referenced in the
Material Package (Figure 1)

{{% f/image "/img/doc/mxf-live-fig-1.png" "MXF Live" "ui centered large image" %}}

{{% o/caption "Linkage of MXF Live DM Track in MXF Header Data" "figure" %}}

The new keys and labels used for the descriptive metadata are taken from ARRI
private space. Table 1 shows the scheme applied to make up the keys within ARRI
private space whereas Table 2 lists the actual keys relevant for this
specification. The definition of the MXF Live Streaming Descriptive Metadata Set
is in Section Table 3.

<a id='6-2'></a>

## {{% H/2 %}} Keys used for Coding

| **Byte No.**  | **Description**                         | **Value (hex)**   | **Meaning**               |
|---------------|-------------------------                |-------------------|-----------------------    |
| 1-4           | SMPTE UL Designator                     | `0x060E2B34`      |                           |
| 5-8           | Category, Registry, Structure & Version |                   |   as in ST 0336:2007      |
| 9,10          | 0E.17 (ARRI private range)              |                   |                           |
| 11            | Item Type Identifier<br>(resembling Byte 9 of SMPTE 359M) | `01`<br>`02`<br>`03`<br>`04`<br>`05`<br>`06`<br>`07`<br>`0C` | `-`Identifiers & Locators<br>`-`Administrative Group<br>`-`Interpretive Group<br>`-`Parametric Group<br>`-`Process & Processing Group<br>`-`Relational Group<br>`-`Spatio-Temporal Group<br>`-`Compound Group |
| 12            | Target Identifier                        | `00`<br>`01`<br>`02`<br>`03`<br>`04`<br>`05` |`-`General<br>`-`Picture Essence<br>`-`Sound Essence Related<br>`-`Data Essence Related<br>`-`Metadata Related <br>`-`Compound (Essence) Related  |
| 13            | Further  Classification                  | `00`<br>`01`<br>`02`<br>`03`<br>`04`<br>`05` | `-`General<br>`-`Fundamental  Parameters<br>`-`Coding Characteristics<br>`-`Static Parameters<br>`-`Dynamic Parameters<br>`-`Generic Parameters (dyn. or static) |
| 14-15         | Further Classification                  |                   | Distinction within each group   |
| 16            | Index                                   | `00`              | Index in case of more than one item of the same type, e.g. multiple data streams, or distinction within group. |

{{% o/caption "2 - UL Key Definitions for this Specification (multi-byte values in network order)" "table" %}}

| Item Name                                                                |  UL Key
|--------------------------------------------------------------------      |-------------------------------------
| MXF Live Streaming Specific Descriptive Metadata Framework Label         |`urn:smpte:ul:060e2b34.0401010d.0e170404.01010201`
| MXF Live Streaming Specific Descriptive  Metadata Framework Set          |`urn:smpte:ul:060e2b34.0253010d.0e170104.01010201`
| MXF Live Streaming Specific Descriptive Metadata Set (not used any more) |`urn:smpte:ul060e2b34.0253010d.0e170104.01030201`
| MXF Live Streaming KLV Object Reference  (not needed any more)           |`urn:smpte:ul060e2b34.0101010d.0e170604.01010301`
| MXF Live Streaming Specific Static Items                                 |`urn:smpte:ul060e2b34.0101010d.0e170104.03010000`
| MXF Live Segment of Interest Flag                                        |`urn:smpte:ul060e2b34.0101010d.0e170104.03010101`
| MXF Live Stream Generation Index                                         |`urn:smpte:ul60e2b34.0101010d.0e170104.03010102`
| MXF Live Primary (Master) Stream Flag                                    |`urn:smpte:ul060e2b34.0101010d.0e170104.03010103`
| MXF Live Streaming Mode                                                  |`urn:smpte:ul060e2b34.0101010d.0e170104.03010104`

{{% o/caption "3 -- Items to be used in the MXF Live Streaming Specific Descriptive Metadata Set" "table" %}}

**Note:** These keys are preliminary keys to be used during experimental
state; they are subject to change without notice.

<a id='6-3'></a>

## {{% H/2 %}} Specification of Sets, Descriptors and Properties

<a id='6-3-1'></a>

### {{% H/3 %}}  MXF Live Streaming Specific Descriptive Metadata Framework Set

The MXF Live Streaming Specific Descriptive Metadata Set groups all items
relevant to streaming. It shall be coded as a local set using 2-byte tags and
2-byte length fields.

| Item Name                                                       | Type      | Len  | Local Tag   | Req?| Meaning            |
|-----------------------------------------------------------------|-----------|------|-------------|-----|------------------|
| MXF Live  Streaming Specific Descriptive Metadata Framework Set | Set Key   | 16   | {table 2}   | Req | `urn:smpte:ul:060e2b34.0253010d.0e170104.01010201` set key to identify MXF Live Streaming DM Framework |
| Length                                                          | BER Length| var. |             | Req  | Set Length (see ST 377-1) |
| Instance UID                                                    | UUID      | 16   | `3C.0A`     | Req  | (see SMPTE ST 377-1)  |
| Segment of Interest Flag                                        | Boolean   | 1    | dynamic     | Opt  | `urn:smpte:ul:060e2b34.0101010d.0e170104.03010101` Flag signaling whether the current stream segment is intended for recording (wording TBD). When set to False (0), no recording is desired. When set to true (1), the stream shall be captured, i.e. written to a file on storage media
| Stream Generation Index                                         | UInt32    | 4    | dynamic     | Opt  | `urn:smpte:ul:060e2b34.0101010d.0e170104.03010102` Index indicating whether this is a primary stream (originating from a capture device) or has already been processed.<br>When transmitted by a capture device, the value shall be set to 0; when transmitted from a file, the value shall be set to 1.  Whenever an application receives a stream and re-transmits it without storage, the value shall be
 incremented by 1.|
| Primary (Master) Stream Flag                                     | Boolean   | 1    | dynamic     | Opt  | `urn:smpte:ul:060e2b34.0101010d.0e170104.03010103` Flag set in the stream by the upstream controller receiver behavior.|
| Streaming                                                        | UInt8     | 1    | dynamic     | Opt  |`urn:smpte:ul:060e2b34.0101010d.0e170104.03010104` Control to enable user-defined or remote-controlled (by sender) capture.  In continuous mode, a user can select which part to capture while in segmented modes, the receiver is  controlled by "`Segment of Interest Flag`".<br> `0`: Continuous Streaming Mode<br>`1`: Continuous Segmented Streaming Mode<br>`2`: Intermittent  Segmented Streaming Mode

# {{% H/1 %}} User Metadata

As mentioned in the introduction, meta data is an important factor of MXF Live.
All meta data shall always be available together with the A/V data immediately.

Therefore, static meta data tracks in the header partition shall be avoided as
they would not be recognized by a receiver which joins a stream on the fly. If
the data amount that such static tracks carry, it may be considered to copy this
in the body partitions with the repeated header meta data. However, overhead
caused by the header meta data repetition shall be kept as low as possible.

Instead any meta data shall be carried in data essence tracks. An example is
SMPTE RDD-18 meta data in ANC data tracks. But the MXF Live group discussed to
get rid of the ANC layer and recommends to carry RDD-18 meta data in data frame
KLV packets directly only.

There is further discussion about RDD-18 UDAM extensions for additional
equipment meta data. A proposal for a UDAM extension for camera tracking
metadata is available and was used in MXF Live demonstrations.

Other varieties of meta data description such as RDD-47 frame-wrapped xml meta
data seem to be suitable.

Generally, definitions for meta data carriage will not affect the MXF Live
specification directly but constraints or recommendations to use a specific meta
data wrapping style for specific kind of meta data may be added.

# {{% H/1 %}} Considerations

It needs to be discussed whether MXF Live streams which carry meta data only
need to be based on the same edit rate than the primary A/V stream as specified
in [5.1.3](#5-1-3), or whether they can be operated in lower edit rates, e.g. if
they update their data only every second anyway. For a receiver which merges the
incoming tracks from different streams then it would be necessary to repeat
metadata packets in order to match the master edit rate.

Furthermore it is discussed whether MXF Live stream format could used in IMF or
an IMF like structure which would be an alternative way to keep the whole
bouquet of On Set generated A/V and meta data together, other than
re-multiplexing the individual tracks into a single Op1a MXF file or stream.

{{% sitelinks %}}
