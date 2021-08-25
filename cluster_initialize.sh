export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID
gsutil -m cp -r gs://$PROJECT_ID/app/SparkTest-0.0.0/ .
cd SparkTest-0.0.0
pip install -r requirements.txt .
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
chmod +x cloud_sql_proxy
cloud_sql_proxy
