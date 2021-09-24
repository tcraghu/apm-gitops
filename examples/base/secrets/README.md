# External Secrets Example
Four `ExternalSecret` examples are created.
* `${example_namespace}-secrets` --> Working secrets from Secrets Manager with key `/${cluster_env}/${cluster_name}-eks-cluster/${example_namespace}/hello-service/secrets`. For example,
    ```json
    {
      "secret1": "value1",
      "secret2": "value2",
      "secret3": "value3",
      "secret4": "value4"
    }
    ```
* `${example_namespace}-params` --> Working secrets from System Manager Parameter Store with key `/${cluster_env}/${cluster_name}-eks-cluster/${example_namespace}/hello-service/params`. For example,
    ```json
    {
      "param1": "value1",
      "param2": "value2",
      "param3": "value3",
      "param4": "value4"
    }
    ```
* `some-ns-secrets` --> Non-working secret from Secrets Manager because it is trying to get secret from other namespace
* `some-ns-params` --> Non-working secret from System Manager Parameter Store because it is trying to get secret from other namespace

## Prerequisites
Kubernetes External Secrets is installed and configured correctly in `./infrastructure/secrets` and is active.