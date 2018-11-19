import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.common.TopicPartition;

import java.util.ArrayList;
import java.util.Properties;

public class KafkaConsumerAssignApp {
    public static void main(String[] args){
        Properties props = new Properties();
        props.put("bootstrap.servers", "localhost:9092, localhost:9093, localhost:9094");
        props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");

        KafkaConsumer myConsumerAssign = new KafkaConsumer(props);

        ArrayList<TopicPartition> partitions = new ArrayList<TopicPartition>();
        TopicPartition myTopicPart0 = new TopicPartition("my-topic-p3r1", 0);
        TopicPartition myOtherTopicPart2 = new TopicPartition("my-other-topic-p3r1", 2);

        partitions.add(myTopicPart0);
        partitions.add(myOtherTopicPart2);

        myConsumerAssign.assign(partitions);

        try{
            ConsumerRecords<String, String> records = myConsumerAssign.poll(10);
            for (ConsumerRecord<String, String> record : records){
                // Process each record:
                System.out.println
                        (String.format("Topic: %s, Partition: %d, Offset: %d, Key: %s, Value: %s",
                        record.topic(), record.partition(), record.offset(), record.key(), record.value() ));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            myConsumerAssign.close();
        }
    }
}
