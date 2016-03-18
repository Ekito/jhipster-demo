#!/bin/sh
################################################################################
# MongoDB
################################################################################
if [ -d ${SPRING_DATA_MONGODB_HOST} ]; then
  SPRING_DATA_MONGODB_HOST=${MONGODB_PORT_27017_TCP_ADDR}
  echo "SPRING_DATA_MONGODB_HOST autoconfigured by docker link: ${SPRING_DATA_MONGODB_HOST}"
else
  echo "SPRING_DATA_MONGODB_HOST init by configuration"
fi
if [ -d ${SPRING_DATA_MONGODB_PORT} ]; then
  SPRING_DATA_MONGODB_PORT=${MONGODB_PORT_27017_TCP_PORT}
  echo "SPRING_DATA_MONGODB_PORT autoconfigured by docker link: ${SPRING_DATA_MONGODB_PORT}"
else
  echo "SPRING_DATA_MONGODB_PORT init by configuration: ${SPRING_DATA_MONGODB_PORT}"
fi
if [ -d ${JHIPSTER_SLEEP} ]; then
  JHIPSTER_SLEEP=20
fi
################################################################################
# Start application
################################################################################
echo "The application will start in ${JHIPSTER_SLEEP}sec..." && sleep ${JHIPSTER_SLEEP}
if [ -d ${JHIPSTER_SPRING} ]; then
  java -jar /app.war \
    --spring.profiles.active=prod ${JHIPSTER_SPRING_ADD} \
    --spring.data.mongodb.host=${SPRING_DATA_MONGODB_HOST} \
    --spring.data.mongodb.port=${SPRING_DATA_MONGODB_PORT}
else
  echo "java -jar /app.war ${JHIPSTER_SPRING}"
  java -jar /app.war ${JHIPSTER_SPRING}
fi
