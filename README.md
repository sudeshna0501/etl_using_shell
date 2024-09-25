**cp-access-log.sh**
This script downloads the file 'web-server-access-log.txt.gz' from "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/".

The script then extracts the .txt file using gunzip.

The .txt file contains the timestamp, latitude, longitude and visitor id apart from other data.

Transforms the text delimeter from "#" to "," and saves to a csv file.
Loads the data from the CSV file into the table 'access_log' in PostgreSQL database.
Download the access log file


**etl_server_access_log_processing.py** 
This is an airflow DAG that will extract a file from a remote server and then transform the content and load it into a file.

The file URL is given below:
https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Apache%20Airflow/Build%20a%20DAG%20using%20Airflow/web-server-access-log.txt

The server access log file contains these fields.

a. timestamp - TIMESTAMP
b. latitude - float
c. longitude - float
d. visitorid - char(37)
e. accessed_from_mobile - boolean
f. browser_code - int


**etl_kafka.sh**
This is a shell script containing Kafka CLI that are used to work with streaming data using Kafka.
