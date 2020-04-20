+++
title = "TLS Certificate Management"
description = "TLS Certificate Management Component."
draft = false
weight = 4
bref="The following components are installed when leveraging KubePlatform"
toc = false
+++

#### TLS Certificate Management

  The `cert-manager` is installed for automatically issuing tls certificates via [Let's Encrypt](https://letsencrypt.org/). Annotations to the service's ingress indicate the need for a tls certificate to be fetched by the __cert-manager__. For more information about the __cert-manager__, reference to the [documentation](http://docs.cert-manager.io).

```yaml
# ingress.yaml
annotations:
  certmanager.k8s.io/issuer: "letsencrypt-prod"
  certmanager.k8s.io/acme-challenge-type: http01
```
