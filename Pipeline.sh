#!/bin/bash
 
 set -e
 
 echo "Running pipeline..."
 
 # Create a directory for the output
 mkdir -p /home/ubuntu/output
 
 # Simulate work by creating a file
 echo "Pipeline output at $(date)" > /home/ubuntu/output/result.txt
 
 # Upload the output to S3
 aws s3 cp /home/ubuntu/output/result.txt s3://$S3_BUCKET_NAME/result-$(date +%s).txt
 
 echo "Artifact uploaded to S3."
