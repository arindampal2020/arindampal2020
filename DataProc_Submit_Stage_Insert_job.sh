export PROJECT_ID=$(gcloud config get-value project)
export REGION="us-central1"
export PY_SCRIPT="gs://$PROJECT_ID/app/SparkTest-0.0.0/PythonPrep/stock_insert.py"
export JAR="gs://$PROJECT_ID/app/SparkTest-0.0.0/common/jar/mysql-connector-java-8.0.26.jar"
export DATA="gs://$PROJECT_ID/data/nyse_data"
echo "Submitting Pyspark Jobs \n Script- $PY_SCRIPT \n Jar- $JAR "
gcloud dataproc jobs submit pyspark --cluster=cluster-1417 "$PY_SCRIPT" --jars=$JAR  --region $REGION -- "nyse" $DATA
