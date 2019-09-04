#!/usr/bin/env bash

#curl -XPOST -H 'Accept: application/json' -H "Content-type: application/json" -d '{"protectionPlanId": "21556513:1954153:6a74bbe3-07cd-4c09-80d3-6b7b9f7699fe", "policyName": "ON_DEMAND", "protectionPolicyId": "ON_DEMAND_POLICY_ID", "accountId": 21556513, "organizationId": 1954153,"clusterName": "cps-demo", "jobType": "BACKUP", "scheduleType": "MANUAL"}' 'https://qa-api.appranix.net/cps-api/api/v1/job'
# curl -XPOST -H 'Accept: application/json' -H "Content-type: application/json" -d '{"protectionPlanId": "217:3119689:1d4be6d3-dee2-45a6-a153-825ba29be989", "policyName": "ON_DEMAND", "protectionPolicyId": "ON_DEMAND_POLICY_ID", "accountId": 217, "organizationId": 3119689,"clusterName": "gke-demo-cluster1-eus", "jobType": "BACKUP", "scheduleType": "MANUAL"}' 'https://api.appranix.net/cps-api/api/v1/job'

curl -XPOST -H 'Accept: application/json' -H "Content-type: application/json" -d '{"protectionPlanId": "217:3119689:0791e318-83c2-4f74-8c2a-ce9f48bcba8a", "policyName": "ON_DEMAND", "protectionPolicyId": "ON_DEMAND_POLICY_ID", "accountId": 217, "organizationId": 3119689,"clusterName": "gke-demo-cluster-eus-01", "jobType": "BACKUP", "scheduleType": "MANUAL"}' 'https://api.appranix.net/cps-api/api/v1/job'
sleep 10
