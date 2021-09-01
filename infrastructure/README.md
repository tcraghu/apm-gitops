# Infrastructure 
An EKS cluster, typically hosts several infrastructure services to provide common features like Ingress, Secrets, or Observability.

A typical containerized workload uses one or more of these features in a standardized way.

It is best practice to have a Flux custom resource `Kustomization` for these infrastructure components.
