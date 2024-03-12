# 5. Implementation

<a id="5-1"></a>

## 5.1. MXF Live Encoder

<a id="5-1-1"></a>

### 5.1.1 Basic Stream Structure Constraints

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

### 5.1.2 MXF Live Streaming Modes

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

### 5.1.3. Multiple linked MXF Live streams

On Set, multiple MXF Live streams may be transmitted from different sources, to
be gathered at a central receiver. In such scenario one stream, typically from a
video source, shall be the master stream, ruling streaming mode and Segment of
Interest flags. The master stream is signaled in the MXF Live related DM. All
streams must share the same timecode. All streams must use the same edit rate.

<a id="5-2"></a>

## 5.2. MXF Live Decoder/Receiver

<a id="5-2-1"></a>

### 5.2.1 Receiver for Continuous Stream

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

### 5.2.2 Receiver for Continuous Segmented Stream and Intermittent Segmented Stream

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
