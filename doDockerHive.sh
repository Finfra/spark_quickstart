git clone https://github.com/big-data-europe/docker-hive
cd docker-hive
docker-compose up&
docker cp ../hiveScript.sh docker-hive_hive-server_1:/root/
docker exec -it docker-hive_hive-server_1 bash /root/hiveScript.sh
docker exec -it docker-hive_hive-server_1 hive --hiveconf hive.metastore.uris=thrift://192.168.50.1:9083 -e "select * from dept;"
