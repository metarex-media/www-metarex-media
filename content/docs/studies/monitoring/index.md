---
title:     Live Production Monitoring
linkTitle: Live Production Monitoring
date:     2025-02-24
---

{{% fo
    t = "image"
    src = "monitoring-generic.svg"
    alt = "Generic monitoring flow"
    header = "Figure 1"
    text = "Generic monitoring flow  for a live event"
 /%}}


In a live event there are are many links involved between getting the action
to the viewers with minimal delay. 4 decades ago, there was only one type of
unreliable network (analogue) and very few vendors. An end-to-end, live, signal
integrity system was almost always used to ensure success. Inevitably, it was
backed up with a traditional telephone line and a bellowing "All right leaving
me" when downstream issues appeared.

Today, there are many more hops the signal needs to take with different network
architectures, compression schemes and companies between the event and the
viewer. There are companies measuring quality of experience at the viewer and
some elements of closed loop measurement on some links, but it's hard to
get end-to-end data.

MetaRex takes a novel approach to the problem where we aim to provide
resilience across multiple networks and to give the vendors and operators a
chance to cooperate whilst maintaining control of their own data when needed.

The solution works like this

1. An operator or vendor publishes the schema for their metadata via
   {{%metarex%}}. The simplest form of this is to register a `metarexId` for a
   proprietary measurement document. For example, an instance document might
   look like this:

   ```json
   {
     "metarexId": "0194f1a2-61a0-7cc1-841b-b5b33524845c",
     "documentId": "0194f1ba-2374-7ea8-8f19-2fcaccad0309",
     "sourceId": "0194f1a3-1edb-7743-a611-bd5d64624a86",
     "timestamp": 3948210217,
     "status": "fail"
   }
   ```

   A real example would be more sophisticated, but this document shows a
   `metarexID` that could be looked up in the register.
2. Now we know the format of a document, let's use it to forward a measurement
   of the link between the Production and the Broadcaster (`linkPB`) for every
   frame (or packet or time-unit) of the signal.
3. Inside the measurement equipment, a document is generated and transmitted in
   one of 3 mechanisms:
   * **in-band** - the document is placed in a {{%metarex%}} envelope and carried
      in-band via the av network. We plan to complete and test generic mappings
      for:
      * ST 2110
      * SRT
      * Transport Stream
      * NDI
      * SDI
      * MP4
      * any other media transport a sponsor requires
   * **out-of-band** - the document it posted or streamed out-of-band to a
       data store (ranging from s3 bucket to snowflake)
   * **hybrid** - to hard-lock sync (rather than infer sync), a signature of
       the document is embedded in-band (e.g. in VANC of SDI) and the actual
       document is posted to a data store
4. Great! We now have a reliable transfer mechanism for this link.
5. At the broadcaster we can receive a stream of documents. The problem is,
   a different vendor is listening and they don't know the format of our
   document (yet)
6. Let's make 2 assumptions:

   * The listening equipment is {{%metarex%}}
   * The sender used the most complex case (hybrid SDI)

7. The listening equipment detects a VANC packet carrying 2 string values.

   * The DID, SDID and UDW identify the packet as a {{%metarex%}} packet
   * The first string values is a temporary metarexId that in turn identifies
     the recovery method for the data documents and any authentication needed.
   * The second string value is the signature of a document in the store.

8. After authentication, the received documents can be inspected and indexed
   by timestamp value. Assuming the timestamp has sufficient accuracy, the
   documents can be aligned with the video frames as close to real time as
   network & storage latencies allow.

9. Despite the fact this is a new document, it can be displayed or loaded into
   tools like grafana / snowflake with no knowledge of the nature of the data.

10. A kindly sender of the data will also publish web services in the metarex
   register that would allow translation of the document to other vendors
   formats or to expand the document to a format that analysis engine find
   easier to process.

Repeating the process at every link of the chain allows multiple vendors to
exchange and communicate status and measurement data down the chain using
standard IT web services. The slow elements (caching metarexIDs,  authentication
warming up serverless API functions) can be done in advance of the event. This
allows speedy processing of the workflows.

### Status 2025-02-24

Most of the components exist to trial this workflow:

* a readable online register
* an envelope specification
* golang code for inserting and extracting documents from the envelope
* a specification for service representation in the register
* a [prototype register][reg]

We are looking for supporters to turn this into a real Proof Of Concept in
two phases:

1. Q1/Q2 20205 - optimise the {{%metarex%}} software into a `mrx-worker`
   module for a vendors sending and listening equipment. This will involve
   creating, registering and testing a proprietary document format in a
   simulated or real network.
2. Deploying the test system at a real event.

We estimate about 4 weeks of engineering for each phase.

<div class="ui container">
{{% fo
   t = "image"
   src = "mrx-worker2.svg"
   srcClass = "ui fluid image"
   alt = "mrx-worker"
   text = "Metarex Worker structure"
   header = "Figure 2"
/%}}
</div>
[reg]: {{% relref "/app/reg/" %}}
