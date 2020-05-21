FROM alpine as certs
RUN apk update && apk add ca-certificates

FROM busybox:glibc
COPY --from=certs /etc/ssl/certs /etc/ssl/certs

ENV ALIYUNCLI_VER 3.0.44 
RUN mkdir -p /usr/local/bin \
    && wget -q https://github.com/aliyun/aliyun-cli/releases/download/v${version}/aliyun-cli-linux-amd64.tar.gz -O - | tar -xzO aliyun > /usr/local/bin/aliyun \
    && chmod 755 /usr/local/bin/aliyun
VOLUME ["/root"]

