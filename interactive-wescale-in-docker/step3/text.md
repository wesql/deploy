### 3. Start WeSQL-Server Data Node

In this example, the configuration parameter file is generated using the container environment variable `MYSQL_CUSTOM_CONFIG`. For specific configuration parameters, refer to [WeSQL Documentation](https://wesql.io/docs/usage/configuration).

When starting the data node for the first time, the cluster will automatically initialize. If the local directory is empty, it will pull the latest data from S3.

```bash
docker run -itd --name wesql-server \
  --network my-network \
  -e MYSQL_CUSTOM_CONFIG="[mysqld]\n\
  port=3306\n\
  log-bin=binlog\n\
  gtid_mode=ON\n\
  enforce_gtid_consistency=ON\n\
  log_slave_updates=ON\n\
  binlog_format=ROW\n\
  objectstore_provider='aws'\n\
  objectstore_region='us-west-1'\n\
  objectstore_bucket='wesql-storage'\n\
  datadir=/data/mysql/data\n\
  log-error=/data/mysql/log/mysqld-error.log" \
    -p 3306:3306 \
    -v ~/wesql-local-dir:/data/mysql \
    -e WESQL_CLUSTER_MEMBERS='127.0.0.1:13306' \
    -e WESQL_CLUSTER_MEMBER_INDEX=0 \
    -e WESQL_OBJECTSTORE_ACCESS_KEY='********************' \
    -e WESQL_OBJECTSTORE_SECRET_KEY='********************' \
    -e MYSQL_ROOT_PASSWORD=passwd \
    apecloud/wesql-server:8.0.35-6.alpha10.20240918.g18ad68b.25
```{{copy}}

- replace `us-west-1` with the real region of your S3 bucket.
- replace `wesql-storage` with the real name of your S3 bucket.
- set WESQL_OBJECTSTORE_ACCESS_KEY and WESQL_OBJECTSTORE_SECRET_KEY with your real AWS credentials.
- replace passwd with the real password for the root user.

Each WeSQL server starts two ports: one is port 3306, which provides the MySQL service, and the other is port 13306, which is used for Raft protocol communication between WeSQL servers.

You can see that several objects are generated in the S3 bucket.