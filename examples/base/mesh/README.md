# AWS App Mesh Example
* An AWS App Mesh "${example_namespace}-mesh" is created in the namespace ${example_namespace}
* Edit kustomization.yaml to enable 
    * mesh-dj example
    * mesh-color example
    * flagger-demo example

## Prerequisites
* AWS App Mesh Controller For K8s is installed and configured correctly in `./infrastructure/mesh` and is active.
* A Service Account named "appmesh-pod" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document in the `example_namespace` e.g. 'example'
* Correct values are specified for the Flux substitute variables `example_namespace`in the cluster specific `examples.yaml` file.