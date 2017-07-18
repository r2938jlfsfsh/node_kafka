sudo docker run \
  --net=host \
  --rm confluentinc/cp-kafka \
  kafka-topics --create --topic foo --partitions 1 --replication-factor 1 --if-not-exists --zookeeper localhost:32181

sudo docker run \
  --net=host \
  --rm \
  confluentinc/cp-kafka \
  kafka-topics --describe --topic foo --zookeeper localhost:32181

sudo docker run \
  --net=host \
  --rm \
  confluentinc/cp-kafka \
  bash -c "seq 42 | kafka-console-producer --request-required-acks 1 --broker-list localhost:29092 --topic foo && echo 'Produced 42 messages.'"

sudo docker run \
  --net=host \
  --rm \
  confluentinc/cp-kafka \
  kafka-console-consumer --bootstrap-server localhost:29092 --topic foo --new-consumer --from-beginning --max-messages 42

