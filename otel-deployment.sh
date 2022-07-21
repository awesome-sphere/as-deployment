#!/bin/bash

# install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.2/cert-manager.yaml

# function to install opentelemetry-operator
apply_otel_operator() {
    kubectl apply -f https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml
}

# try to get opentelemetry-operator running until connected to cert-manager
apply_otel_operator
while [ $? -ne 0 ]; do
    sleep 10 # wait until cert-manager is ready
    apply_otel_operator
done