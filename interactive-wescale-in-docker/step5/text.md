### 5. Connecting to the Cluster

Wait for the WeSQL-Server cluster's 3306 port and the WeScale cluster's 15306 port to be open by running:
```bash
until (echo > /dev/tcp/localhost/3306) >/dev/null 2>&1 && (echo > /dev/tcp/localhost/15306) >/dev/null 2>&1; do echo "Waiting for wesql-server on port 3306 and wescale2 on port 15306 to be available..."; sleep 1; done && echo "All ports are open."
```{{exec}}

You can connect to the WeSQL cluster using a MySQL client or driver from any environment that can access the SQL listening port.
- replace passwd with the real password for the root user.

```bash
docker run -it --network my-network --rm mysql mysql -hwesql-server -uroot -ppasswd
```{{exec}}

You can also connect to WeScale using a MySQL client or driver from any environment that can access the SQL listening port.

```bash
docker run -it --network my-network --rm mysql mysql -hwescale -P15306 -uroot -ppasswd
```{{exec}}