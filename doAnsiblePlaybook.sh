echo  "# Install Java JDK and command line utils"
ansible-playbook playbooks/yum-nodes.yml
echo  "# Install the Spark master node on node0"
ansible-playbook playbooks/install-spark-master.yml
echo  "# Install the Spark slave nodes on node1 and node2"
ansible-playbook playbooks/install-spark-slave.yml
echo  "# Install the Spark history job server on node0"
ansible-playbook playbooks/install-spark-history.yml
echo  "# Install pip on node0"
ansible-playbook playbooks/install-spark-history.yml
echo  "# Setup Enviroment Values to nodes"
ansible-playbook playbooks/env.yml
