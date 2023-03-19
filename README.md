Storage setup samples for [DVC](https://dvc.org/doc/command-reference/remote/modify)

Basic requirements:
```bash
$ pip install -r requirements.txt
```

__S3 API compatible object storage__:
```bash
$ make setup_s3
# Go to MinIO, create `dvc` bucket and some <USER> with RW-permissions
```
Test:
```bash
$ make init && cd ./test
$ dvc remote add -d minio s3://dvc -f
$ dvc remote modify minio endpointurl http://172.19.0.2:9000
$ dvc remote modify minio access_key_id <USER>
$ dvc remote modify minio secret_access_key <KEY>

$ echo "Test" | tee test.txt
$ dvc add test.txt && git add test.txt.dvc .gitignore
$ git commit -m "Add data"
$ dvc push
```

__WebDAV__:
```bash
make setup_webdav
# Go to http://127.0.0.1:8082/ to see the storage in web browser
```
Test:
```bash
$ make init && cd ./test
# Note: webdavs://127.0.0.1:8082/dvc for HTTP with SSL/TLS support
$ dvc remote add -d webdav webdav://127.0.0.1:8082/dvc -f
$ dvc remote modify --local webdav user <USER>
$ dvc remote modify --local webdav password <PASSWORD>

$ echo "Test" | tee test.txt
$ dvc add test.txt && git add test.txt.dvc .gitignore
$ git commit -m "Add data"
$ dvc push
```

__Aliyun OSS__:
```bash
make setup_oss
```

