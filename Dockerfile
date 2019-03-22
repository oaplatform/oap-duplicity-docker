FROM alpine:3.9.2

ENV HOME=/root


RUN set -x \
 && apk add --no-cache \
        ca-certificates \
        duplicity \
        lftp \
        openssh \
        openssl \
        py-crypto \
        py-paramiko \
        py-setuptools \
        py-requests \
        py-requests-oauthlib \
        rsync \
 && update-ca-certificates

RUN set -x \
 && apk add --no-cache py-pip \
 && pip install azure \
 && pip install azure-storage-blob \
 && apk del --purge py-pip \
 && mkdir -p /root/.cache/duplicity \
 && mkdir -p /root/.gnupg

VOLUME ["/root/.cache/duplicity", "/root/.gnupg"]


CMD ["duplicity"]
