# Storage Example using Amazon EFS
* A `PersistentVolumeClaim` (efs-claim) is created to claim the `PersistentVolume` (efs-pv). 
* Two sample `pods` (app1 and app2) are created that mount the same volumes and write to two different files in the same volume

## Prerequisites
* Amazon EFS is created along with mount targets in the same subnet/AZ as the cluster. The Security Group for the mount target must allow traffic from Cluster Security Group at NFS port (TCP/2049).
* The Amazon EFS file system id is specified in the Flux substitute variables `cluster_efs_handle` in the cluster specific `infrastructure.yaml` file. 
* Storage Class and Persistent Volume (using EFS CSI) are created via manifests in the `./infrastructure/storage` folder.