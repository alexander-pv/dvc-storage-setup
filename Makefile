.PHONY: setup_s3 setup_webdav setup_hdfs clean_test

setup_s3:
	mkdir -p ~/dvc_storage/s3_storage
	docker volume create \
		--driver local \
		--opt type=none \
		--opt device="${HOME}/dvc_storage/s3_storage" \
		--opt o=bind s3_storage
	docker compose -f ./storages/s3/docker-compose.yml up

setup_webdav:
	echo "WebDav is not implemented"

setup_hdfs:
	echo "HDFS is not implemented"

clean_test:
	rm -rf .dvc .git
	rm .dvcignore .gitignore test.txt test.txt.dvc