#! /bin/bash -x
sudo yum install docker -y
sudo service docker start
docker run -d -p 80:80 centos/httpd