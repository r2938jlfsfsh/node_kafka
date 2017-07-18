msg_count=${1:-10}

sudo docker run \
  --net=host \
  --rm confluentinc/cp-kafka \
  kafka-topics --create --topic node_test --partitions 1 --replication-factor 1 --if-not-exists --zookeeper localhost:32181

sudo docker run \
  --net=host \
  --rm \
  confluentinc/cp-kafka \
  bash -c "( x=1; while [[ \$x -le ${msg_count} ]]; do echo \"Message: \$x of ${msg_count}\" ; x=\$(( \$x + 1 )) ; sleep 1; done ) | kafka-console-producer --request-required-acks 1 --broker-list localhost:29092 --topic node_test"

