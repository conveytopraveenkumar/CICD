name: AWS CI/CD Workflow

on:
  push:
    branches:
      - main

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: Launch EC2 Instance
        run: |
          INSTANCE_ID=$(aws ec2 run-instances --image-id ami-12345678 \
            --count 1 --instance-type t2.micro --key-name my-key \
            --query 'Instances[0].InstanceId' --output text)
          echo "EC2 Instance Launched: $INSTANCE_ID"

      - name: Run Hello World Script
        run: |
          echo "Hello World!" > output.txt

      - name: Upload Artifacts to S3
        run: |
          aws s3 cp output.txt s3://my-bucket-name/output.txt
