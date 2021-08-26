export PROJECT_ID=$(gcloud config get-value project)-ml
export REGION="us-central1"
echo "Current Project id $PROJECT_ID and region is $REGION"
export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32
gcloud sql instances patch flights --authorized-networks $ADDRESS
echo "Creating Pyspark Cluster..."
gcloud dataproc clusters create my-cluster --region=$REGION --initialization-actions="gs://${PROJECT_ID}/cluster_initialize.sh" --num-workers=5 --max-age="2h"
