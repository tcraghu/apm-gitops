# Blue/Green Deployment using AWS App Mesh and Flagger
This example is inspired by [Flagger Blue/Green Deployments](https://docs.flagger.app/tutorials/kubernetes-blue-green) example. `stefanprodan/podinfo` image is used to create the `podinfo` pod and `podinfo` canary. Flagger [orchestrates](https://docs.flagger.app/usage/deployment-strategies#blue-green-deployments) the promotion of a new image through Blue/Green deployment defined in the `canary` custom resource using the App Mesh and App Mesh Prometheus.

## Blue/Green Deployment
| ![](https://raw.githubusercontent.com/fluxcd/flagger/main/docs/diagrams/flagger-bluegreen-steps.png)|
|:--:|
|Flagger Blue/Green Stages|

* Modify `podinfo.yaml` change `image: stefanprodan/podinfo:3.1.0` to `image: stefanprodan/podinfo:3.1.1` and commit/push to git.
    <details>
    <summary>The canary will detect the change and orchestrate the Blue/Green deployment steps.</summary>

    * scale up the canary `podinfo` pods (green).
    * run conformance tests for the canary pods.
    * run load tests and metric checks for the canary pods.
    * abort the canary release if the failure threshold is reached.
    * route traffic to canary.
    * promote canary spec over primary `podinfo-primary` pods (blue).
    * wait for primary rollout.
    * route traffic to primary `podinfo-primary` pods.
    * scale down canary.
    </details>
