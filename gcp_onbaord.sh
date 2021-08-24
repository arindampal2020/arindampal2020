git clone arindampal2020/SparkTest-0.0.0
gsutil cp -r SparkTest-0.0.0 gs://"$GCP_PROJECT"/app/SparkTest-0.0.0
git clone https://github.com/dgadiraju/nyse_all.git
gsutil cp -r nyse_all gs://"$GCP_PROJECT"/data