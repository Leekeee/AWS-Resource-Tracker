#!/bin/bash
#
###########################################
# Author: Olanrewaju Gbemileke
# Date: 12/07/2024
#
# Version: v1
#
# This script will report the AWS resource usage in the following:
# EC2
# S3
# Lambda
# IAM Users
##########################################
#

set -x #debug mode

echo "Print EC2 report"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo "Print S3 information"
aws s3 ls

echo "Print Lambda report"
aws lambda list-functions

echo "Print IAM Users information"
aws iam list-users
