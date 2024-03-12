# User Metadata

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
