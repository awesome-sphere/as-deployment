#!/bin/bash

kubectl delete -f ./opentelemetry/

./kafka-delete-deployment.sh
./otel-delete-deployment.sh