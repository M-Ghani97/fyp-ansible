# OpenStack Deployment
## Install Repo
* yum install mycloud -y
## Add Target Hosts
* ./mycloud.sh node add <node_name> <nodes_ips>
## Introspect Target Nodes
* ./mycloud.sh node introspect <target_host_username>
## Start Deployment
* ./mycloud.sh deploy 
