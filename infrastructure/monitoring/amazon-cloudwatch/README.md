# Container Insights Prometheus metrics monitoring using CloudWatch Agent
[Container Insights Prometheus metrics monitoring](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights-Prometheus.html) uses AWS maintained CloudWatch Agent that collects metrics from the configured Prometheus sources and publishes to CloudWatch. Dashboards can be created in CloudWatch using these metrics. As more metrics sources are identified this configuration need to change to capture more metrics of interest.

## Prerequisites
* A Service Account named "cloudwatch-agent" is already created as per the recommendations in the [IAM Roles for Service Accounts (IRSA)](https://devcloud.swcoe.ge.com/devspace/pages/viewpage.action?pageId=1836988664#IAMRolesforServiceAccounts(IRSA)-Known_Service_AccountsKnownServiceAccounts) document.
* Correct values are specified for the Flux substitute variables `cluster_name` and `cluster_region` in the cluster specific `infrastructure.yaml` file.

Refer to relevant section of the [Observability](https://devcloud.swcoe.ge.com/devspace/display/AHLNY/Observability+with+Amazon+CloudWatch+and+Splunk#ObservabilitywithAmazonCloudWatchandSplunk-DeployCloudWatchAgentwithPrometheusmonitoringforFargate) document for details.