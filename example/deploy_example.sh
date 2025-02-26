#!/usr/bin/env bash
set -e

cd example

source vars.sh

# Start from a clean slate
rm -rf .terraform

terraform init \
    -backend=true \
    -backend-config key="${TF_STATE_OBJECT_KEY}" \
    -backend-config bucket="${TF_STATE_BUCKET}" \
    -backend-config dynamodb_table="${TF_LOCK_DB}"

terraform plan \
    -lock=false \
    -input=false \
    -out=tf.plan

terraform show -json tf.plan | jq '.resource_changes[] | "\(.address) -> \(.change.actions[])"'

# terraform apply \
#     -input=false \
#     -auto-approve=true \
#     -lock=true \
#     tf.plan
