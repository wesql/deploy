### 4. Wait for Start And Connect to the WeSQL-Server Cluster

Wait for mycluster-wesql-0-0 pod's 3306 port to be open by running:

```bash
kubectl wait --for=condition=Ready pod/mycluster-wesql-0-0 --timeout=300s
```{{exec}}

Then connect to the WeSQL-Server cluster using the following command:

```bash
kubectl exec -it mycluster-wesql-0-0 -- mysql -uroot -p${YOUR_MYSQL_ROOT_PASSWORD}
```{{copy}}