
export PROJECT_ID=$(gcloud config get-value project)
export REGION="us-central1"
export MYSQLIP=$(gcloud sql instances describe flights --format="value(ipAddresses.ipAddress)")
mysql -uroot -pchangeme -h $MYSQLIP < 01_nyse_create_table_quickstart.sql
gunzip ./nyse_all/nyse_data/
for f in ./nyse_all/nyse_data/*.txt
do
  unlink stock_eod.txt
  ln -s $f stock_eod.txt
  mysqlimport \
    --host=$MYSQLIP \
    --user=root \
    --password=Passw0rd \
    --fields-terminated-by=',' \
    --lines-terminated-by='\n' \
    --local \
    --lock-tables \
    --verbose \
    nyse stock_eod.txt
      
echo "Done: '"$f"' at $(date)"
done

