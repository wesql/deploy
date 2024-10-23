### 4. Start WeScale Container

Once the WeSQL-Server is running, you can start the WeScale container. The WeScale container will connect to the WeSQL-Server and provide the WeScale service.

```bash
docker run -itd --network host --name wescale \
  -w /vt/examples/wesql-server \
  -e MYSQL_ROOT_USER=root \
  -e MYSQL_ROOT_PASSWORD=passwd \
  -e MYSQL_PORT=3306 \
  -e MYSQL_HOST=127.0.0.1 \
  apecloud/apecloud-mysql-scale:0.3.3 \
  /vt/examples/wesql-server/init_single_node_cluster.sh
```{{exec}}