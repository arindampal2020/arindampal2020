export BUCKET=$(gcloud config get-value project)-ml
export REGION="us-central1"
export PY_SCRIPT="gs://$BUCKET/app/SparkTest-0.0.0/PythonPrep/stock_export.py"
export JAR="gs://$BUCKET/app/SparkTest-0.0.0/common/jar/mysql-connector-java-8.0.26.jar"
echo "Submitting Pyspark Jobs \n Script- $PY_SCRIPT \n Jar- $JAR "
gcloud dataproc jobs submit pyspark --cluster=my-cluster "$PY_SCRIPT" --jars=$JAR --region $REGION --zone ${REGION}-a -- "nyse" "stock_eod"
