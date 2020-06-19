FROM alpine as certs
RUN apk update && apk add ca-certificates

FROM busybox:glibc
COPY --from=certs /etc/ssl/certs /etc/ssl/certs

ENV ALIYUNCLI_VER 3.0.47 
RUN mkdir -p /usr/local/bin \
    && wget -q https://github.com/aliyun/aliyun-cli/releases/download/v${ALIYUNCLI_VER}/aliyun-cli-linux-${ALIYUNCLI_VER}-amd64.tgz -O - | tar -xzO aliyun > /usr/local/bin/aliyun \
    && chmod 755 /usr/local/bin/aliyun
VOLUME ["/root"]

