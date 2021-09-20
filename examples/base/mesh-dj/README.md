# Blue/Green or Canary Deployment using AWS App Mesh
This example is inspired by [aws-app-mesh-examples](https://github.com/aws/aws-app-mesh-examples) example [DJ App](https://github.com/aws/aws-app-mesh-examples/tree/main/examples/apps/djapp). [EKS Workshop](https://www.eksworkshop.com/intermediate/330_app_mesh/) also mentions this example without GitOps.

AWS App Mesh is used to virtualize the metal and jazz service. 

![](https://raw.githubusercontent.com/aws/aws-app-mesh-examples/main/examples/apps/djapp/img/155-v2-with-mesh-and-cp.png)

Four router files are provided that configure the `VirtualRouter` as per the requirement to route weighted traffic to v1 or v2 version of the backend service.

File | Routing Rule
---|---
dj-mesh-router-v1.yaml | All traffic to version v1
dj-mesh-router-v1-5-v2-95.yaml | 5% traffic to version v1, 95% traffic to version v2
dj-mesh-router-v1-95-v2-55.yaml | 95% traffic to version v1, 5% traffic to version v2
dj-mesh-router-v2.yaml | All traffic to version v2

## Blue/Green Deployment

<img src="./image/DeploymentStrategies-Blue-Green.png" width="600px"/>

* Modify `kustomization.yaml` such that only version v1 is running with dj-mesh-router-v1.yaml. This is `blue` state where all traffic is pointing to version v1.
    <details>
    <summary>All traffic to version v1</summary>
    
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
    </details>

* Modify `kustomization.yaml` such that both version v1 and v2 are running with dj-mesh-router-v1.yaml. This is `blue/green` state where all traffic is pointing to version v1. You can test version v2 without impacting main traffic from dj.
    <details>
    <summary>All traffic to version v1, while version v2 is available for testing</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    - dj-app-mesh-metal-v1.yaml
    - dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    - dj-mesh-router-v1.yaml
    #- dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    #- dj-mesh-router-v2.yaml
    ```
    </details>

* Modify `kustomization.yaml` such that both version v1 and v2 are running with dj-mesh-router-v2.yaml. This is `green` state where all traffic is pointing to version v2, while version v1 is still available for rollback.
    <details>
    <summary>All traffic to version v2, while version v1 is available for rollback</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    - dj-app-mesh-metal-v1.yaml
    - dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    #- dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    - dj-mesh-router-v2.yaml
    ```
    </details>

* Modify `kustomization.yaml` such that version v2 is running with dj-mesh-router-v2.yaml. This is `green` state where all traffic is pointing to version v2, while version v1 is removed.
    <details>
    <summary>All traffic to version v2</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    #- dj-app-mesh-metal-v1.yaml
    #- dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    #- dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    - dj-mesh-router-v2.yaml
    ```
    </details>

## Canary Deployment

<img src="./image/DeploymentStrategies-Canary.png" width="1024px"/>

* Modify `kustomization.yaml` such that only version v1 is running with dj-mesh-router-v1.yaml. This is initial state where all traffic is pointing to version v1.
    <details>
    <summary>All traffic to version v1</summary>
    
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
    </details>

* Modify `kustomization.yaml` such that both version v1 and v2 are running with dj-mesh-router-v1-95-v2-5.yaml. This is `canary` state where 5% traffic is pointing to version v2. Version v2 is tested via dj app or via frontend.
    <details>
    <summary>95% traffic to version v1, 5% traffic to version v2</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    - dj-app-mesh-metal-v1.yaml
    - dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    - dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    #- dj-mesh-router-v2.yaml
    ```
    </details>

* Modify `kustomization.yaml` such that both version v1 and v2 are running with dj-mesh-router-v1-5-v2-95.yaml. This is `canary` state where 95% traffic is pointing to version v2. Version v2 is tested via dj app or via frontend. More users experience the `canary` version.
    <details>
    <summary>5% traffic to version v1, 95% traffic to version v2</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    - dj-app-mesh-metal-v1.yaml
    - dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    # dj-mesh-router-v1-95-v2-5.yaml
    - dj-mesh-router-v1-5-v2-95.yaml
    #- dj-mesh-router-v2.yaml
    ```
    </details>

* Modify `kustomization.yaml` such that both version v1 and v2 are running with dj-mesh-router-v2.yaml. This is desired state where all traffic is pointing to version v2, while version v1 is still available for rollback.
    <details>
    <summary>All traffic to version v2, while version v1 is available for rollback</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    - dj-app-mesh-metal-v1.yaml
    - dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    #- dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    - dj-mesh-router-v2.yaml
    ```
    </details>

* Modify `kustomization.yaml` such that version v2 is running with dj-mesh-router-v2.yaml. This is final state where all traffic is pointing to version v2, while version v1 is removed.
    <details>
    <summary>All traffic to version v2</summary>
    
    ```
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization
    namespace: ${example_namespace}
    resources:
    - dj-app-mesh-frontend.yaml
    #- dj-app-mesh-metal-v1.yaml
    #- dj-app-mesh-jazz-v1.yaml
    - dj-app-mesh-metal-v2.yaml
    - dj-app-mesh-jazz-v2.yaml
    #- dj-mesh-router-v1.yaml
    #- dj-mesh-router-v1-95-v2-5.yaml
    #- dj-mesh-router-v1-5-v2-95.yaml
    - dj-mesh-router-v2.yaml
    ```
    </details>

## Test via DJ App (frontend testing)
<details>
<summary>Find the `dj` pod</summary>

```
#kubectl get pods -l app=dj -n ${example_namespace}
#e.g.
kubectl get pods -l app=dj -n example
  
NAME                 READY   STATUS    RESTARTS   AGE
dj-76cfdcd9d-cgs9j   3/3     Running   0          157m
```
</details>

<details>
<summary>Get a shell into the `dj` container</summary>

```
#kubectl exec -it <dj-pod-name> -n ${example_namespace} -c dj -- bash
#e.g.
kubectl exec -it dj-76cfdcd9d-cgs9j -n example -c dj -- bash

root@dj-76cfdcd9d-cgs9j:/usr/src/app#
```
</details>

<details>
<summary>Test the backend services</summary>

```
#curl -s metal.${example_namespace}.svc.cluster.local:9080 ; echo ;
#curl -s jazz.${example_namespace}.svc.cluster.local:9080 ; echo ;
#e.g.
curl -s metal.example.svc.cluster.local:9080 ; echo ;

["metal-v1", "Megadeth","Judas Priest"]

curl -s jazz.example.svc.cluster.local:9080 ; echo ;

["jazz-v1", "Astrud Gilberto","Miles Davis"]

while true ; do curl -s metal.example.svc.cluster.local:9080 ; echo ; curl -s jazz.example.svc.cluster.local:9080 ; echo ; sleep 1 ; done 

["metal-v1", "Megadeth","Judas Priest"]
["jazz-v1", "Astrud Gilberto","Miles Davis"]
["metal-v1", "Megadeth","Judas Priest"]
["jazz-v1", "Astrud Gilberto","Miles Davis"]
...
```
</details>

<details>
<summary>Exit from the container shell</summary>

```
exit

command terminated with exit code 130
```
</details>