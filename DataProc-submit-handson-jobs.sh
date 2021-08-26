export PROJECT_ID=$(gcloud config get-value project)-ml
export REGION="us-central1"
export PY_SCRIPT="gs://$PROJECT_ID/app/t-talks-handson/PythonPrep/stock_export.py"
export JAR="gs://$PROJECT_ID/app/t-talk-handson/main/jar/mysql-connector-java-8.0.26.jar"
echo "Submitting Pyspark Jobs \n Script- $PY_SCRIPT \n Jar- $JAR "
gcloud dataproc jobs submit pyspark --cluster=my-cluster "$PY_SCRIPT" --jars=$JAR --region $REGION -- "nyse" "stock_eod"
