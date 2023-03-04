.PHONY: setup_s3 setup_webdav setup_hdfs

setup_s3:
	mkdir -p ~/dvc_storage/s3_storage
	docker volume create \
		--driver local \
		--opt type=none \
		--opt device=~/dvc_storage/s3_storage \
		--opt o=bind s3_storage
	docker compose -f ./storages/s3/docker-compose.yml up

setup_webdav:
	echo "WebDav is not implemented"

setup_hdfs:
	echo "HDFS is not implemented"
