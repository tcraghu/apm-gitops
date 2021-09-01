# Support Multiple EKS Clusters on the same repository
You may have requirements to support GitOps for multiple clusters on the same verson of the Git. This can be achieved by having separate folders for each cluster under `./clusters` folder on the same branch of the repository.

You may have requirements to support GitOps for multiple clusters on different version/branch of the Git. This can be achieved by having separate folder for each cluster under `./clusters` folder on different branch of the repository.

Make sure each cluster specific folder has a YAML file e.g., [devops/infrastructure.yaml](devops/infrastructure.yaml) for each `Kustomization` source e.g., "infrastructure" folder.
This file should have the needed `spec.postBuild.substitue` variables and values defined that are used by the `Kustomization` source.

For example:
```yaml
spec:
  ...
  postBuild:
    substitute:
      var_substitution_enabled: "true"
      cluster_env: "devops"
      cluster_name: "devops"
      cluster_region: "us-west-2"
      cluster_vpc: "vpc-670e3100"
```

