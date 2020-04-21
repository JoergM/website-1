+++
title = "Getting started"
description = "Finalize on GKE"
draft = false
weight = 33
bref="Learn how to utilize KubePlatform for your production-ready cluster on GKE"
toc = true
+++

## Finalize

Wait until your Pods are running

Setup a user in Keycloak:

1. A call to `https://keycloak.$(DOMAIN)/auth/admin/` should point you to your Keycloak instance (username is ```keycloak```, for the password refer to your kustomization.yaml)
2. Add a user of your choice in Manage/Users (must have an email address). Please refer to the respective [Keycloak documentation](https://www.keycloak.org/documentation)  

<br />

You should then be able to use this user to go to:

- `https://prometheus.$(DOMAIN)`
- `https://kibana.$(DOMAIN)`
- `https://grafana.$(DOMAIN)`
- `https://argo.$(DOMAIN)`