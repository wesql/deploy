### Start WeSQL-Server Data Node

The WeSQL Data Node uses an S3 bucket to store data. You can [apply a free S3 Bucket](https://wesql.io/bucket) to use with WeSQL.

```bash
export WESQL_OBJECTSTORE_BUCKET=<bucket>
export WESQL_OBJECTSTORE_REGION=<region>
export WESQL_OBJECTSTORE_ACCESS_KEY=<access-key>
export WESQL_OBJECTSTORE_SECRET_KEY=<secret-key>
```{{copy}}

When starting the data node for the first time, the cluster will automatically initialize. If the local directory is empty, it will pull the latest data from S3.

```bash
docker run -itd --network host --name wesql-server \
  -e MYSQL_CUSTOM_CONFIG="[mysqld]\n\
  port=3306\n\
  log-bin=binlog\n\
  gtid_mode=ON\n\
  enforce_gtid_consistency=ON\n\
  log_slave_updates=ON\n\
  binlog_format=ROW\n\
  objectstore_provider='aws'\n\
  repo_objectstore_id='tutorial'\n\
  branch_objectstore_id='main'\n\
  datadir=/data/mysql/data\n\
  log-error=/data/mysql/log/mysqld-error.log" \
    -v ~/wesql-local-dir:/data/mysql \
    -e WESQL_CLUSTER_MEMBER='127.0.0.1:13306' \
    -e MYSQL_ROOT_PASSWORD=passwd \
    -e WESQL_OBJECTSTORE_BUCKET=${WESQL_OBJECTSTORE_BUCKET} \
    -e WESQL_OBJECTSTORE_REGION=${WESQL_OBJECTSTORE_REGION} \
    -e WESQL_OBJECTSTORE_ACCESS_KEY=${WESQL_OBJECTSTORE_ACCESS_KEY} \
    -e WESQL_OBJECTSTORE_SECRET_KEY=${WESQL_OBJECTSTORE_SECRET_KEY} \
    apecloud/wesql-server:8.0.35-0.1.0_beta1.g4a5a4eb.33
```{{exec}}

Each WeSQL server starts two ports: one is port 3306, which provides the MySQL service, and the other is port 13306, which is used for Raft protocol communication between WeSQL servers.
