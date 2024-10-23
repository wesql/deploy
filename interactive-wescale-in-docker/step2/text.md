### 2. Generate the S3 Bucket

The WeSQL Data Node uses an S3 bucket to store data. We will generate an S3 bucket using a script provided by WeScale.

```bash
cd ~/wesql-local-dir && ~/generate_s3_bucket.sh && cat ~/wesql-local-dir/wesql.env
```{{exec}}