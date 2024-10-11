### 1. Create the Configuration Files

Use kubectl to create a ConfigMap with your WeSQL-Server configuration.

You need to replace the **objectstore_provider**, **objectstore_region**, and **objectstore_bucket** with your AWS S3 bucket info.
Please make sure the bucket is empty before you proceed.

```yaml{9-11}
kubectl apply -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: wesql-server-config
data:
  MYSQL_CUSTOM_CONFIG: |
    [mysqld]
    objectstore_provider=aws
    objectstore_region=us-west-1
    objectstore_bucket=wesql-storage
    datadir=/data/mysql/data
    log-error=/data/mysql/log/mysqld-error.log
    log-bin=binlog
    gtid_mode=ON
    enforce_gtid_consistency=ON
    log_slave_updates=ON
    binlog_format=ROW
    skip_name_resolve=ON
  EOF
```{{copy}}