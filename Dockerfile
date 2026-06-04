# syntax=docker/dockerfile:1

FROM rust:1-slim-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 scripts/install.sh /tmp/install.sh
RUN /tmp/install.sh

EXPOSE 4200
VOLUME /data
ENV OPENFANG_HOME=/data
ENTRYPOINT ["openfang"]
CMD ["start"]
