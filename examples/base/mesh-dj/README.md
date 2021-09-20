# Blue/Green or Canary Deployment using AWS App Mesh
This example is inspired by [aws-app-mesh-examples](https://github.com/aws/aws-app-mesh-examples) example [DJ App](https://github.com/aws/aws-app-mesh-examples/tree/main/examples/apps/djapp). 

AWS App Mesh is used to virtualize the metal and jazz service. Four router files are provided that configure the `VirtualRouter` as per the requirement to route weighted traffic to v1 or v2 version of the backend service.

File | Routing Rule
---|---
dj-mesh-router-v1.yaml | All traffic to version v1
dj-mesh-router-v1-5-v2-95.yaml | 5% traffic to version v1, 95% traffice to version v2
dj-mesh-router-v1-95-v2-55.yaml | 5% traffic to version v1, 95% traffice to version v2
dj-mesh-router-v2.yaml | All traffic to version v2

## Blue/Green Deployment
* Modify `kustomization.yaml` such that only version v1 with dj-mesh-router-v1.yaml is deployed, this is initial state where all traffice is pointing to version v1.
```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: ${example_namespace}
resources:
  - dj-app-mesh-frontend.yaml
  - dj-app-mesh-metal-v1.yaml
  - dj-app-mesh-jazz-v1.yaml
  #- dj-app-mesh-metal-v2.yaml
  #- dj-app-mesh-jazz-v2.yaml
  - dj-mesh-router-v1.yaml
  #- dj-mesh-router-v1-95-v2-5.yaml
  #- dj-mesh-router-v1-5-v2-95.yaml
  #- dj-mesh-router-v2.yaml
```