# 13-project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting accessing to the network.
- Load balancing is the process of dispersing incoming requests/tasks over a set of resources to prevent disproportionate skewing of requests toward one server in particular. This can be particularly helpful in the event of a DoS attack on one of the servers, rendering it unavailable for customers.
As a result, services (for instance, sales) are still able to operate even during the attack since the load balancer distributes traffic between the primary server and alternate server when it is overloaded. Hackers can also be prevented from accessing specific servers by configuring it.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.

 Filebeat gathers data about the file system. It detects changes to certain important files stamped by time, such as if a hacker attempts to change etc/passwd, and sends that information to Elasticsearch on the ELK server

Metricbeat collects metrics to help evaluate the operation of the computers on the network (VMs here) and then sends them to Elasticsearch on the ELK Server. It can provide information regarding CPU usage, memory disk I/O, Network I/O, and Uptime, for example  

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.8   | Linux            |
| TODO     | Server   | 10.0.0.12  | Linux              |
| TODO     | Server   | 10.0.0.13  |  linux           |
| TODO     | Elk Server| 10.2.0.4  |  Linux                |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed Via SSH using the designated Admin IP address
- 

Machines within the network can only be accessed by the Jump-Box
Jump-Box is the only device that can connect to it, and its IP address is 10.0.0.8

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |  No                 |    10.0.0.8          |
| Web-1    |  NO                 |    10.0.0.12         |
|  Web-2   |  No                 |    10.0.0.13         |
|  ELK     |  No                 |    10.2.0.4          | 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
This simplifies the process of adding new machines or updating existing ones simultaneously.

The playbook implements the following tasks:
Install docker.io
Install Python-pip
Install docker container
Launch docker container: elk
Command: sysctl -w vm.max_map_count=262144

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.


![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web-1 10.0.012, Web-2 10.0.0.13

We have installed the following Beats on these machines: Filebeat and Metricbeat


These Beats allow us to collect the following information from each machine:
Filebeat collects log events and forwards them to Elasticsearch and Logstash for indexing.
The metrics collected by Metricbeat come from the operating system and the server's services.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/files/
- Update the /etc/ansible/hostsfile to include ELK server IP address: 10.1.0.4
- Run the playbook,install-elk.yml  and navigate to /etc/ansible/http://VM IP/:5601 to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- The playbook file is install-elk.yml and its copied in /etc/ansible
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on? A private IP address can be specified under "servers" to specify which machine the ELK server should be installed on vs FileBea
- _Which URL do you navigate to in order to check that the ELK server is running? http://[your.ELK-VM.External.IP]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._