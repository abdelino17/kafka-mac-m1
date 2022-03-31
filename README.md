# kafka-mac-m1

Mac M1 Local Kafka environment with Docker

# Usage

1. Create a **.env** file at the root of the folder with the versions of kafka and Zookeeper you wish:
```
KAFKA_VERSION=3.1.0
ZKP_VERSION=3.8.0
```

2. Run your local environment with the following command:
```
$ docker compose -f docker-compose.yml -f kafka.yml up --build
```

3. Enjoy!
