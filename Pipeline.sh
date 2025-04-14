#!/bin/bash

set -e

echo "Running pipeline..."

# Create a directory for the output
mkdir -p /home/ec2-user/output

# Simulate work by creating a file
echo "Pipeline output at $(date)" > /home/ec2-user/output/result.txt

# Upload the output to S3
aws s3 cp /home/ec2-user/output/result.txt s3://$S3_BUCKET_NAME/result-$(date +%s).txt

echo "Artifact uploaded to S3."
