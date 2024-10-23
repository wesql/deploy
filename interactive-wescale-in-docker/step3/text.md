### 3. Start WeSQL-Server Data Node

In this example, the configuration parameter file is generated using the container environment variable `MYSQL_CUSTOM_CONFIG`. For specific configuration parameters, refer to [WeSQL Documentation](https://wesql.io/docs/usage/configuration).

When starting the data node for the first time, the cluster will automatically initialize. If the local directory is empty, it will pull the latest data from S3.

```bash
docker run -itd --network host --name wesql-server \
  -e MYSQL_CUSTOM_CONFIG="[mysqld]\n\
  port=3306\n\
  objectstore_provider='aws'\n\
  repo_objectstore_id='tutorial'\n\
  branch_objectstore_id='main'\n\
  datadir=/data/mysql/data\n\
  log-error=/data/mysql/log/mysqld-error.log" \
    -v ~/wesql-local-dir:/data/mysql \
    -e WESQL_CLUSTER_MEMBER='127.0.0.1:13306' \
    -e MYSQL_ROOT_PASSWORD=passwd \
    --env-file=~/wesql-local-dir/wesql.env \
    apecloud/wesql-server:8.0.35-0.1.0_beta1.g4a5a4eb.32
```{{copy}}

Each WeSQL server starts two ports: one is port 3306, which provides the MySQL service, and the other is port 13306, which is used for Raft protocol communication between WeSQL servers.
