+++
title = "Getting started"
description = "on GKE"
draft = false
weight = 1000
bref="Learn how to utilize Kubeplatform for your production-ready cluster on <mark>GKE</mark>"
toc = true
+++
<h3 class="section-head" id="1"><a href="#1">Precondition</a></h3>

- Installed [kustomize 2.0.1](https://github.com/kubernetes-sigs/kustomize/releases)
- Running GKE Kubernetes Cluster with at least 3 instances of ```n1-standard-2``` worker nodes.

---

<h4 class="section-head" id="2"><a href="#2">Configuration</a></h4>

What you need to know now:

- An email address for issuing tls certificates
- A DNS zone name (e.g. ```kubeplatform.my.domain.io```)
- A GCP project ID (e.g. ```my-google-project-223304```)

<h4 class="section-head" id="3"><a href="#3">Own Oauth provider</a></h4>

KubePlatform comes with pre-configured Keycloak used for user management and oauth2 authentication. If you plan to use your own OAuth provider, collect these parameters:

- An Issuer URL for OpenID Connect
- Client ID and its client secret
- Cookie Secret

Add these parameters to:

- oauth2-proxy.properties
- patches/oauth2-proxy-patch.yaml

---

<h3 class="section-head" id="4"><a href="#4">Installation</a></h3>

The installation consists basically of these parts

1. DNS configuration
2. Overlay Configuration
3. Applying yamls to Kubernetes

<h4 class="section-head" id="5"><a href="#5">DNS configuration</a></h4>

1. Create a new DNS Zone and a ServiceAccount to be used by ```external-dns``` to add hosts to:

```bash
export PROJECT_ID=my-google-project-223304
export DOMAIN=kubeplatform.my.domain.io

gcloud dns managed-zones create "${DOMAIN//./-}" \
    --dns-name "$DOMAIN." \
    --description "Automatically managed zone by kubernetes.io/external-dns"
    --project $PROJECT_ID

gcloud iam service-accounts create ${DOMAIN//./-} \
    --display-name "${DOMAIN//./-} service account for external-dns" \
    --project $PROJECT_ID

gcloud iam service-accounts keys create ./google-credentials.json \
  --iam-account ${DOMAIN//./-}@$PROJECT_ID.iam.gserviceaccount.com \
  --project $PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:${DOMAIN//./-}@$PROJECT_ID.iam.gserviceaccount.com --role roles/dns.admin 
```

2. Ensure that the downloaded credential file `google-credentails.json` is present in the `google-overlay` folder
3. Make a note of the nameservers that were assigned to your new DNS zone (and enter them as NS entries in your providers DNS):

```bash
gcloud dns record-sets list \
    --zone "${DOMAIN//./-}" \
    --name "$DOMAIN." \
    --type NS \
    --project $PROJECT_ID
```
<h4 class="section-head" id="6"><a href="#6">Overlay Configuration</a></h4>

Use the provided [KubePlatform Kustomize Overlay for GKE](https://github.com/kube-platform/google-overlay).
The configuration is made in these three files:

- __kubeplatform.properties__
  - Enter the desired domain (e.g. ```DOMAIN=kubeplatform.my.domain.io```)
  - Enter the GCE project (e.g. ```PROJECT=my-google-project-223304```)
- __cluster-issuer-patch.yaml__
  - Enter two email addresses for Let's Encrypt certificate. One for staging and one (or the same) for prod.
- __kustomization.yaml__ 
  - Choose ```namePrefix```, ```nameSuffix``` and ```namespace```
  - If you plan to use Let's Encrypt `prod` environment instead of `staging`, change var `CLUSTER_ISSUER_NAME` accordingly. **Note:** If you switch from `staging` to `prod`, delete already present staging certificates so that the cert-manager issues new certificates.
  
<h4 class="section-head" id="7"><a href="#7">Applying YAMLs</a></h4>

1. Create a Kubernetes cluster and retrieve kubectl [credentials](https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials)
2. ```kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=my@google.account.com```
3. Create the namespace you have chosen above
4. Execute ```kustomize build google-overlay | kubectl apply -f -```

---

<h3 class="section-head" id="8"><a href="#8">Finalize</a></h3>

Wait until your Pods are running

Setup a user in Keycloak:

1. A call to `https://keycloak.$(DOMAIN)/auth/admin/` should point you to your Keycloak instance (username is ```keycloak```, for the password refer to your kustomization.yaml)
2. Add a user of your choice in Manage/Users (must have an email address). Please refer to the respective [Keycloak documentation](https://www.keycloak.org/documentation)

You should then be able to use this user to go to:

- `https://prometheus.$(DOMAIN)`
- `https://kibana.$(DOMAIN)`
- `https://grafana.$(DOMAIN)`
- `https://argo.$(DOMAIN)`

---

<h3 class="section-head" id="8"><a href="#8">CI/CD with Argo</a></h3>

For running basic workflows refer to the [demos](https://github.com/argoproj/argo/blob/master/demo.md) page.

For using it for CI refer to [this example](https://github.com/kube-platform/base-extras/tree/master/argo/examples/ci/CI.md).
