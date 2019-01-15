# Selenium Grid:Bareback

Single BASH script file that takes a number of nodes from user and creates a ready to use Selenium Grid on fresh cloud infrastructure. VPC, SUBNET, NETWORK ACL, INTERNET GATEWAY, ROUTE TABLE, SECURITY GROUP, KEY PAIR and EC2s all created for the sole purpose. 

Runs through a script and then performs a test at the end with screenshots.

No containerisation is used (hence 'bareback'). Firefox and chrome are both installed, along with all required dependancies for them to run in both headed and headless modes using Xvfb (installed as part of the script).

Options are given to teardown (terraform destroy), re-run Ansible playbooks and run a test (using nodeJS).

## Requirements
 - AWS account
 - Terraform
 - Ansible


## Walk-through
### Create
 - Creates RSA key locally
 - terraform apply takes this and pre-entered AWS credentials to:
    - create a VPC called "SELENIUM_GRID_VPC"
    - create a subnet on "SELENIUM_GRID_VPC" called "SELENIUM_GRID_Subnet"
    - upload the public key created earlier to AWS under name of "SELENIUM_GRID_KEY_PAIR"
    - create a Security Group called "SELENIUM_GRID_Security_Group" with the following ports open:
       - Ingress rules:
          - SSH 22
          - HTTP 80
          - HTTPS 443
          - Selenium Grid Hub listening port 4444
          - Selenium Grid Nodes listening port 5555
          - Echo Request
          - Echo Reply
       - Egress rules:
          - All traffic
    - create Network ACL called "SELENIUM_GRID_Security_ACL"
       - Ingress rules:
          - SSH 22
          - HTTP 80
          - HTTPS 443
          - Selenium Grid Hub listening port 4444
          - Echo Request
          - Echo Reply
          - Ephemeral ports 1024 to 65,535 (In order for HTTPS to function for connections requested from within the network, Amazon reuires these ports be opened on ACL. See the note at the bottom of [this page](https://aws.amazon.com/premiumsupport/knowledge-center/connect-http-https-ec2/#element-6f650e15-6a54-4343-b741-47235c083902)
       - Egress rules:
          - All traffic
    - create an Internet Gateway on "SELENIUM_GRID_VPC" called "SELENIUM_GRID_GW"
    - create a Route Table on "SELENIUM_GRID_VPC" called "SELENIUM_GRID_route_table" directing outbound traffic (0.0.0.0/0) through "SELENIUM_GRID_GW"
    - create a Route Table Association between "SELENIUM_GRID_Subnet" and "SELENIUM_GRID_GW"
    - create AWS instances
       - Hub
          - Default AMI is an Amazon Linux (free tier) image with almost nothing installed
          - instance type is t2.micro (free tier)
          - Security group is "SELENIUM_GRID_Security_Group"
          - Placed on "SELENIUM_GRID_Subnet"
          - Key pair assigned is "SELENIUM_GRID_KEY_PAIR"
          - Public IP address (v4) is requested
          - Given tag:  Name = "Selenium - Hub"
          - Public and Private IP addresses are output to "hub.txt" in working directory
       - Node(s)
          - Default AMI is an Amazon Linux (free tier) image with almost nothing installed
          - instance type is t2.micro (free tier)
          - Security group is "SELENIUM_GRID_Security_Group"
          - Placed on "SELENIUM_GRID_Subnet"i
          - Key pair assigned is "SELENIUM_GRID_KEY_PAIR"
          - Public IP address (v4) is requested
          - Given tag:  Name = "Selenium - Node $" where '$' is the node number
          - Public and Private IP addresses of each node are output to "nodes.txt" in working directory
    - "hosts.ini" file created for Ansible using follwing:
       - [all:vars]
          - use private key created earlier
          - assign user as "ec2-user"
          - disable StrictHostKeyChecking (this is done to enable promptless experience)
       - A seperate section for each EC2 Instance created with its public IP listed 
    - Ping all hosts on a loop (max 300) until all hosts respond (AWS takes a while to finish spinning up instances. We wait until this is done to prevent Ansible from timing out when running the Playbook)
    - create the following installation scripts, ready for Ansible to run:
       - Firefox installtion script - installs firefox (latest Extended Support Release verion) and some of its dependancies (it shares a lot with Chrome so we install them with Chrome and point to them later), installs latest GeckoDriver verion, create symbolic link to make Firefox accessible from anywhere, installs Xvfb to simulate non-existent screen, leaves a marker in the form of a file: "1-Firefox-installed.txt"
       - Chrome Installation script - utilises a fantastic script from [intoli.com](https://intoli.com/install-google-chrome.sh), installs Chrome and all its dependancies into its own folder (non-shared), leaves a marker in the form of a file: "2-Chrome-installed.txt"
       - Post-Chrome installtion script - Installs latest Chromedriver, Renames "google-chrome-stable" to "google-chrome" to suit Selenium, leaves a marker in the form of a file: "3-Post-chrome-installed.txt"
       - Shared-Library script - add Chrome's library directory to "LD_LIBRARY_PATH" and add to .bashrc to give system wide access (mostly for Firefox's sake), leaves a marker in the form of a file: "5-Libraries-shared.txt"
       - nodeConfig.json constructor script - creates a script that when run on a node will construct nodeConfig.json for running Selenium as a Node, leaves a marker in the form of a file: "4-Config-file-created.txt"
       - Selenium Hub script - downloads Selenium Standalone Server if not there already, installs Java 8 if not installed, runs Selenium Standalone Server using nohup (and redirecting stdout to nohup.out) to keep the process alive after disconnecting Ansible's ssh connection, -host command line argument is used, along with the Hub's private IP address to ensure binding to correct network interface (some applications, such as Docker, will install virtual interfaces and if used with Selenium can result in unreliable connections between Nodes and the Hub)
       - Ansible Playbook
          - Hub
             - run the Selenium Hub script 
          - Node $ (where $ is the node number)
             - runs firefox installation script if ~/1-Firefox-installed.txt doesn't exist
             - runs chrome installation script if ~/2-Chrome-installed.txt doesn't exist
             - runs post chrome istalltion script if ~/3-Post-chrome-installed.txt doesn't exist
             - runs nodeConfig.json creation script if ~/4-Config-file-created.txt doesn't exist
             - runs shared library script if ~/5-Libraries-shared.txt doesn't exist
             - runs following in-line shell commands:
                - if Selenium Standalone Server jar file doesn't exist then download it
                - install Java 8, if not installed
                - runs Selenium using "nohup" and redirecting stdout to "nohup.out", using "xvfb-run"to simulate the screen at 1400x1024x24, Selenium role as node, binding to correct network interface using -host, and specifiying config.json as the nodeConfig file
    - Run playbook and specify the hosts.ini file we created using "ansible-playbook playbook.yml -i hosts.ini"
    - Once playbook has run its course, PIPBOY is displayed, along with URLs for the Grid Console and the destination to direct tests

### Destroy
 - Counts the nodes in nodes.txt (created on terraform apply)
 - Runs terraform destroy, passing the number of nodes as command line argument
 - Resets the working dorectory by removing the following files and folders:
    - terraform.tfstate
    - terraform.tfstate.backup
    - hosts.ini
    - hub.txt
    - nodes.txt
    - playbook.yml
    - playbook.retry
    - encrypted_bertha.pem
    - encrypted_bertha.pem.pub
    - pingOutput.txt
    - chrome-install.sh
    - chrome-install.sh-n
    - share-libraries.sh
    - post-chrome-install.sh
    - create-node-config.sh
    - firefox-install.sh
    - seleniumHub.sh
    - test_the_grid
    - .terraform

### Run Playbook (in case it failed during Create)
 - create the following installation scripts, ready for Ansible to run:
       - Firefox installtion script - installs firefox (latest Extended Support Release verion) and some of its dependancies (it shares a lot with Chrome so we install them with Chrome and point to them later), installs latest GeckoDriver verion, create symbolic link to make Firefox accessible from anywhere, installs Xvfb to simulate non-existent screen, leaves a marker in the form of a file: "1-Firefox-installed.txt"
       - Chrome Installation script - utilises a fantastic script from [intoli.com](https://intoli.com/install-google-chrome.sh), installs Chrome and all its dependancies into its own folder (non-shared), leaves a marker in the form of a file: "2-Chrome-installed.txt"
       - Post-Chrome installtion script - Installs latest Chromedriver, Renames "google-chrome-stable" to "google-chrome" to suit Selenium, leaves a marker in the form of a file: "3-Post-chrome-installed.txt"
       - Shared-Library script - add Chrome's library directory to "LD_LIBRARY_PATH" and add to .bashrc to give system wide access (mostly for Firefox's sake), leaves a marker in the form of a file: "5-Libraries-shared.txt"
       - nodeConfig.json constructor script - creates a script that when run on a node will construct nodeConfig.json for running Selenium as a Node, leaves a marker in the form of a file: "4-Config-file-created.txt"
       - Selenium Hub script - downloads Selenium Standalone Server if not there already, installs Java 8 if not installed, runs Selenium Standalone Server using nohup (and redirecting stdout to nohup.out) to keep the process alive after disconnecting Ansible's ssh connection, -host command line argument is used, along with the Hub's private IP address to ensure binding to correct network interface (some applications, such as Docker, will install virtual interfaces and if used with Selenium can result in unreliable connections between Nodes and the Hub)
       - Ansible Playbook
          - Hub
             - run the Selenium Hub script 
          - Node $ (where $ is the node number)
             - runs firefox installation script if ~/1-Firefox-installed.txt doesn't exist
             - runs chrome installation script if ~/2-Chrome-installed.txt doesn't exist
             - runs post chrome istalltion script if ~/3-Post-chrome-installed.txt doesn't exist
             - runs nodeConfig.json creation script if ~/4-Config-file-created.txt doesn't exist
             - runs shared library script if ~/5-Libraries-shared.txt doesn't exist
             - runs following in-line shell commands:
                - if Selenium Standalone Server jar file doesn't exist then download it
                - install Java 8, if not installed
                - runs Selenium using "nohup" and redirecting stdout to "nohup.out", using "xvfb-run"to simulate the screen at 1400x1024x24, Selenium role as node, binding to correct network interface using -host, and specifiying config.json as the nodeConfig file
    - Run playbook and specify the hosts.ini file we created using "ansible-playbook playbook.yml -i hosts.ini"
    - Once playbook has run its course, PIPBOY is displayed, along with URLs for the Grid Console and the destination to direct tests
    
### Test
 - Creates directory "test_the_grid" (removing any previous folder of that name first)
 - creates a node project inside using "npm init"
 - installs Selenium Webdriver usning "npm install --save selenium-webdriver"
 - constructs "sample_test.js", inserting the Hub's test URL. Contains only two basic tests to ensure current Selenium Grid is correctly configured and running:
    - Chrome test
       - goes to "google.com"
       - enters "thumbs up pip boy" in search box
       - checks results page title = "thumbs up pip boy - Google Search"
       - takes screenshot, saving in "test_the_grid" folder
       - prints success message to console
    - Firefox test
       - goes to "google.com"
       - enters "thumbs up pip boy" in search box
       - checks results page title = "thumbs up pip boy - Google Search"
       - takes screenshot, saving in "test_the_grid" folder
       - prints success message to console
 - runs the test using "node sample_test.js"
 
