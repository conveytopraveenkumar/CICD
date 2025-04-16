#!/bin/bash
 
 set -e
 
 echo "Running pipeline..."
 
 # Create a directory for the output
 mkdir -p /home/ubuntu/output
 
 # Simulate work by creating a file
 echo "Pipeline output at $(date)" > /home/ubuntu/output/result.txt
 
 cd /home/ubuntu/output
 chmod +r /home/ubuntu/output/result.txt
 ls -lart
 pwd
 sudo apt update
 sudo apt install awscli
 aws --version
 echo "copying file from EC2 to S3 bucket
 # Upload the output to S3
 aws s3 cp /home/ubuntu/output/result.txt s3://cicd-github-artifacts-bucket/result-$(date +%s).txt
 
 echo "Artifact uploaded to S3."
