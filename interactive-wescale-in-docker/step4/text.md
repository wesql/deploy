### 4. Start WeScale Container

Once the WeSQL-Server is running, you can start the WeScale container. The WeScale container will connect to the WeSQL-Server and provide the WeScale service.

```bash
docker run -itd \
  --name wescale \
  --network my-network \
  -w /vt/examples/wesql-server \
  -e MYSQL_ROOT_USER=root \
  -e MYSQL_ROOT_PASSWORD=passwd \
  -e MYSQL_PORT=3306 \
  -e MYSQL_HOST=wesql-server \
  -p 15306:15306 \
  apecloud/apecloud-mysql-scale:0.3.0-alpha33 \
  /vt/examples/wesql-server/init_single_node_cluster.sh
```{{exec}}