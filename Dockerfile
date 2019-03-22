FROM wernight/duplicity:latest

USER root

RUN set -x \
 && apk add --no-cache py-pip \
 && apk del --purge py-pip \
 && pip install azure

VOLUME ["/home/duplicity/.cache/duplicity", "/home/duplicity/.gnupg"]

USER duplicity

CMD ["duplicity"]
