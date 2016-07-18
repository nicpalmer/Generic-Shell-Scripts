#!/bin/bash
# Gets stats on docker using the inspect command.
# will return IP and time started

for CONTAINER in es0 es1 es2
do
RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER)

if [ $? -eq 1 ]; then
  echo "Sorry, I can't find the containers $CONTAINER specified."
  exit 3
fi

if [ "$RUNNING" == "false" ]; then
  echo "CRITICAL - $CONTAINER is not running."
  exit 2
fi

STARTED=$(docker inspect --format="{{ .State.StartedAt }}" $CONTAINER)
NETWORK=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $CONTAINER)

echo "OK - $CONTAINER is running. IP: $NETWORK, StartedAt: $STARTED"
done
