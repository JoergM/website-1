+++
title = "Getting started"
description = "Installation on GKE"
draft = false
weight = 32
bref="Learn how to utilize KubePlatform for your production-ready cluster on GKE"
toc = true
+++

## Installation

The installation consists basically of these parts

1. DNS configuration
2. Overlay Configuration
3. Applying yamls to Kubernetes

### DNS configuration

1. Create a new DNS Zone and a ServiceAccount to be used by ```external-dns``` to add hosts to:

```bash
export PROJECT_ID=my-google-project-223304
export DOMAIN=kubeplatform.my.domain.io

gcloud dns managed-zones create "${DOMAIN//./-}" \
    --dns-name "$DOMAIN." \
    --description "Automatically managed zone by kubernetes.io/external-dns" \
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
3. Make a note of the nameservers that were assigned to your new DNS zone:

```bash
gcloud dns record-sets list \
--zone "${DOMAIN//./-}" \
--name "$DOMAIN." \
--type NS \
--project $PROJECT_ID
```

4. Enter the new nameservers in your domain configuration of your domain providers DNS.

### Overlay Configuration

Use the provided [KubePlatform Kustomize Overlay for GKE](https://github.com/kube-platform/google-overlay).
The configuration is made in these three files:

__kubeplatform.properties__

  - Enter the desired domain (e.g. ```DOMAIN=kubeplatform.my.domain.io```)
  - Enter the GCE project (e.g. ```PROJECT=my-google-project-223304```)

__cluster-issuer-patch.yaml__

  - Enter two email addresses for Let's Encrypt certificate. One for staging and one (or the same) for prod.

__kustomization.yaml__

  - change the admin password for keycloak
  - Choose ```namePrefix```, ```nameSuffix``` and ```namespace```
  - If you plan to use Let's Encrypt `prod` environment instead of `staging`, change var `CLUSTER_ISSUER_NAME` accordingly. **Note:** If you switch from `staging` to `prod`, delete already present staging certificates so that the cert-manager issues new certificates.

### Applying YAMLs

1. Create a Kubernetes cluster and retrieve kubectl [credentials](https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials)
2. Create a clusterrolebinding for your account: ```kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=my@google.account.com```
3. Create the namespace you have chosen in the overlay configuration step.
4. Execute ```kustomize build google-overlay | kubectl apply -f -```
