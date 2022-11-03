#!/bin/bash

#update
sudo yum update -y

#remove the old aws cli
sudo rm -f /usr/bin/aws

#install jq
sudo yum install jq -y

#install the new version 2 aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
sudo ./aws/install
#sudo mv /usr/local/aws-cli /usr/bin/aws
sudo mv /usr/local/bin/aws /usr/bin/aws

#install the ROSA cli
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz && tar -xzf rosa-linux.tar.gz
sudo mv rosa /usr/bin

#install the oc cli
rosa download oc && tar -xzf openshift-client-linux.tar.gz
sudo mv oc /usr/bin

#add a file for the user to find
sudo mkdir -p /reInvent/manifents
cat <<EOF > /reInvent/word.txt
Thanks for exploring ROSA.  Please enter this value to complete the task:

kakorrhaphiophobia

This is actually a word in the english language meaning an "abnormal fear of failure"
according to Merriam-Webster. While fear fo failure is constructive to a degree, hopefully
none of us are dealing with kakorrhaphiophobia.
EOF


#add the deployment yamls for task 4
cd /reInvent/manifests
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift-2/ostoy-frontend-deployment.yaml
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift-2/ostoy-microservice-deployment.yaml

cd /reInvent
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift-2/s3-bucket.yaml
wget https://aws-jam-challenge-resources.s3.amazonaws.com/rosa-openshift-2/irsa-role-arn.txt

sudo chmod -R 666 /reInvent
