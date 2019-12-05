echo  "# Install Java JDK and command line utils"
ansible-playbook playbooks/yum-nodes.yml
echo  "# Install the Spark master node on node0"
ansible-playbook playbooks/install-spark-master.yml
echo  "# Install the Spark slave nodes on node1 and node2"
ansible-playbook playbooks/install-spark-slave.yml
echo  "# Install the Spark history job server on node0"
ansible-playbook playbooks/install-spark-history.yml
echo  "# Install the telegraf on all nodes but statsD input on node1"
ansible-playbook playbooks/install-telegraf.yml
echo  "# Configure Spark Metrics system to output to systemd"
ansible-playbook playbooks/configure-metrics.yml
echo  "# Install the influxdb and chronograf on node2"
ansible-playbook playbooks/install-influxdb.yml
