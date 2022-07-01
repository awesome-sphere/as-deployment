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

# Testing
# POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=kafka,app.kubernetes.io/instance=kafka,app.kubernetes.io/component=kafka" -o jsonpath="{.items[0].metadata.name}")
# kubectl --namespace default exec -it $POD_NAME -- kafka-console-producer.sh --broker-list kafka-0.kafka-headless.default.svc.cluster.local:9092,kafka-1.kafka-headless.default.svc.cluster.local:9092,kafka-2.kafka-headless.default.svc.cluster.local:9092 --topic test

# kubectl --namespace default exec -it $POD_NAME -- kafka-console-consumer.sh --bootstrap-server kafka.default.svc.cluster.local:9092 --topic mytopic --consumer.config /opt/bitnami/kafka/conf/consumer.properties &