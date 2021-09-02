# Secrets using Kubernets External Secrets
[Kubernetes External Secrets](https://github.com/external-secrets/kubernetes-external-secrets) pulls the secrets from the external secret management systems (e.g., AWS Secrets Manager) and securely add secrets in Kubernetes namespaces. 

The `HelmRepository` is community managed and publicly accessible [Helm chart]https://github.com/external-secrets/kubernetes-external-secrets/tree/master/charts/kubernetes-external-secrets).

## Prerequisites
* A Service Account named "aws-external-secrets-sa" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document.
* Correct values are specified for the Flux substitute variables `cluster_region` in the cluster specific `infrastructure.yaml` file.
* Scope the secrets to the namespaces by adding `externalsecrets.kubernetes-client.io/permitted-key-name` annotation to the namespace using a well-defined pattern such as `/<env-name>/<cluster-name>/<namespace>/.*`
    * Only the secret keys matching above pattern can be synchronized with a namespace.

For example:
```yaml
apiVersion: v1
kind: Namespace
metadata:
  annotations:
    externalsecrets.kubernetes-client.io/permitted-key-name: /devops/devops-eks-cluster/apm-classic/.*
  name: apm-classic

```
