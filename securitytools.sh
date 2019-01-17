curl ifconfig.co

echo "***** SSH *****"
ssh -tt -i dsotesting.pem ec2-user@10.10.2.82

echo "***** UPDATE OS *****"
sudo yum update -y
echo "***** INSTALL GIT *****"
sudo yum install git -y

echo "***** SECURITY TOOLS *****"
git clone https://emailnotours:c0t2h0y9s0h5r1m3n@gitlab.com/emailnotours/devsecops.git

echo "RPM QUALYS"
sudo rpm -ivh devsecops/qualys-cloud-agent.x86_64.rpm
sleep 15
echo "QUALYS AGENT"
sudo /usr/local/qualys/cloud-agent/bin/qualys-cloud-agent.sh ActivationId=50e0f13e-f88f-4b0f-8422-eeb5815e8b68 CustomerId=af433332-5b18-7be7-e040-10ac130451e8

echo "RPM TANIUM CLIENT"
sudo rpm -i devsecops/TaniumClient-7.2.314.2962-1.amzn2016.09.x86_64.rpm
sleep 1m
echo "RM RF TANIUM"
sudo rm -rf /opt/Tanium/TaniumClient/TaniumClient.ini
sudo cp devsecops/TaniumClient.ini devsecops/tanium.pub /opt/Tanium/TaniumClient/

echo "TANIUM START"
sudo service TaniumClient start
sleep 1m
sudo rm -rf devsecops