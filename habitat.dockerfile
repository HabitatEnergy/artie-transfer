FROM --platform=linux/amd64 alpine:3.21

RUN apk add --no-cache tzdata \
    && apk add --no-cache \
       kafkacat \
       bash \
       ca-certificates

COPY dist/artie-transfer_linux_amd64_v1/transfer /transfer

ENTRYPOINT ["/transfer"]