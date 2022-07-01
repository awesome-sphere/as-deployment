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

# POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=kafka,app.kubernetes.io/instance=kafka,app.kubernetes.io/component=kafka" -o jsonpath="{.items[0].metadata.name}")
# kubectl --namespace default exec -it $POD_NAME -- kafka-topics.sh --create --zookeeper zookeeper.default.svc.cluster.local:2181 --replication-factor 1 --partitions 1 --topic mytopic

# kubectl --namespace default exec -it $POD_NAME -- kafka-console-consumer.sh --bootstrap-server kafka.default.svc.cluster.local:9092 --topic mytopic --consumer.config /opt/bitnami/kafka/conf/consumer.properties &