+++
title = "Getting started"
description = "Precondition on GKE"
draft = false
weight = 31
bref="Learn how to utilize KubePlatform for your production-ready cluster on GKE"
toc = true
+++

## Precondition

- Installed [kustomize 2.0.1](https://github.com/kubernetes-sigs/kustomize/releases)
- Running GKE Kubernetes Cluster with at least 3 instances of ```n1-standard-2``` worker nodes.

### Configuration

What you need to know now:

- An email address for issuing tls certificates
- A DNS zone name (a domain or subdomain like ```kubeplatform.my.domain.io```)
- A GCP project ID (e.g., ```my-google-project-223304```)

### Own OAuth provider

KubePlatform comes with pre-configured Keycloak used for user management and oauth2 authentication. If you plan to use an own OAuth provider, collect these parameters:

- An Issuer URL for OpenID Connect
- Client ID and its client secret
- Cookie Secret

Add these parameters to:

- oauth2-proxy.properties
- patches/oauth2-proxy-patch.yaml