export PROJECT_ID=$(gcloud config get-value project)-ml
export REGION="us-central1"
echo "Current Project id $PROJECT_ID and region is $REGION"
export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32
echo "Updating MY SQL network"
gcloud sql instances patch flights --authorized-networks $ADDRESS
echo "Updating config.xml"
gsutil cp ./SparkTest-0.0.0/common/config.xml gs://$PROJECT_ID/app/SparkTest-0.0.0/common/config.xml
echo "Creating Pyspark Cluster..."
gcloud dataproc clusters create my-cluster --region=$REGION --initialization-actions="gs://${PROJECT_ID}/cluster_initialize.sh" --num-workers=3 --max-age="2h"
