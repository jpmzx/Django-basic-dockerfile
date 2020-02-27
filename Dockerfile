FROM python:3.6-alpine


RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache \
    python-dev \
    py-virtualenv \
    nano \
    gosu \
    bash \
    gcc 

ENV VIRTUAL_ENV=/venv

RUN virtualenv -p /usr/local/bin/python $VIRTUAL_ENV

RUN chmod 777 /var/tmp/

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

ENV PYTHONPATH=$VIRTUAL_ENV/bin/python

COPY ./requirements.txt /app_requirements.txt

RUN pip install --no-cache-dir -r /app_requirements.txt

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod 777 /usr/local/bin/entrypoint.sh \
    && ln -s /usr/local/bin/entrypoint.sh /

COPY ./myproject /app/myproject

WORKDIR /app/myproject/

ENTRYPOINT ["entrypoint.sh"]