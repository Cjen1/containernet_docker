containernet: dockerfile
	docker build -t containernet/test .
	docker run \
		--name containernet_test \
		-it --rm \
		--privileged \
		--pid='host' \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--mount type=bind,source=`realpath .`,target=/root/mounted \
		containernet/test /bin/bash
