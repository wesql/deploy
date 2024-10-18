### Step 1: Start the WeScale clusters

Wait for the WeScale cluster's 15306 port to be open by running:
```bash
until nc -z 127.0.0.1 15306; do 
  echo "Waiting for wescale on port 15306 to be available..."; 
  sleep 1; 
done && echo "Port 15306 is open."
```{{exec}}


```bash
docker run -it --network my-network --rm mysql mysql -hwescale -P15306 -uroot -ppasswd
```{{exec}}