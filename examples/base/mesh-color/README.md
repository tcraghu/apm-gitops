# Blue/Green or Canary Deployment using AWS App Mesh
This example is inspired by [aws-app-mesh-examples](https://github.com/aws/aws-app-mesh-examples) example [howto-k8s-ingress-gateway](https://github.com/aws/aws-app-mesh-examples/tree/master/walkthroughs/howto-k8s-ingress-gateway). 

AWS App Mesh is used to virtualize the five (blue, green, red, yellow, and white) color services. `VirtualGateway` is created using the `Envoy` based service `ingress-gw`. Two `GatewayRoute` are created, where the prefix `/path` is configured to use the `prefix` based routing while the prefix `/headers` is configured to to use `header` based routing.

![](./image/VirtualGateway.png)

## Test `prefix` and `header` based routing

<details>
<summary>Find the "ingress-gw" pod</summary>

```
#kubectl get pods -l app=ingress-gw -n ${example_namespace}
#e.g.
kubectl get pods -l app=ingress-gw -n example
  
NAME                          READY   STATUS    RESTARTS   AGE
ingress-gw-548bb78849-rkh9n   2/2     Running   0          3h12m
```
</details>

<details>
<summary>Get a shell into the "ingress-gw" container</summary>

```
#kubectl exec -it <ingress-gw-pod-name> -n ${example_namespace} -c envoy -- bash
#e.g.
kubectl exec -it ingress-gw-548bb78849-rkh9n -n example -c envoy -- bash

bash-4.2#
```
</details>

<details>
<summary>Test the "prefix" based routing</summary>

```
curl -s ingress-gw/paths/blue ; echo ;
blue

curl -s ingress-gw/paths/green ; echo ;
green

curl -s ingress-gw/paths/yellow ; echo ;
yellow

curl -s ingress-gw/paths/red ; echo ;
red

curl -s ingress-gw/paths/white ; echo ;
white

#default is white
curl -s ingress-gw/paths ; echo ;
white
```
</details>

<details>
<summary>Test the "header" based routing</summary>

```
#default is white
curl -s ingress-gw/headers; echo ;
white

curl -s -H "color_header: blue" ingress-gw/headers; echo ;
blue

curl -s -H "color_header: green" ingress-gw/headers; echo ;
green

curl -s -H "color_header: red" ingress-gw/headers; echo ;
red

#if header is present, and does not match, it is yellow
curl -s -H "color_header: xxx" ingress-gw/headers; echo ;
yellow
```
</details>

<details>
<summary>Exit from the container shell</summary>

```
exit

exit
```
</details>
