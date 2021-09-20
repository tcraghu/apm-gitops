# External Secrets Example
Four `ExternalSecret` are created demonstrating
* `${example_namespace}-secrets` --> Working secrets from Secrets Manager
* `${example_namespace}-params` --> Working secrets from System Manager Parameter Store
* `some-ns-secrets` --> Non-working secret from Secrets Manager because it is trying to get secret from other namespace
* `some-ns-params` --> Non-working secret from System Manager Parameter Store because it is trying to get secret from other namespace