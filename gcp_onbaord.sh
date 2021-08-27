export BUCKET=$(gcloud config get-value project)-ml
export REGION="us-central1"
echo "Current bucket id $BUCKET and region is $REGION"
echo "Downloading onboarding  scripts"
git clone https://github.com/arindampal2020/arindampal2020.git
gsutil cp arindampal2020/cluster_initialize.sh gs://$BUCKET/cluster_initialize.sh
echo "Downloading Application Project"
git clone https://github.com/arindampal2020/SparkTest-0.0.0.git
gsutil -m cp -r SparkTest-0.0.0 gs://$BUCKET/app/SparkTest-0.0.0
echo "Downloading Data"
git clone https://github.com/dgadiraju/nyse_all.git
gsutil -m cp -r nyse_all gs://$BUCKET/data
echo "Creating MY SQL instances in Cloud..."
#gcloud sql instances create myappdb --database-version=MYSQL_5_7  --cpu=2 --memory=7680MB --region=$REGION --zone ${REGION}-a --storage-type SSD --storage-size 10GB --activation-policy=ALWAYS
#gcloud sql users set-password root --host % --instance myappdb  --password changeme
