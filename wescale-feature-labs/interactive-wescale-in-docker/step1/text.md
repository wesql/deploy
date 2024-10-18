### Step 1: Connect to the WeScale clusters

Install the MySQL client:
```bash
apt install mysql-client-core-8.0
```{{exec}}

Connect to the WeScale cluster:
```bash
mysql -h127.0.0.1 -P15306 -uroot -ppasswd
```{{exec}}