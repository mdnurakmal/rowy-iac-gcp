#!/bin/bash
gcloud config set project $1
gsutil -q stat gs://roxy-cloud-run-bucket/terraform/state/default.tfstate

return_value=$?

if [[ $return_value == 0 ]] 
then
    echo "bucket exist"
else
    gsutil mb gs://roxy-cloud-run-bucket
fi