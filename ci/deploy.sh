#!/bin/bash

export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
export BUCKET="${BUCKET}"
export CLOUDFRONT_DISTRIBUTION_ID="${CLOUDFRONT_DISTRIBUTION_ID}"

[[ -z "${AWS_ACCESS_KEY_ID}" ]] && echo "AWS_ACCESS_KEY_ID is missing"


aws s3 sync build/ "s3://${BUCKET}"
aws cloudfront create-invalidation --distribution-id "${CLOUDFRONT_DISTRIBUTION_ID}" --path "/*"