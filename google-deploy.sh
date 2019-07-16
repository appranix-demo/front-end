#!/usr/bin/env bash

# gcloud default values
gcloud config set compute/zone us-central1-a
gcloud config set project appranix-managed-dev-01

# Use the codeship_gce_service to authenticate
echo "Authenticating"
codeship_google authenticate

# connect to the cluster running the app
#gcloud container clusters get-credentials qa-cps-test-cluster --zone us-central1-a --project appranix-managed-dev-01
gcloud container clusters get-credentials gke-demo-cluster-eus --region us-east1 --project appranix-managed-dev-01

# Deploying the image
kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:ax-shop
# kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:0.3.12
