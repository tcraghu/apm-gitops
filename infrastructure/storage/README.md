# Ingress using AWS Load Balancer Controller
[Amazon EFS CSI Driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver) implements the CSI specification for container orchestrators to manage the lifecycle of Amazon EFS file systems. This is required for the node based compute environment. For the Fargate based compute environment the driver is part of the Fargate stack and does not require any extra deployment or configuration.

## Prerequisites
* Correct values is specified for the Flux substitute variables `cluster_efs_handle` in the cluster specific `infrastructure.yaml` file. This is used by the `PersistentVolume` manifest.
    ```
    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: efs-pv
    spec:
      ...
      csi:
        driver: efs.csi.aws.com
        volumeHandle: ${cluster_efs_handle}    
    ```
