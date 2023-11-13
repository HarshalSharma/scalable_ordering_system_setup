kubectl apply -f kafka-event-bus-deployment.yaml

# Create a topic named 'shopping-orders'
kubectl exec -n <namespace> my-kafka-cluster-kafka-0 -- kafka-topics.sh --create --topic shopping-orders --partitions 3 --replication-factor 2 --zookeeper my-kafka-cluster-zookeeper:2181

