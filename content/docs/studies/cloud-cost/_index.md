---
title:       C3 - Cloud Cost Comparator
linkTitle:   C3 - Cloud Cost Comparator
date:        2025-07-10
description: How metarex can build an API to cost your running cloud
---
<!-- markdownlint-disable MD033 -->
<span class="ui grey text"><i class="chevron circle right icon"></i>|</span>
[C3]({{% relref "index.md" %}}) |
[c3-tool]({{% relref "#tool" %}}) |
[testing]({{% relref "testing" %}}) |

```mermaid
flowchart TD
%% Nodes
    A("🛠️ Spawn a Cloud System")
    D["▶️ Run in different modes"]
    B[("🖥️ Model in mrx-COST")]
    C("🕵🏻 Trace with Open Telemetry (OTEL)")
    E("📏 Apply OTEL data to metarex model")
    F("🗜️ normalize AWS pricing ⇒ mrx-COST")
    G("💰 Get real-time costs")

%% Edge connections between nodes
    A --> B 
    B -.-> E
    A --> C
    C -.-> D
    A --> D
    D --> E
    F -.-> B
    E ==> G

%% Individual node styling. Try the visual editor toolbar for easier styling!
    style B color:#000, fill:#b5d690, stroke:#4F702A
    style C color:#000, fill:#b5d690, stroke:#4F702A
    style G color:#FFFFFF, stroke:#00C853, fill:#00C853

%% You can add notes with two "%" signs in a row!
```

#### We're proposing a simple paradigm <a id="testing"></a>

* A minimal, cloud-independent model of the major cloud cost points
  * e.g. EC2 type
  * NAT Gateway boundaries for traffic
  * storage types
  * dB
* A normalization tool to import real-time pricing data to the model
* A normalization tool to import real-time energy mix data to the model
* A `middleware` approach to integrate [`opentelemetry.io`](https://opentelemetry.io)
* A [grafana-friendly](https://grafana.com/) output format

We are looking for supporters to turn this into a real Proof Of Concept in
two phases:

1. Q3/Q4 2025 - optimise the {{%metarex%}} worker and build a normalizer for
   AWS to be demonstrated at IBC 2025.
2. Q1/Q2 Deploying the test system in a real environment and improve the model.

We estimate about 10 weeks of engineering for each phase and are looking for
collaborators who might find 1 or more weeks of engineering @ £1000/wk.


#### Try it out <a id="c3-tool"></a>

The [mrx-c3-tool repo][c3] is a self contained test environment for comparing the costs of workflow on different cloud
platforms. You can download it and run it with your own cloud accounts.

**Current status:**

* Command line bash script control
   * `bash c3.sh setup` check for prerequisite tooling, tokens and authentication
   * `bash c3.sh terraform ga dev` terraform a group A Amazon EKS cluster running the pod under test
   * `bash c3.sh test ga dev` run tests on the cluster to ensure it meets the desired test conditions
   * `bash c3.sh deploy ga dev` deploy the applications and pod under test
   * `bash c3.sh test ga dev` run tests on the cluster to ensure a consistent state to allow a testrun
   * `bash c3.sh testrun ga dev` start a testrun and log data to the database
   * `bash c3.sh destroy ga dev` detroy applications and remove all traces of the EKS cluster
* Test groups created:
   * `ga` Amazon EKS
   * `gr` Rancher K3s running on Amazon EC2
* Cluster types:
    * `dev` ephemeral smaller/less redundant clusters to get the framework parameters right
    * `test` ephemeral smaller/less redundant clusters to get the test command & Grafana graphs working
    * `stage` ephemeral full size/security/redundant clusters approve test methodology
    * `prod` smaller/less redundant clusters to get the framework parameters right
   


[c3]: https://github.com/metarex-media/mrx-c3-tool