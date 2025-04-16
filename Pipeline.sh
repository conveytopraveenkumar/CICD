echo "Running pipeline..."

# Create a directory for the output
mkdir -p /home/ubuntu/output

# Simulate work by creating a file
echo "Pipeline output at $(date)" > /home/ubuntu/output/result.txt

cd /home/ubuntu/output
chmod +r result.txt
ls -lart
pwd

# Ensure AWS CLI is installed
aws --version || { echo "AWS CLI not installed! Exiting..."; exit 1; }

echo "Copying file from EC2 to S3 bucket..."

# Upload the file to S3 with debug mode to catch errors
aws s3 cp result.txt s3://cicd-github-artifacts-bucket/result-$(date +%s).txt --debug

echo "Artifact uploaded to S3."
