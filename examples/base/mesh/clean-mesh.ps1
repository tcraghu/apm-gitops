#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
aws appmesh delete-mesh --mesh-name default-mesh --no-verify-ssl                                                                                                              
kubectl label namespace default appmesh.k8s.aws/sidecarInjectorWebhook-
kubectl label namespace default mesh-
kubectl label namespace default gateway-
#kubectl label namespace default appmesh.k8s.aws/sidecarInjectorWebhook=enabled
#kubectl label namespace default mesh=default-mesh
#kubectl label namespace defauilt gateway=ingress-gw

