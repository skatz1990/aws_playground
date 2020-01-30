#! /bin/bash -x
sudo yum install docker -y
sudo service docker start
docker run -d -p 80:80 centos/httpd
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U ./amazon-cloudwatch-agent.rpm