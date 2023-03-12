.PHONY: setup_s3 setup_webdav setup_hdfs clean init

setup_s3:
	mkdir -p ~/dvc_storage/s3_storage
	docker volume create \
		--driver local \
		--opt type=none \
		--opt device="${HOME}/dvc_storage/s3_storage" \
		--opt o=bind s3_storage
	docker compose -f ./storages/s3/docker-compose.yml up

setup_webdav:
	mkdir -p ~/dvc_storage/webdav_storage
	docker volume create \
		--driver local \
		--opt type=none \
		--opt device="${HOME}/dvc_storage/webdav_storage" \
		--opt o=bind webdav_storage
	docker compose -f ./storages/webdav/docker-compose.yml up

setup_hdfs:
	echo "HDFS example is not implemented"

setup_oss:
	echo "Aliyun OSS emulator example is not implemented"

clean:
	cd ./test && rm -rf .dvc .git && rm .dvcignore .gitignore test.txt test.txt.dvc

init:
	cd ./test && git init && dvc init