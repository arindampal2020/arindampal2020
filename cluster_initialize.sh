#!/bin/bash
export BUCKET=$(gcloud config get-value project)-ml
echo "Current bucket- $BUCKET "
gsutil -m cp -r gs://$BUCKET/app/t-talks-handson/ .
cd t-talks-handson
pip install -r requirements.txt .
