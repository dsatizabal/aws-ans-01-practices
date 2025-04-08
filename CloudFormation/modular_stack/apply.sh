#!/bin/bash

REGIONS=("us-east-1" "us-west-2" "eu-central-1")
BUCKET_NAME="cloudformationdsp"

for region in "${REGIONS[@]}"; do
  echo "Deploying to $region"
  aws cloudformation deploy \
    --region "$region" \
    --template-file region.yaml \
    --stack-name "MultiRegionVPC-$region" \
    --parameter-overrides \
        Region="$region" \
        TemplateBucket="$BUCKET_NAME" \
    --capabilities CAPABILITY_AUTO_EXPAND
done
