# Install Java JDK and command line utils
ansible-playbook playbooks/yum-nodes.yml
# Install the Spark master node on node0
ansible-playbook playbooks/install-spark-master.yml
# Install the Spark slave nodes on node1 and node2
ansible-playbook playbooks/install-spark-slave.yml
# Install the Spark history job server on node0
ansible-playbook playbooks/install-spark-history.yml
# Install the telegraf on all nodes but statsD input on node1
ansible-playbook playbooks/install-telegraf.yml
# Configure Spark Metrics system to output to systemd
ansible-playbook playbooks/configure-metrics.yml
# Install the influxdb and chronograf on node2
ansible-playbook playbooks/install-influxdb.yml
