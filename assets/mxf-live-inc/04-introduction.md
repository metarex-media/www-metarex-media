# 4. Introduction

From beginning MXF (SMPTE ST 377-1) was designed as a file format as well as a
streaming format. MXF's structure, based on KLV elements (SMPTE ST 336),
provides high flexibility and extensibility. Modern IP networks provides the
bandwidth to transport professional media data.

Flexibility in meta data carriage is the advantage of MXF Live over any other
streaming solution.

A low latency streaming MXF format is already specified in SMPTE ST 2049. The
_MXF Live_ streaming specification adds extra constraints to enable a receiver
of such an MXF stream to start processing or capturing it from any stream
position/time, not just from the beginning of the stream.

Purpose is not only to stream MXF Live from Audio/Video devices but also from
any other equipment, be it for example meta data from camera trackers, lighting
equipment or directors and script comments in an on scene scenario.

A receiver of MXF Live stream may store the streams separately or merge tracks
from multiple MXF Live streams into a single MXF file or a new MXF Live stream
for further transmission. All on scene generated meta data is preserved
centrally.

On scenarios with multiple stream sources, one MXF Live stream, typically a
video stream, has to be the master or primary stream. All other streams share
the same time base.

MXF Live streams may contain meta data to control recording to file on a
receiver side.

The IP layer used for streaming is not in the scope of this document and subject
of the user's implementation requirements. Any protocol, from simple UDP up to
RTP and ST 2110 is suitable
