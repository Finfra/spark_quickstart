DOWNLOAD_FILE=spark-2.4.4-bin-hadoop2.7
DOWNLOAD_LINK="http://apache.spinellicreations.com/spark/spark-2.3.0/${DOWNLOAD_FILE}.tgz"
DOWNLOAD_LINK="http://apache.mirror.cdnetworks.com/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz"

mkdir -p resources/dist
cd resources/dist
wget ${DOWNLOAD_LINK}
tar xvzf "${DOWNLOAD_FILE}.tgz"
