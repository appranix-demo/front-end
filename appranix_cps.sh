#!/usr/bin/env bash

curl -XPOST -H 'Accept: application/json' -H "Content-type: application/json" -d '{"protectionPlanId": "21556513:1954153:6a74bbe3-07cd-4c09-80d3-6b7b9f7699fe", "policyName": "ON_DEMAND", "protectionPolicyId": "ON_DEMAND_POLICY_ID", "accountId": 21556513, "organizationId": 1954153,"clusterName": "cps-demo", "jobType": "BACKUP", "scheduleType": "MANUAL"}' 'https://qa.appranix.net/cps-api/api/v1/job'
sleep 10
