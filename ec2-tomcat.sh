#!/bin/bash 

# WebServer Of Linux - Ubuntu 20.04
aws ec2 run-instances \
--image-id "ami-0851b76e8b1bce90b" \
--instance-type "t2.micro" \
--count 1 \
--subnet-id "subnet-421fef29" \
--security-group-ids "sg-0e8d2dc752b5c6069" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=TomcatServer},{Key=Environment,Value=Development},{Key=ProjectName,Value=SoftoBizDevOps},{Key=ProjectID,Value=20220110},{Key=EmailID,Value=devops@softobiz.com},{Key=MobileNo,Value=+919908823070}]' \
--key-name "softodevops" \
--user-data file://install-app-tomcat.txt --profile devops 