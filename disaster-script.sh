#!bin/sh
# Copyright (c) 2019, Appranix, Inc.
# All Rights Reserved.

name_of_the_managed_zone="dev-zone"
dns_name_for_record_set="catalogdb.gcpdev.appranix.info"
a_record_of_app="34.67.177.102"
namespace="sock-shop"
deployments="deployments/catalogue"
replica_count=0
# k8s_service_name="front-end"
gke_cluster_name="gke-demo-cluster-eus"
gcp_region="us-east1"
gcp_project="appranix-managed-dev-01"

# deleting the A record
delete_dns_record()
{
  # remove the transcation.yaml file
  rm -rf deploy/transaction.yaml

  gcloud dns record-sets transaction start --zone $name_of_the_managed_zone

  a_record_of_app=`dig +short $dns_name_for_record_set`
  gcloud dns record-sets transaction remove "$a_record_of_app" --name="$dns_name_for_record_set" --ttl="60" --type="A" --zone="$name_of_the_managed_zone"

  gcloud dns record-sets transaction execute --zone $name_of_the_managed_zone

  sleep 20
}

echo "******** Disaster has started ********"


if [ -e /root/.kube/config ]; then
  # backup the existing kubeconfig file
  mv /root/.kube/config /root/.kube/config.bak
fi
echo '1'
delete_dns_record
echo '2'

# Generates the kubeconfig of the cluster in which disaster to be happened
gcloud beta container clusters get-credentials $gke_cluster_name --region $gcp_region --project $gcp_project
echo '3'

# Delete the resources( Deployment, ReplicaSet, Replication Controller, or Job ) in gke cluster
#kubectl scale deploy -n $namespace --replicas=$replica_count --all

kubectl scale --replicas=$replica_count $deployments -n $namespace
echo '4'

sleep 30
echo '5'

replica_count=1
echo '6'

kubectl scale --replicas=$replica_count $deployments -n $namespace
echo '7'

sleep 20

echo "******** Disaster has occured ********"
