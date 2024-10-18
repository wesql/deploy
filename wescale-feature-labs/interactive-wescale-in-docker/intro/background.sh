#!/bin/bash

CONTAINER_NAME="wesql-server"
MYSQL_ROOT_PASSWORD="passwd"
MYSQL_ROOT_HOST="%"
HOST_PORT=3306
CONTAINER_PORT=3306
DATA_DIR="$(pwd)/vtdataroot/mysql"
CONFIG_FILE="$DATA_DIR/my.cnf"
IMG="mysql/mysql-server:8.0.32"

# 创建数据目录和日志目录（如果不存在）
mkdir -p "$DATA_DIR/data"
mkdir -p "$DATA_DIR/log"

# 创建 my.cnf（如果不存在）
if [ ! -f "$CONFIG_FILE" ]; then
cat <<EOL > "$CONFIG_FILE"
[mysqld]
port=3306
bind-address=0.0.0.0
log-bin=binlog
gtid_mode=ON
enforce_gtid_consistency=ON
log_replica_updates=ON
binlog_format=ROW
datadir=/data/mysql/data
log-error=/data/mysql/log/mysqld-error.log
EOL
fi

# 设置目录权限
chmod -R 777 "$DATA_DIR"

docker network create my-network

# 运行 Docker 容器
docker run -itd --name $CONTAINER_NAME \
  --network my-network \
  -p $HOST_PORT:$CONTAINER_PORT \
  -v "$DATA_DIR":/data/mysql \
  -v "$CONFIG_FILE":/etc/my.cnf \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
  -e MYSQL_ROOT_HOST="$MYSQL_ROOT_HOST" \
  $IMG

docker run -itd \
  --name wescale \
  --network my-network \
  -w /vt/examples/wesql-server \
  -e MYSQL_ROOT_USER=root \
  -e MYSQL_ROOT_PASSWORD=passwd \
  -e MYSQL_PORT=3306 \
  -e MYSQL_HOST=wesql-server \
  -p 15306:15306 \
  apecloud/apecloud-mysql-scale:0.3.1 \
  /vt/examples/wesql-server/init_single_node_cluster.sh