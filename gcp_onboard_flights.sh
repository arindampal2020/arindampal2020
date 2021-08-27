git clone  https://github.com/GoogleCloudPlatform/data-science-on-gcp/
cd data-science-on-gcp/03_sqlstudio
export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=${PROJECT_ID}-ml
export REGION="us-central1"
echo "Create Cloud Instances"
gcloud sql instances create flights   --tier=db-n1-standard-1 --activation-policy=ALWAYS --region $REGION --zone ${REGION}-a
gcloud sql users set-password root --host % --instance flights  --password Passw0rd

export ADDRESS=$(wget -qO - http://ipecho.net/plain)/32
gcloud sql instances patch flights --authorized-networks $ADDRESS

MYSQLIP=$(gcloud sql instances describe flights --format="value(ipAddresses.ipAddress)")
echo $MYSQLIP

mysql --host=$MYSQLIP --user=root   -pPassw0rd --verbose < create_table.sql

counter=0
for FILE in 201501.csv 201502.csv; do
   gsutil cp gs://$BUCKET/flights/raw/$FILE \
             flights.csv-${counter}
   counter=$((counter+1))
done

mysqlimport --local --host=$MYSQLIP --user=root -pPassw0rd --ignore-lines=1 --fields-terminated-by=',' bts flights.csv-*
