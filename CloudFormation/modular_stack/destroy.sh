#!/bin/bash
# Deploy to multiple regions with region-specific CIDRs
REGIONS=("us-east-1" "us-west-2" "eu-central-1")
# REGIONS=("us-east-1")

for i in "${!REGIONS[@]}"; do
  region=${REGIONS[$i]}

  aws cloudformation delete-stack \
    --region $region \
    --stack-name "MultiRegionVPC-$region"
done
