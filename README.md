## Inspectorio PredictionIO Image, modified by hgcho

- OpenJDK 8
- Scala 2.11.12
- Apache PredictionIO 0.13.0
- Apache Spark 2.1.1
- PostgreSQL JDBC 42.2.0
- Universal Recommender v0.7.3

### Environments

#### PostgreSQL

- `PIO_DB_HOST`: PostgreSQL server address
- `PIO_DB`: PostgreSQL database name
- `PIO_DB_USER`: PostgreSQL database user
- `PIO_DB_PASSWORD`: PostgreSQL database password

#### Elasticsearch

- `ES_HOST`: Elasticsearch host
- `ES_PORT`: Elasticsearch port

### Usage

```sh
$ docker-compose up -d

# open a new terminal and run below command to ssh into pio container
$ docker-compose exec app bash

$ pio status # check pio status
$ pio eventserver &> ~/eventserver.log &
$ pio app new **your-app-name-here** # specify the appName used in the template's engine.json file (you can see it in the current directory)
```

```bash
# integration test
$ cd ~/universal-recommender

# run eventserver if eventserver of pio runs yet
$ ./example/integration-test

# serve engine
$ pio deploy

# cURL test for serving engine

$ curl -H "Content-Type: application/json" -d '{ "user": "u1" }' http://localhost:9000/queries.json
# result example : {"itemScores":[{"item":"Nexus","score":0.18232156},{"item":"Surface","score":0.0}]}

$ curl -H "Content-Type: application/json" -d '{ "user": "U 2" }' http://localhost:9000/queries.json
# result example : {"itemScores":[{"item":"Iphone 4","score":0.87546873},{"item":"Ipad-retina","score":0.18232156},{"item":"Surface","score":0.0}]}

$ curl -H "Content-Type: application/json" -d '{ "item": "Ipad-retina" }' http://localhost:8000/queries.json
# result example : {"itemScores":[{"item":"Iphone 4","score":0.87546873},{"item":"Ipad-retina","score":0.18232156},{"item":"Surface","score":0.0}]}
```

Feed data through sdk and use `pio train` & `pio deploy` subsequently. Also, note that default UR integration tests are removed while building the container from scala source, and thus, can't be run.
