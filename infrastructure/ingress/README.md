# Ingress using AWS Load Balancer Controller
[AWS Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/) is a controller to help manage Elastic Load Balancers for a Kubernetes cluster.
* It satisfies [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) resources by provisioning Application Load Balancers.
* It satisfies [Kubernetes Service](https://kubernetes.io/docs/concepts/services-networking/service/) resources by provisioning Network Load Balancers.

AWS maintains the `HelmRepository` and publishes the publicly accessible [Helm chart](https://github.com/aws/eks-charts/tree/master/stable/aws-load-balancer-controller) for the AWS Load Balancer Controller.

## Prerequisites
* A Service Account named "aws-load-balancer-controller" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document.
* Correct values are specified for the Flux substitute variables `cluster_name`, `cluster_region`, and `cluster_vpc` in the cluster specific `infrastructure.yaml` file.
