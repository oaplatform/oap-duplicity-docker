FROM wernight/duplicity

RUN set -x \
 && pip install azure

VOLUME ["/home/duplicity/.cache/duplicity", "/home/duplicity/.gnupg"]

USER duplicity

CMD ["duplicity"]
