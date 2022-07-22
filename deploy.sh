#!/bin/bash

# ./otel-deployment.sh
./kafka-deployment.sh

kubectl apply -f ./databases
kubectl apply -f ./services

kubectl delete -f ./services/frontend-svc.yaml
kubectl apply -f ./services/frontend-svc.yaml