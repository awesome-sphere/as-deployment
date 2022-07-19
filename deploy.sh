#!/bin/bash

kubectl apply -f .
kubectl apply -f ./databases/
./kafka-deployment.sh