FROM debian:jessie

RUN apt-get update && \
    cd /tmp/ && \
    curl -L -O https://storage.googleapis.com/kubernetes-release/release/v1.3.7/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/ && \
    chmod 0555 /usr/bin/kubectl && \
    curl -L -O https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    mv jq-linux64 /usr/bin/jq && \
    chmod 0555 /usr/bin/jq && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./start /app/
