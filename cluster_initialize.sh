echo "Current Project $GCP_PROJECT"
gsutil cp -r gs://"$GCP_PROJECT"/app/SparkTest-0.0.0/ SparkTest/
cd SparkTest
pip install -r requirements.txt .
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
chmod +x cloud_sql_proxy
cloud_sql_proxy
