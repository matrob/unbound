FROM arm32v7/alpine:3.9

ARG VERSION

RUN apk add --no-cache --update unbound=${VERSION}

COPY root/ /

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/unbound", "-d",  "-c", "/etc/unbound/unbound.conf"]

LABEL org.label-schema.name="Unbound" \
      org.label-schema.version=${VERSION} \
      org.label-schema.docker.schema-version="1.0"
