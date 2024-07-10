#!/usr/bin/env bash

# export TERRAFORM_WORKSPACE=jason-local-farm-runner
export TF_STATE_BUCKET="dtamboli-terraform-state"
export TF_STATE_OBJECT_KEY="serverless-jenkins-fargate.tfstate"
export TF_LOCK_DB="terraform-state"
export AWS_REGION=us-east-1

PRIVATE_SUBNETS='["subnet-02b8f74373451eb2d","subnet-067d36f578120faed"]'
PUBLIC_SUBNETS='["subnet-104c4a5a","subnet-02cfbf5e"]'

export TF_VAR_route53_zone_id="ZHD15ICGS1DY5"
export TF_VAR_route53_domain_name="danishandalmas.com"
export TF_VAR_vpc_id="vpc-8750d3fd"
export TF_VAR_efs_subnet_ids=${PRIVATE_SUBNETS}
export TF_VAR_jenkins_controller_subnet_ids=${PRIVATE_SUBNETS}
export TF_VAR_alb_subnet_ids=${PUBLIC_SUBNETS}
export TF_VAR_alb_acm_certificate_arn="arn:aws:acm:us-east-1:912910966231:certificate/59419f83-7191-4d71-b76e-d158db59ad86"
