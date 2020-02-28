#!/bin/bash
set -eo pipefail
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name java-maven --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text)

while true; do
  aws lambda invoke --function-name $FUNCTION --payload file://event.json out.json
  sleep 2
done
