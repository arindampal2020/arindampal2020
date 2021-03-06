export BUCKET=$(gcloud config get-value project)-ml
export REGION="us-central1"
echo "Current bucket id $BUCKET and region is $REGION"
echo "Downloading onboarding  scripts"
git clone https://github.com/arindampal2020/arindampal2020.git
gsutil cp arindampal2020/cluster_initialize.sh gs://$BUCKET/cluster_initialize.sh
echo "Downloading Application Project"
git clone https://github.com/arindampal2020/t-talks-handson.git
gsutil -m cp -r t-talks-handson gs://$BUCKET/app/t-talks-handson
echo "Downloading Data"
git clone https://github.com/dgadiraju/nyse_all.git
gsutil -m cp -r nyse_all gs://$BUCKET/data
echo "Creating MY SQL instances in Cloud..."
#gcloud sql instances create myappdb --database-version=MYSQL_5_7  --cpu=2 --memory=7680MB --region=$REGION --storage-type SSD --storage-size 10GB --activation-policy=ALWAYS
#gcloud sql users set-password root --host % --instance myappdb  --password changeme
