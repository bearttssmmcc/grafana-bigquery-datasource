PLUGIN_ID := grafana-bigquery-datasource
VERSION := 3.0.4
PLUGIN_DIR := /var/lib/grafana/plugins

PHONY: build
build:
	docker build -t ${PLUGIN_ID} \
		--build-arg PLUGIN_ID=$(PLUGIN_ID) \
		--build-arg VERSION=$(VERSION) \
		.

PHONY: run
run:
	docker run -d \
		--name ${PLUGIN_ID} \
		-p 3000:3000 \
		${PLUGIN_ID}

PHONY: copy
copy:
	docker cp ${PLUGIN_ID}:${PLUGIN_DIR}/${PLUGIN_ID} .


PHONY: clean
clean:
	docker rm -f ${PLUGIN_ID}
	rm -rf ./${PLUGIN_ID}
