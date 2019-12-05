echo "### Set up keys for ssh for spark cluster"
if [ ! -f ~/.ssh/spark_rsa.pub ]; then
    ./bin/gen-key.sh
fi

echo "### Run download.sh to download spark."
if [ ! -f ./resources/dist/spark-2.4.4-bin-hadoop2.7.tgz ]; then
    ./bin/download.sh
fi 

echo "### Run vagrant up to bring up the spark cluster"
vagrant up

echo "Add nodes to your /etc/hosts file for connivence"
x=`cat /etc/hosts|grep node0`
if [ ${#x} -eq 0 ];then 
sudo bash -c 'cat >> /etc/hosts <<EOL
192.168.50.20  bastion
192.168.50.4  node0
192.168.50.5  node1
192.168.50.6  node2
192.168.50.7  node3
192.168.50.8  node4
192.168.50.9  node5
EOL
'
fi

echo "#### Add known_hosts to avoid ansible issues."
ssh-keyscan node0 node1 node2  > ~/.ssh/known_hosts

echo "### Ensure all of the servers are up"
ansible nodes  -m ping

echo "### Add keys to the spark nodes"
ansible-playbook playbooks/keyscan.yml

echo "Install Spark Servers, prerequisites, and TICK stack"
./doAnsiblePlaybook.sh