FROM alpine:3.9.2

ENV HOME=/home/duplicity


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
 && pip install pipenv azure azure-storage-blob \
 && pipenv install --system --deploy \
 && apk del --purge py-pip \
 && adduser -D -u 1896 duplicity \
 && mkdir -p /home/duplicity/.cache/duplicity \
 && mkdir -p /home/duplicity/.gnupg \
 && chmod -R go+rwx /home/duplicity/ \
 && su - duplicity -c 'duplicity --version'

VOLUME ["/home/duplicity/.cache/duplicity", "/home/duplicity/.gnupg"]

USER duplicity

CMD ["duplicity"]
