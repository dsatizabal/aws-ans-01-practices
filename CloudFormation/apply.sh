#!/bin/bash
# Deploy to multiple regions with region-specific CIDRs
REGIONS=("us-east-1" "us-west-2" "eu-central-1")

for i in "${!REGIONS[@]}"; do
  region=${REGIONS[$i]}

  aws cloudformation deploy \
    --region $region \
    --template-file region.yaml \
    --stack-name "MultiRegionVPC-$region" \
    --parameter-overrides \
        Region=$region
done
