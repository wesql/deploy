### 2. Create the Secret

Use kubectl to create a secret with your AWS S3 credentials. Replace **YOUR_S3_ACCESS_KEY**, **YOUR_S3_SECRET_KEY**, and **YOUR_MYSQL_ROOT_PASSWORD** with your actual AWS S3 credentials and desired MySQL root password.

```bash{4-6}
kubectl create secret generic wesql-server-secret \
  --namespace default \
  --type Opaque \
  --from-literal=WESQL_OBJECTSTORE_ACCESS_KEY=${WESQL_OBJECTSTORE_ACCESS_KEY} \
  --from-literal=WESQL_OBJECTSTORE_SECRET_KEY=${WESQL_OBJECTSTORE_SECRET_KEY} \
  --from-literal=MYSQL_ROOT_PASSWORD=passwd
```