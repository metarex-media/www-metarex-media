# Considerations

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
