+++
title = "Ingress Controller"
description = "Ingress Controller Component."
draft = false
weight = 1
bref="The following components are installed when leveraging KubePlatform"
logos="nginx_ingress"
toc = false
+++

#### Ingress Controller

The `nginx-ingress` controller is used for routing incoming traffic. By using ingresses for exposing services to external traffic, only one load balancer is provisioned per ingress controller. This approach does save not only costs billed by the infrastructure provider but also provides more fine-grained control over routing. The route configuration is made via annotations of the ingress object. For more details on the __nginx-ingress__ controller configuration, see the [documentation](https://github.com/bitnami/charts/tree/master/bitnami/nginx-ingress-controller/#configuration).
