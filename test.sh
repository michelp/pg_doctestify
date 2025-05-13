docker rm -f pg-demo-ext
docker build \
       --build-arg HOST_UID="$(id -u)" \
       --build-arg HOST_GID="$(id -g)" \
       -t pg-demo-ext . \
&& docker run -d \
          --name pg-demo-ext \
          -e POSTGRES_PASSWORD=pass123 \
          -v "$PWD":/usr/src/demo \
          pg-demo-ext \
&& docker exec -u "$(id -u):$(id -g)" pg-demo-ext bash -c "\
        until pg_isready -U postgres; do sleep 3; done; \
        cd /usr/src/demo; \
        PGUSER=postgres make installcheck; \
        PGUSER=postgres make doctest; \
        mkdocs build; \
  " \
docker rm -f pg-demo-ext
