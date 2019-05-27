+++
title = "Architecture"
description = "Provided infrastructure for your cluster."
draft = false
weight = 100000
bref="Learn how all components play together"
toc = true
+++

<h3 class="section-head" id="dns-tls"><a href="#dns-tls">DNS & TLS</a></h3>
Ingresses configure both the <mark>cert-manager</mark> and <mark>external-dns</mark>. __external-dns__ is configured implicitly through the hostname mapping, whereas the __cert-manager__ requires annotations or already present certificates to watch out for.

<div class="example">
    <img alt="dns-tls" src="/img/architecture/dns_tls.png" />
</div>

<h3 class="section-head" id="oauth"><a href="#oauth">OAuth2</a></h3>
This figure shows the role of ingresses as they are configured to redirect every request to the <mark>oauth2-proxy</mark>. The <mark>nginx-ingress</mark> controller does not have a particular role, apart from the fact, that it is configured by routing rules in the shape of ingress resources. The most part of the OAuth2 process is done by browser redirects. <mark>Keycloak</mark> acts here as the identity provider, but also other IAM services can be used with the __oauth2-proxy__.

<div class="example">
    <img alt="oauth" src="/img/architecture/oauth.png" />
</div>

<h3 class="section-head" id="logging-monitoring"><a href="#logging-monitoring">Logging & Monitoring</a></h3>
Both <mark>Elasticsearch</mark> and <mark>Prometheus</mark> are deployed together with Kubernetes daemons to gather data. Daemons are present on every worker node. Using the EFK Stack __Fluentd__ is utilized to collect logs from workloads of a node, and to push them to __Elasticsearch__. In the case of __Prometheus__ all metrics are scraped from the emitting sources, collecting daemons or services. The __node-exporter__ is a daemon to collect node-specific data. The __Kube-State-Metric__ service collects metrics of the overall Kubernetes cluster through its API.

<div class="example">
    <img alt="logging-monitoring" src="/img/architecture/logging_monitoring.png" />
</div>
