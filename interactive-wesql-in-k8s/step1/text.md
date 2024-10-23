### 1. Generate the S3 Bucket

The WeSQL Data Node uses an S3 bucket to store data. We will generate an S3 bucket using a script provided by WeScale.

```bash
~/generate_s3_bucket.sh && cat ./wesql.env
```{{exec}}

Export the environment variables from the `wesql.env` file.

```bash
set -o allexport
source ./wesql.env
set +o allexport
```{{exec}}