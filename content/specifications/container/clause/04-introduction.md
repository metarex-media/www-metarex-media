---
title: "Test"
---
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
