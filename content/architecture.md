+++
title = "Architecture"
description = "Provided infrastructure for your cluster."
draft = false
weight = 100000
bref="Learn how all components play together"
toc = true
+++

### DNS & TLS

Ingresses configure both the __cert-manager__ and __external-dns__. __external-dns__ is configured implicitly through the hostname mapping, whereas the __cert-manager__ requires annotations or already present certificates to watch out for.

![dns_tls](/img/architecture/dns_tls.svg)

### OAuth2

This figure shows the role of ingresses as they are configured to redirect every request to the __oauth2-proxy__. The __nginx-ingress__ controller does not have a particular role, apart from the fact, that it is configured by routing rules in the shape of ingress resources. The most part of the OAuth2 process is done by browser redirects. `Keycloak` acts here as the identity provider, but also other IAM services can be used with the __oauth2-proxy__.

![oauth](/img/architecture/oauth.svg)

### Logging & Monitoring

Both `Elasticsearch` and `Prometheus` are deployed together with Kubernetes daemons to gather data. Daemons are present on every worker node. Using the EFK Stack __Fluentd__ is utilized to collect logs from workloads of a node, and to push them to __Elasticsearch__. In the case of __Prometheus__ all metrics are scraped from the emitting sources, collecting daemons or services. The __node-exporter__ is a daemon to collect node-specific data. The __Kube-State-Metric__ service collects metrics of the overall Kubernetes cluster through its API.

![logging_monitoring](/img/architecture/logging_monitoring.svg)
