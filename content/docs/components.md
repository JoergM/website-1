+++
title = "Components"
description = "Provided infrastructure for your cluster."
draft = false
weight = 1000
bref="The following components are installed when leveraging KubePlatform"
toc = true
+++

<h3 class="section-head" id="ingress-controller"><a href="#ingress-controller">Ingress Controller</a></h3>
<div class="example">
  The <mark>nginx-ingress</mark> controller is used for routing incoming traffic. By using ingresses for exposing services to external traffic, only one load balancer is provisioned per ingress controller. This approach does save not only costs billed by the infrastructure provider but also provides more fine-grained control over routing. For more details on the nginx-ingress controller configuration, see the [documentation](https://github.com/bitnami/charts/tree/master/bitnami/nginx-ingress-controller/#configuration).
</div>

<h3 class="section-head" id="logging"><a href="#logging">Logging</a></h3>
<div class="example">
  <p><mark>EFK Stack</mark></p>
</div>

<h3 class="section-head" id="monitoring"><a href="#monitoring">Monitoring, Alerting</a></h3>
<div class="example">
  <p><mark>Prometheus mit node-exporter, Grafana, Alert Manager, kube-state-metrics etc.</mark></p>
</div>

<h3 class="section-head" id="tls"><a href="#tls">TLS Certificate Management</a></h3>
<div class="example">
  The <mark>cert-manager</mark> is installed for automatically issuing tls certificates via [Let's Encrypt](https://letsencrypt.org/). Annotations to the service's ingress, indicates the need for a tls certificate to be fetched by the cert-manager. For more information about the cert-manager, reference to the [documentation](http://docs.cert-manager.io).

  <pre>
    <span class="hljs-comment"># ingress.yaml</span>
    annotations:
      certmanager.k8s.io/issuer: "letsencrypt-prod"
      certmanager.k8s.io/acme-challenge-type: http01
  </pre>
</div>

<h3 class="section-head" id="auth"><a href="#auth">Oauth-based Authentication</a></h3>
<div class="example">
  <p><mark>oauth2-proxy</mark></p>
</div>

<h3 class="section-head" id="dns"><a href="#dns">DNS Management</a></h3>
<div class="example">
  <p><mark>External DNS</mark></p>Configuring public DNS servers
</div>

<h3 class="section-head" id="iam"><a href="#iam">Identity Management</a></h3>
<div class="example">
  <p><mark>keycloak</mark></p>
</div>

<h3 class="section-head" id="ci-cd"><a href="#ci-cd">CI/CD Tooling</a></h3>
<div class="example">
  <p><mark>argo Workflow, argo-events</mark></p>
</div>
