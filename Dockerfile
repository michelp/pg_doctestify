FROM postgres:17

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      mkdocs \
      build-essential \
      postgresql-server-dev-17 \
 && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/demo

WORKDIR /usr/src/demo
RUN make install

WORKDIR /
