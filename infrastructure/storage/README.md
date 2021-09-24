# Shared storage via Amazon EFS CSI driver
[Amazon EFS CSI Driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver) implements the CSI specification for container orchestrators to manage the lifecycle of Amazon EFS file systems. This is required for the node based compute environment. For the Fargate based compute environment the driver is part of the Fargate stack and does not require any extra deployment or configuration.

## Prerequisites
* Amazon EFS instace is created along with mount targets in the same subnet/AZ as the cluster. The Security Group for the mount target must allow traffic from `Cluster Security Group` at NFS port (TCP/2049).
* The Amazon EFS file system id is specified in the Flux substitute variables `cluster_efs_handle` in the cluster specific `infrastructure.yaml` file. This is used by the `PersistentVolume` manifest.
    ```yaml
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
