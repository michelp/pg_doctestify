docker rm -f pg-demo-ext
docker build -t pg-demo-ext . \
&& docker run -d \
  --name pg-demo-ext \
  -e POSTGRES_PASSWORD=pass123 \
  -v "$PWD":/usr/src/demo \
  pg-demo-ext \
&& docker exec pg-demo-ext bash -c "\
    until pg_isready -U postgres; do sleep 3; done; \
    cd /usr/src/demo; \
    PGUSER=postgres make installcheck; \
    PGUSER=postgres make doctest; \
    mkdocs build; \
  " \
docker rm -f pg-demo-ext
