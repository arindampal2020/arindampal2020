export PROJECT_ID=$(gcloud config get-value project)
echo $PROJECT_ID
git clone https://github.com/arindampal2020/SparkTest-0.0.0.git
gsutil cp -r SparkTest-0.0.0 gs://$PROJECT_ID/app/SparkTest-0.0.0
git clone https://github.com/dgadiraju/nyse_all.git
gsutil cp -r nyse_all gs://$PROJECT_ID/data
