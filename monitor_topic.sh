topic=${1:-node_test}
echo "Monitoring topic ${topic}..."
echo

sudo docker run --net=host --rm confluentinc/cp-kafka kafka-console-consumer --bootstrap-server localhost:29092 --topic ${topic} --new-consumer

