# Examples
Examples are provided for testing some of the infrastructure components.

## Prerequisites
A separate cluster specific Flux Kustomization `examples` is created for the examples. It is specificed in `./clusters/<cluser-name>/examples.yaml`. Flux substitute variables `cluster_env`, `cluster_name`, `example_namespace`, and `appmesh_color_demo_image` must be correctly valued as per your cluster setup.

Each cluster can Kustomize the examples via `./examples/<cluster-name>/kustomization.yaml`