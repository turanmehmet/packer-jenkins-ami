#!/bin/bash
echo "Get Updates"
sudo yum update -y
sudo yum install wget -y
sudo yum install   java-{{user `java_version`}}-openjdk-devel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install   jenkins-{{user `jenkins_version`}} -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword