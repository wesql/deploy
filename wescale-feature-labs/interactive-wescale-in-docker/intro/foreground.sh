#!/bin/bash

apt install mysql-client-core-8.0

until nc -z 127.0.0.1 15306; do
  echo "Waiting for wescale on port 15306 to be available..."; 
  sleep 5;
done && echo "Port 15306 is open."