# !/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami

# install zookeeper
helm install zookeeper bitnami/zookeeper \
  --set replicaCount=3 \
  --set auth.enabled=false \
  --set allowAnonymousLogin=true

helm install kafka bitnami/kafka \
  --set zookeeper.enabled=false \
  --set replicaCount=3 \
  --set externalZookeeper.servers=zookeeper.default.svc.cluster.local

