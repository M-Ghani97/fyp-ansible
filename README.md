# OpenStack Deployment
A user-friendly platform to automate the whole process of cloud development which can
eliminate the time of deployment and substantial cost of hiring professional, based on an open-
source software OpenStack. The OpenStack provides multiple cloud components for different use
cases, and because of its open nature, anyone can add additional components to OpenStack to
meet their needs. This makes the installation of OpenStack for the common user very confusing
and time-consuming. The idea behind our product is to automate the whole process of cloud
development. For this, we need some sort of automation tool that should generate server
configuration files on run-time and help us to achieve our goal. Automation tools play an
important role in terms of server configuration and management. These tools use provisioning
scripts to make the server reach a desirable state. Our product has automated the process of
configuring individual components of OpenStack using an automation tool and provide users an
effortless installation of the cloud. Different scripts are created to automatically fetch the
required components and configure them according to the specification set by the user. These
scripts are written in YML language and we have used Ansible as our configuration manager. It
detours all barriers and provides users with their own cloud platform running on their machine.
### 1. Install Repo
yum install mycloud -y
### 2. Add Target Hosts
./mycloud.sh node add <node_name> <nodes_ip(s)>
* ./mycloud.sh node add controller 1.1.1.1 2.2.2.2
### 3. Introspect Target Nodes
./mycloud.sh node introspect <target_host_username>
* ./mycloud.sh node introspect stack
### 4. Start Deployment
./mycloud.sh deploy 

## Other Commands
### Remove Target Hosts
./mycloud.sh node delete <nodes_ip(s)>
### List Target Hosts
./mycloud node list
