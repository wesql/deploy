### 4. Wait for Start And Connect to the WeScale Cluster

Wait for wesql-vtgate deployment's 15306 port to be open by running:

```bash
kubectl wait --for=condition=available deployment/wesql-vtgate --timeout=300s
```{{exec}}

Then connect to the WeScale cluster using the following command:

```bash
kubectl exec -it $(kubectl get pods -l app.kubernetes.io/name=wesql-vtgate -o jsonpath='{.items[0].metadata.name}') -- mysql -uroot -P15306
```{{exec}}

You can still connect to WeSQL-Server cluster using the following command:

```bash
kubectl exec -it mycluster-wesql-0-0 -- mysql -uroot -p
```{{exec}}