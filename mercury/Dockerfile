FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    gnupg \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO /etc/apt/trusted.gpg.d/paulbone.asc https://paul.bone.id.au/paul.asc \
    && echo "deb http://dl.mercurylang.org/deb/ jammy main" > /etc/apt/sources.list.d/mercury.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends mercury-recommended \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["mmc", "--help"]
