#!/bin/bash 

# WebServer Of Linux - Ubuntu 20.04
aws ec2 run-instances \
--image-id "ami-0851b76e8b1bce90b" \
--instance-type "t2.micro" \
--count 1 \
--subnet-id "subnet-421fef29" \
--security-group-ids "sg-0e8d2dc752b5c6069" \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=TomcatServer},{Key=Environment,Value=Development},{Key=ProjectName,Value=cloudbinary},{Key=ProjectID,Value=20220110},{Key=EmailID,Value=devops@cloudbinary.io},{Key=MobileNo,Value=9100073006}]' \
--key-name "cloudbinary" \
--user-data file://install-app-tomcat.txt --profile devops 
