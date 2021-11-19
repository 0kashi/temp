#!/bin/bash

#update
sudo yum update -y

#remove the old aws cli
#sudo rm -f /usr/bin/aws

#install jq
sudo yum install jq -y

#install the new version 2 aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
sudo ./aws/install
sudo mv /usr/local/aws-cli /usr/bin/aws

#install the ROSA cli
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz && tar -xzf rosa-linux.tar.gz
sudo mv rosa /usr/bin

#install the oc cli
rosa download oc && tar -xzf openshift-client-linux.tar.gz
sudo mv oc /usr/bin

#add a file for the user to find
echo "Thanks for exploring ROSA.  Please enter this value to complete the task:" > /tmp/word.txt
echo "" >> /tmp/word.txt
echo "Lollygag" >> /tmp/word.txt
echo "" >> /tmp/word.txt
echo "This is actually a word in the english language meaning to fool around and waste time" >> /tmp/word.txt
echo "according to Merriam-Webster. Thankfully none of us are here to lollygag." >> /tmp/word.txt

#add the deployment yamls for task 4
mkdir /tmp/deployment-files && cd /tmp/deployment-files
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift/ostoy-frontend.yaml
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift/ostoy-microservice.yaml
