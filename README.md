# poc-gitops-flux-eks

Proof-of-Concept for GitOps using [Flux](https://fluxcd.io/) on [Elastic Kubernetes Service](https://aws.amazon.com/eks/) (EKS)

## Prerequisites

You must have the following working on your machine from where you want to bootstrap the Flux on a EKS Cluster.

* You must have access to the repository e.g., this repository.
* You must have Git `Personal Access Token` that will be used by Flux.
* You must have working target EKS Cluster.
    * If your are using Fargate only cluster, you must have Fargate profile with selector for the Kubernetes `namespace` "flux-system"
* `kubectl` configured to access the EKS Cluster
    * `.kube/config` has the required information to access the cluster.
* `Flux CLI` [installed](https://fluxcd.io/docs/installation/#install-the-flux-cli).

Execute following command to check you have everything needed to run Flux:

```bash
flux check --pre
...
✔ prerequisites checks passed
```

# Bootstrap Flux on EKS Cluster

Make sure you have setup Git `Personal Access Token` in the environment variable `GITHUB_TOKEN`

```bat
#Windows Powershell
$Env:GITHUB_TOKEN="<personal-access-token-for-service-account>"
```
```bash
#Linux
export GITHUB_TOKEN=<personal-access-token-for-service-account>
```

Make sure you have correct values for the following arguments:

`owner` --> owner of the repository e.g., "tcraghu"

`repository` --> name of the repository e.g., "apm-gitpos"

`path` --> path with respect to the root of the repository for the cluster bootstrap files e.g., "clusters/devpos"

`branch` --> branch on the repository to use for gitops e.g., "main"

Execute the following command to bootstrap Flux onto the Cluster and linked with the repository.

```bat
#Use the correct values of the arguments according to your environment
#Windows Powershell
flux bootstrap github `
--owner=tcraghu `
--repository=apm-gitops `
--path=clusters/devops `
--branch main `
--token-auth `
--personal
```
```bash
#Linux
flux bootstrap github \
--owner=tcraghu \
--repository=apm-gitops \
--path=clusters/devops \
--branch main \
--token-auth \
--personal
```

It is recommended to use [Terraform provider for Flux](https://github.com/fluxcd/terraform-provider-flux) to automate Flux bootstrap via Terraform.
