FROM arm32v7/alpine:3.9

ARG VERSION

RUN apk add --no-cache --update unbound=${VERSION} bind-tools

COPY root/ /

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/unbound", "-d",  "-c", "/etc/unbound/unbound.conf"]

LABEL org.label-schema.name="Unbound" \
      org.label-schema.version=${VERSION} \
      org.label-schema.docker.schema-version="1.0"

HEALTHCHECK --interval=200s --timeout=15s \
            CMD dig @127.0.0.1 google.com || exit 1
