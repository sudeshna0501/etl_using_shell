# Download Kafka
wget https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz

# Extract Kafka from the zip file
tar -xzf kafka_2.13-3.8.0.tgz

# Navigate to the kafka_2.13-3.8.0 directory
cd kafka_2.13-3.8.0

# Generate a cluster UUID that will uniquely identify the Kafka cluster
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

# Configure the log directories passing the cluster ID
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

# Start the Kafka server
bin/kafka-server-start.sh config/kraft/server.properties

# Create a topic named news
bin/kafka-topics.sh --create --topic weather --bootstrap-server localhost:9092

# Start a producer
bin/kafka-console-producer.sh   --bootstrap-server localhost:9092   --topic weather

# Sends three messages to Kafka.
Good morning, Sudeshna!
Today, expect partly cloudy skies with a high of 28°C and a low of 20°C.
Humidity levels will be around 70%, making it feel slightly warmer.
There is a 20% chance of light showers in the evening, so you might want to carry an umbrella just in case.
Winds will be gentle, blowing from the northeast at 10 km/h.

# Listen to the messages in the topic news
bin/kafka-console-consumer.sh   --bootstrap-server localhost:9092   --topic weather   --from-beginning

# Check the logs generated for the topic news
ls /tmp/kraft-combined-logs/weather-0