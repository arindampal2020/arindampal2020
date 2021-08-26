
export PROJECT_ID=$(gcloud config get-value project)
export REGION="us-central1"
export MYSQLIP=$(gcloud sql instances describe myappdb --format="value(ipAddresses.ipAddress)")
gunzip nyse_all/nyse_data/NYSE*.gz
for f in 'ls nyse_all/nyse_data/NYSE*txt'
do
mv f stock_eod_${counter}
mysqlimport --local --host=$MYSQLIP --user=root --pchangeme --fields-terminated-by=','  --lines-terminated-by='\n' nyse stock_eod_*
counter=$((counter+1))
done
