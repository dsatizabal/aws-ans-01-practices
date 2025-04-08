#!/bin/bash
# Deploy to multiple regions with region-specific CIDRs
# aws cloudformation describe-stack-events --stack-name MultiRegionVPC-us-east-1
# REGIONS=("us-east-1" "us-west-2" "eu-central-1")
REGIONS=("us-east-1")

for i in "${!REGIONS[@]}"; do
  region=${REGIONS[$i]}

  aws cloudformation deploy \
    --region $region \
    --template-file region.yaml \
    --stack-name "MultiRegionVPC-$region" \
    --parameter-overrides \
        Region=$region \
    --capabilities CAPABILITY_AUTO_EXPAND
done
