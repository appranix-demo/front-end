#!/usr/bin/env bash

# Use the codeship_gce_service to authenticate
echo "Authenticating"
codeship_google authenticate

# gcloud default values
gcloud config set project appranix-managed-dev-01

# connect to the cluster running the app
gcloud container clusters get-credentials gke-demo-cluster-eus --region us-east1 --project appranix-managed-dev-01

# Deploying the image
kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:$CI_TIMESTAMP
# kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:0.3.12


echo $CI_TIMESTAMP
echo ${CI_TIMESTAMP}
echo "${CI_TIMESTAMP}"
echo "$CI_TIMESTAMP"
