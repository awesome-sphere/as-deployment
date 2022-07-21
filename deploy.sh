#!/bin/bash

./otel-deployment.sh
./kafka-deployment.sh
kubectl apply -R -f .
# kubectl apply -f ./databases/
# kubectl apply -f ./services/