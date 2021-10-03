#!bin/bash

cd terraform 
terraform init
terraform state pull
terraform destroy -auto-approve -input=false

gsutil rm -r gs://roxy-cloud-run-bucket

cd ..