---
title:       C3 - Testing
linkTitle:   C3 testing
date:        2025-07-07
description: How metarex can build an API to cost your running cloud
---
<!-- markdownlint-disable MD033 -->

<span class="ui grey text"><i class="chevron circle right icon"></i>|</span>
[C3]({{% relref "index.md" %}}) |
[testing]({{% relref "testing" %}}) |

The development testbed will consist of 2 different high availability Kubernetes cluster types, each running the same
kubernetes pods on different node types. Identical infrastructure (otel, metarex, prometheus, grafana) will be used to
extract, store and present the results.

* **Groups A cluster** - Amazon EKS<br>
   Using the native Amazon Kubernetes infrastructure to host the test environment - in theory, this should be the most
   controllable running on AWS
* **Group R cluster** - Rancher K3s<br>
   Designed to run with the same definitions as Group A - in theory this should be portable across platfrom so that we
   can measure a baseline infrastructure cost and isolate the executable code costs more accurately.
* TBD - GKE - Google's Kubernetes Engine for native costs
* TBD - AKS - Microsoft Azure Kubernetes Service for native costs
* TBD - ACK - Alibaba Cloud for Kubernetes native costs

I asked Claude (Anthropic Sonnet 4.0) to estimate the costs of the proposed comparison architecture

## Quick Comparison Table

| Feature | Group A (EKS) | Group R (k3s) |
|---------|---------------|---------------|
| **Management** | Fully managed control plane | Self-managed |
| **Monthly Cost** | ~$248 | ~$195 |
| **Setup Time** | ~15 minutes | ~20 minutes |
| **Control Plane HA** | AWS managed (3 AZs) | Self-managed etcd cluster |
| **Node Management** | Managed node groups | Manual EC2 instances |
| **Networking** | VPC CNI | Flannel CNI |
| **Load Balancing** | AWS LoadBalancer Service | Caddy NodePort + NLB |
| **Storage** | EBS CSI Driver | Local-path provisioner |
| **Monitoring** | CloudWatch integration | Prometheus/Grafana |
| **Upgrades** | Managed | Manual |
| **Scalability** | Auto-scaling groups | Manual scaling |
| **Complexity** | Medium | Low |

## Architecture Comparison

### Group A (EKS) Architecture
```
Internet → AWS ALB → EKS Managed Nodes → Pods
            ↓
        VPC CNI → ENI per Pod
            ↓
        EBS CSI → Persistent Volumes
            ↓
        CloudWatch → Monitoring
```

### Group R (k3s) Architecture  
```
Internet → NLB → NodePort (30080) → Caddy Pods → Apps
           ↓
       Flannel → VXLAN Overlay
           ↓
       Local Storage → Persistent Volumes
           ↓
       Prometheus → Monitoring
```

## Detailed Feature Comparison

### 1. Control Plane Management

**Group A (EKS):**
- AWS manages etcd, API server, scheduler, controller manager
- Automatic backups and disaster recovery
- Multi-AZ deployment by default
- Managed security patches and updates
- 99.95% SLA

**Group R (k3s):**
- Self-managed embedded etcd cluster
- Manual backup strategy required
- HA through multiple controller nodes
- Manual security updates needed
- Depends on EC2 SLA (99.99%)

### 2. Networking

**Group A (EKS):**
```yaml
# VPC CNI provides:
- Native AWS networking
- Pod-to-pod communication via VPC
- Security groups per pod
- Multiple ENIs per node
- Direct integration with AWS services
```

**Group R (k3s):**
```yaml
# Flannel provides:
- VXLAN overlay network
- Simpler networking model
- Less AWS integration
- Lower resource overhead
- Standard Kubernetes networking
```

### 3. Storage Options

**Group A (EKS):**
- EBS CSI driver for persistent volumes
- EFS CSI driver for shared storage
- FSx integration available
- Automatic volume provisioning
- Cross-AZ volume attachment

**Group R (k3s):**
- Local-path provisioner (default)
- Manual EBS integration possible
- Simpler storage model
- Node-local storage binding
- Manual backup strategies

### 4. Load Balancing

**Group A (EKS):**
```yaml
# AWS Load Balancer Controller
apiVersion: v1
kind: Service
metadata:
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: nlb
spec:
  type: LoadBalancer  # Creates AWS NLB automatically
```

**Group R (k3s):**
```yaml
# Manual NLB + NodePort
apiVersion: v1
kind: Service
spec:
  type: NodePort
  ports:
  - nodePort: 30080  # Fixed port on all nodes
```

```text
c3/
├── 📁 group-a-eks/                     # EKS cluster deployment
│   ├── 📁 terraform/                   # Infrastructure as code
│   │   ├── main.tf                     # Main Terraform configuration
│   │   ├── variables.tf                # Input variables
│   │   ├── outputs.tf                  # Output values
│   │   ├── vpc.tf                      # VPC configuration
│   │   ├── eks.tf                      # EKS cluster configuration
│   │   └── terraform.tfvars.example    # Example variables
│   ├── 📁 k8s-manifests/              # Kubernetes manifests
│   │   ├── 📁 caddy/                  # Reverse proxy
│   │   ├── 📁 khello/                 # Hello application
│   │   ├── 📁 mariadb/                # Database
│   │   ├── 📁 pocketbase/             # Authentication service
│   │   ├── 📁 prometheus/             # Monitoring
│   │   └── 📁 grafana/                # Dashboards
│   ├── 📁 scripts/                    # Management scripts
│   │   ├── setup-eks.sh               # Cluster setup
│   │   ├── deploy-apps.sh             # Application deployment
│   │   ├── test-deployment.sh         # Testing
│   │   ├── install-pod.sh             # Pod installation
│   │   ├── backup-cluster.sh          # Backup operations
│   │   ├── performance-tuning.sh      # Optimization
│   │   └── troubleshoot-cluster.sh    # Diagnostics
│   ├── configure-environment.sh       # Environment configuration
│   └── README.md                      # EKS documentation
│
├── 📁 group-r-k3s/                     # k3s cluster deployment
│   ├── 📁 terraform/                   # Infrastructure as code
│   │   ├── main.tf                     # Main Terraform configuration
│   │   ├── variables.tf                # Input variables
│   │   ├── outputs.tf                  # Output values
│   │   ├── vpc.tf                      # VPC configuration
│   │   ├── instances.tf                # EC2 instances
│   │   ├── security-groups.tf          # Security groups
│   │   ├── 📁 user-data/              # Instance initialization
│   │   └── terraform.tfvars.example    # Example variables
│   ├── 📁 k8s-manifests/              # Kubernetes manifests
│   │   └── [same structure as EKS]     # Adapted for k3s
│   ├── 📁 scripts/                    # Management scripts
│   │   ├── setup-k3s.sh               # Cluster setup
│   │   ├── ssh-to-node.sh             # Node access
│   │   └── [same as EKS where applicable]
│   ├── configure-environment.sh       # Environment configuration
│   └── README.md                      # k3s documentation
│
├── 📁 gitops/                          # GitOps configuration
│   ├── argocd-install.sh              # ArgoCD installation
│   ├── app-of-apps.yaml               # Application management
│   └── 📁 applications/               # ArgoCD applications
│       ├── khello-app.yaml
│       ├── pocketbase.yaml
│       └── monitoring-stack.yaml
│
├── 📁 environments/                    # Multi-environment configs
│   ├── 📁 base/                       # Base configurations
│   │   └── kustomization.yaml
│   ├── 📁 development/                # Development environment
│   │   ├── kustomization.yaml
│   │   └── khello-dev.yaml
│   ├── 📁 staging/                    # Staging environment
│   │   ├── kustomization.yaml
│   │   └── khello-staging.yaml
│   └── 📁 production/                 # Production environment
│       ├── kustomization.yaml
│       ├── khello-production.yaml
│       └── monitoring-production.yaml
│
├── 📁 monitoring/                      # Advanced monitoring
│   ├── alertmanager-config.yaml       # Alert management
│   ├── prometheus-rules-advanced.yaml # Monitoring rules
│   └── grafana-dashboard-comparison.json
│
├── 📁 security-policies/              # Security configurations
│   ├── pod-security-policy.yaml       # Pod security
│   ├── network-policies.yaml          # Network security
│   └── policy-enforcement.yaml        # OPA Gatekeeper
│
├── 📁 compliance/                      # Compliance and audit
│   ├── audit-report.sh                # Audit automation
│   └── policy-enforcement.yaml        # Compliance policies
│
├── 📁 scripts/                        # Shared scripts
│   ├── backup-cluster.sh              # Universal backup
│   ├── restore-cluster.sh             # Universal restore
│   ├── security-scan.sh               # Security scanning
│   ├── performance-tuning.sh          # Performance optimization
│   ├── cost-optimizer.sh              # Cost optimization
│   ├── troubleshoot-cluster.sh        # Troubleshooting
│   └── schedule-backups.sh            # Backup scheduling
│
├── 📁 test-suite/                     # Comprehensive testing
│   ├── run-all-tests.sh              # Test automation
│   ├── load-test.yml                 # Load testing config
│   ├── curl-format.txt               # HTTP testing
│   └── test-performance.sh           # Performance testing
│
├── 📁 .github/workflows/             # CI/CD pipelines
│   ├── cluster-deployment.yml        # Main deployment pipeline
│   ├── gitops-deployment.yml         # GitOps pipeline
│   └── security-scan.yml             # Security automation
│
├── 📁 docs/                          # Documentation
│   ├── comparison-guide.md           # EKS vs k3s comparison
│   ├── deployment-guide.md           # Deployment instructions
│   ├── troubleshooting-guide.md      # Troubleshooting help
│   ├── security-hardening.md         # Security best practices
│   ├── cost-optimization.md          # Cost management
│   └── operational-runbooks.md       # Operation procedures
│
├── prerequisites-check.sh            # Prerequisites validation
├── deploy-comparison-environment.sh  # Main deployment script
├── manage-environments.sh            # Environment management
├── README.md                         # Main project documentation
├── CONTRIBUTING.md                   # Contribution guidelines
├── LICENSE                           # Project license
└── .gitignore                        # Git ignore rules
```
