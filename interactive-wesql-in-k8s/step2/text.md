### 1. Create the Configuration Files

Use kubectl to create a ConfigMap with your WeSQL-Server configuration.



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
    objectstore_region=${WESQL_OBJECTSTORE_REGION}
    objectstore_bucket=${WESQL_OBJECTSTORE_BUCKET}
    repo_objectstore_id=sysbench
    branch_objectstore_id=main
    datadir=/data/mysql/data
    log-error=/data/mysql/log/mysqld-error.log
    log-bin=binlog
    gtid_mode=ON
    enforce_gtid_consistency=ON
    log_slave_updates=ON
    binlog_format=ROW
    skip_name_resolve=ON
EOF
```{{exec}}