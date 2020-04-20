+++
title = "Monitoring and Alerting"
description = "Monitoring and Alerting Component."
draft = false
weight = 3
bref="The following components are installed when leveraging KubePlatform"
logos="prometheus,grafana"
toc = false
+++

#### Monitoring, Alerting

`Prometheus` is used to collect and store metrics for monitoring. The `Kube-State-Metrics` add-on generates metrics from the Kubernetes API to monitor deployed workloads. Metrics about Kubernetes nodes are collected via the `node-exporter`. Additionally, the __Prometheus__ `Alert Manager` triggers notifications for services such as Pagerduty and Slack by using webhooks. `Grafana` serves as time series analytics tool for __Prometheus__ provided metrics. Additionally, __Grafana__ provides a UI to define alert rules and to create dashboards.
