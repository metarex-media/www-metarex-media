# 6. MXF Live Descriptive Metadata

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

## 6.1 Header Metadata Mapping

Files adhering to this specification shall be compliant with the MXF Live
specification, the MXF generic container and OP 1a as defined in SMPTE ST
377-1:2011, SMPTE ST 379-2:2010 and SMPTE ST 378:2004, respectively.

An additional static descriptive metadata track is added to the header metadata.
The descriptive metadata framework is of type "MXF Live Streaming Descriptive
Metadata" which is further described in this document. As such, the framework is
referenced in the Preface Set while the track itself is referenced in the
Material Package (Figure 1)

{{% f/image "/img/doc/mxf-live-fig-1.png" "MXF Live" "ui centered large image" %}}

{{% d/caption "Linkage of MXF Live DM Track in MXF Header Data" "figure" %}}

The new keys and labels used for the descriptive metadata are taken from ARRI
private space. Table 1 shows the scheme applied to make up the keys within ARRI
private space whereas Table 2 lists the actual keys relevant for this
specification. The definition of the MXF Live Streaming Descriptive Metadata Set
is in Section Table 3.

<a id='6-2'></a>

## 6.2 UL Keys used for Coding

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

{{% d/caption "2 - UL Key Definitions for this Specification (multi-byte values in network order)" "table" %}}

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

{{% d/caption "3 -- Items to be used in the MXF Live Streaming Specific Descriptive Metadata Set" "table" %}}

**Note:** These keys are preliminary keys to be used during experimental
state; they are subject to change without notice.

<a id='6-3'></a>

## 6.3 Specification of Sets, Descriptors and Properties

<a id='6-3-1'></a>

### 6.3.1 MXF Live Streaming Specific Descriptive Metadata Framework Set

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
