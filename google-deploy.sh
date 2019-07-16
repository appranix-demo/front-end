#!/usr/bin/env bash
echo $GOOGLE_AUTH_JSON
echo $GOOGLE_AUTH_EMAIL
echo $GOOGLE_PROJECT_ID
cat /usr/bin/codeship_google

# gcloud default values
gcloud config set account ax-mng-dev-cloudsql-test@appranix-managed-dev-01.iam.gserviceaccount.com
gcloud config set project appranix-managed-dev-01

echo $GOOGLE_AUTH_JSON
echo $GOOGLE_AUTH_EMAIL
echo $GOOGLE_PROJECT_ID

# Use the codeship_gce_service to authenticate
echo "Authenticating"
codeship_google authenticate

# connect to the cluster running the app
#gcloud container clusters get-credentials qa-cps-test-cluster --zone us-central1-a --project appranix-managed-dev-01
gcloud container clusters get-credentials gke-demo-cluster-eus --region us-east1 --project appranix-managed-dev-01

# Deploying the image
kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:ax-shop
# kubectl -n sock-shop set image deployment/front-end front-end=gcr.io/appranix-public-cr/sock-shop/front-end:0.3.12
