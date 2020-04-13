#!/bin/bash

token=$(aws ssm get-parameter --name "sonar_cloud_token" --region us-east-1 --output text --query Parameter.Value)
sonar-scanner -Dsonar.projectKey=${INPUT_PROJECTKEY} -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=$token -Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} -Dsonar.organization=${INPUT_ORGANISATION} -Dsonar.scm.disabled=true