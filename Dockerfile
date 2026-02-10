FROM grafana/grafana:latest
ARG PLUGIN_ID
ARG VERSION

################ Security Update ################
USER root

RUN apk update && \
    apk upgrade --no-cache

USER grafana
################################################

RUN grafana cli plugins install ${PLUGIN_ID} ${VERSION}
