### Step 1: Connect to the WeScale clusters

```bash
docker run -it --network my-network --rm mysql mysql -hwescale -P15306 -uroot -ppasswd
```{{exec}}