+++
title = "DNS Management"
description = "DNS Management Component."
draft = false
weight = 5
bref="The following components are installed when leveraging KubePlatform"
logos="external-dns"
toc = false
+++

#### DNS Management

The DNS server configuration tool `External DNS` communicates with the infrastructure provider to configure DNS entries. Applying domain mappings through a Kubernetes ingress leads to an actual configuration via the IaaS providers API where your Kubernetes cluster is running on. This approach does only apply if the same provider your cluster is running on manages the domain's nameservers. The credentials for communicating with the IaaS providers API need to be provided upon installation with KubePlatform. Usually, those credentials can be generated via CLI or the IaaS providers user interface. __External DNS__ is a self-service tool so that it acts autonomously when valid credentials where provided. For more details, see the [documentation of External DNS](https://github.com/kubernetes-incubator/external-dns).
