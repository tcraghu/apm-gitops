# Service Mesh using AWS App Mesh Controller For K8s
[AWS App Mesh Controller For K8s](https://aws.github.io/aws-app-mesh-controller-for-k8s/) is a controller that manages the App Mesh resources for a Kubernetes cluster and injects sidecars to Kubernetes Pods. The controller watches custom resources for changes and reflects those changes into the App Mesh API. The controller maintains the custom resources (CRDs): meshes, virtualnodes, virtualrouters, virtualservices, virtualgateways and gatewayroutes. The custom resources map to App Mesh API objects

AWS maintains the `HelmRepository` and publishes the publicly accessible [Helm chart](https://github.com/aws/eks-charts/tree/master/stable/appmesh-controller) for the AWS App Mesh Controller For K8s.

AppMesh controller supports monitoring the control plane with Prometheus and Grafana. Use the respective Helm chart maintained by AWS.
AWS maintains the `HelmRepository` and publishes the publicly accessible [Helm chart](https://github.com/aws/eks-charts/tree/master/stable/appmesh-prometheus) for the App Mesh Prometheus.


## Prerequisites
* A Service Account named "appmesh-controller" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document.
* Make sure AWS EFS is created and mounted in the same VPC and Subnets as the EKS Cluster. This is used by App Mesh Prometheus.
* Correct values are specified for the Flux substitute variables `cluster_region`, `cluster_account`, and `cluster_efs_handle` in the cluster specific `infrastructure.yaml` file.
* The current App Mesh Prometheus Helm chart does not have facility to customize the health probes. Apply the provided patch manually to provide the `initialDelaySeconds: 120`
    ```
    kubectl patch deployment appmesh-prometheus -n appmesh-system --patch-file .\appmesh-prometheus-patch.yaml
    ```
