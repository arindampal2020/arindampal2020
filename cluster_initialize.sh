#!/bin/bash
export PROJECT_ID=$(gcloud config get-value project)-ml
echo "Current Project- $PROJECT_ID "
gsutil -m cp -r gs://$PROJECT_ID/app/t-talks-handson/ .
cd t-talks-handson
pip install -r requirements.txt .
