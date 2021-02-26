#!/bin/bash
sudo yum update -y
sudo yum install wget -y
sudo yum install   java-$(grep java_version /tmp/variables.json | awk '{print $NF}' | sed 's/"//g')-openjdk-devel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins-$(grep jenkins_version /tmp/variables.json | awk '{print $NF}' | sed 's/,//g' | sed 's/"//g')
sudo systemctl start jenkins
sudo systemctl status jenkins
#Get auth password from jenkins master
echo "authpwd="$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)