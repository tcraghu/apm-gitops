# Container Logging for Amazon EKS on Fargate
Amazon EKS on Fargate offers a built-in log router based on Fluent Bit. There is no need to deploy any other component. The ConfigMap `aws-logging` is configured to setup `[FILTER]`, `[OUTPUT]`, and `[PARSER]` for the Fluent Bit.

## Prerequisites
* The Fargate pod execution role must have the `arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy` policy attached so that Fargate can send logs to CloudWatch
* Correct values are specified for the Flux substitute variables `cluster_name` and `cluster_region` in the cluster specific `infrastructure.yaml` file.

Refer to relevant section of the [Observability](https://devcloud.swcoe.ge.com/devspace/display/AHLNY/Observability+with+Amazon+CloudWatch+and+Splunk#ObservabilitywithAmazonCloudWatchandSplunk-ConfigureFluentBitforFargate) document for details.