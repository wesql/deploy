### Create Local Directory

This guide uses Docker's volume mounting (mounting a directory from the host to a directory inside the container) as an example. Create a directory for storing local data for the WeSQL Data Node. The WeSQL Data Node will persist the binlog in this directory before uploading it to S3. Additionally, data read from S3 will also be cached in this directory to optimize performance.

To create the directory, run the following command:

```bash
mkdir -p ~/wesql-local-dir
```{{exec}}