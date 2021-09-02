# Monitoring 
The EKS cluster monitoring involves multiple concepts.
* **Container Resource Metrics** - Kubernetes Metrics Server collects resource metrics from Kubelets and exposes them through Metrics API for use by [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) and [Vertical Pod Autoscaler](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler/)
* **Container Logging** - Amazon EKS on Fargate offers a built-in log router based on Fluent Bit. This is configured in the namespace `aws-observability`
* **Container Insights Prometheus metrics monitoring** - CloudWatch agent with Prometheus metrics collection is deployed and configured to collect the Prometheus metrics from containerized systems and workloads.