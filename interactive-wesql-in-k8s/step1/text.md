### Generate the S3 Bucket

The WeSQL Data Node uses an S3 bucket to store data. You can [apply a free S3 Bucket](https://wesql.io/bucket) to use with WeSQL.

```bash
export WESQL_OBJECTSTORE_BUCKET=<bucket>
export WESQL_OBJECTSTORE_REGION=<region>
export WESQL_OBJECTSTORE_ACCESS_KEY=<access-key>
export WESQL_OBJECTSTORE_SECRET_KEY=<secret-key>
```{{copy}}