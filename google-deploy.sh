#!/usr/bin/env bash

# Use the codeship_gce_service to authenticate
echo "Authenticating"
codeship_google authenticate

# gcloud default values
gcloud config set compute/zone us-east4-a
gcloud config set project project--3443695228107877164

# connect to the cluster running the app
gcloud container clusters get-credentials appranix-prod-cluster --zone us-central1-a --project project--3443695228107877164

# Deploying the image
kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:ax-shop
# kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:0.3.12
