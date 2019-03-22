FROM wernight/duplicity:latest

USER root

RUN set -x \
 && apk add --no-cache py-pip \
 && pip install azure \
 && pip install azure-storage-blob \
 && apk del --purge py-pip

VOLUME ["/home/duplicity/.cache/duplicity", "/home/duplicity/.gnupg"]

USER duplicity

CMD ["duplicity"]
