# Service Mesh using AWS App Mesh Controller For K8s
[AWS App Mesh Controller For K8s](https://aws.github.io/aws-app-mesh-controller-for-k8s/) is a controller that manages the App Mesh resources for a Kubernetes cluster and injects sidecars to Kubernetes Pods. The controller watches custom resources for changes and reflects those changes into the App Mesh API. The controller maintains the custom resources (CRDs): meshes, virtualnodes, virtualrouters, virtualservices, virtualgateways and gatewayroutes. The custom resources map to App Mesh API objects

AWS maintains the `HelmRepository` and publishes the publicly accessible [Helm chart](https://github.com/aws/eks-charts/tree/master/stable/appmesh-controller) for the AWS App Mesh Controller For K8s.

## Prerequisites
* A Service Account named "appmesh-controller" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document.
* Correct values are specified for the Flux substitute variables `cluster_region`, and `cluster_account` in the cluster specific `infrastructure.yaml` file.
