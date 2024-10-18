until docker exec -it wescale nc -z 127.0.0.1 15306; do
  echo "Waiting for wescale on port 15306 to be available..."; 
  sleep 5;
done && echo "Port 15306 is open." && docker exec -it wescale mysql -h127.0.0.1 -P15306