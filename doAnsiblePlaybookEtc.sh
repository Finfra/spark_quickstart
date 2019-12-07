# echo  "# Install the telegraf on all nodes but statsD input on node1"
ansible-playbook playbooks/install-telegraf.yml
# echo  "# Configure Spark Metrics system to output to systemd"
ansible-playbook playbooks/configure-metrics.yml
# echo  "# Install the influxdb and chronograf on node2"
ansible-playbook playbooks/install-influxdb.yml