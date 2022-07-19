#!/bin/bash

kubectl apply -f .
kubectl apply -f ./databases/postgres-user-deployment.yaml -f ./databases/postgres-user-secret.yaml
./kafka-deployment.sh