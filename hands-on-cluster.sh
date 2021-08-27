#!/bin/bash
export BUCKET=$(gcloud config get-value project)-ml
export REGION="us-central1"
echo "Current Buket is $BUCKET and region is $REGION"
export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32
echo "Updating MY SQL network"
gcloud sql instances patch flights --authorized-networks $ADDRESS
echo "Updating config.xml"
gsutil cp ./t-talks-handson/main/config.xml gs://$BUCKET/app/t-talks-handson/main/config.xml
echo "Creating Pyspark Cluster..."
gcloud dataproc clusters create my-cluster --region=$REGION --zone ${REGION}-a --initialization-actions="gs://${BUCKET}/cluster_initialize.sh" --num-workers=2 --max-age="2h" --driver-log-levels root=FATAL

CLUSTERIP=$(gcloud sql instances describe my-cluster --format="value(ipAddresses.ipAddress)")
echo $CLUSTERIP
gcloud sql instances patch flights --authorized-networks $CLUSTERIP
