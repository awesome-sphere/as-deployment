#!/bin/bash

./otel-deployment.sh
kubectl apply -f .
kubectl apply -f ./databases/
./kafka-deployment.sh