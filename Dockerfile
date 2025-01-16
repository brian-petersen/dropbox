FROM docker.io/debian:12 AS downloader

WORKDIR /tmp/bin

RUN apt update && apt install -y wget
RUN wget -O bin https://github.com/wantguns/bin/releases/download/v2.4.0/bin-v2.4.0-x86_64-unknown-linux-gnu
RUN chmod +x bin

RUN mkdir uploads

FROM gcr.io/distroless/base-debian12
# FROM gcr.io/distroless/base-debian12:debug

WORKDIR /app

COPY --from=downloader /tmp/bin/bin bin
COPY --from=downloader --chown=nonroot:nonroot /tmp/bin/uploads /uploads

USER nonroot:nonroot

ENTRYPOINT ["/app/bin", "--address", "0.0.0.0", "--port", "8080", "--upload", "/uploads"]
