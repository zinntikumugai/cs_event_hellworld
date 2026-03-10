FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        kmod \
        linux-headers-amd64 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /module

COPY hello.c Makefile ./

# カーネルヘッダのバージョンを自動検出してビルド
RUN KVER=$(ls /lib/modules/ | head -1) && \
    make -C /lib/modules/${KVER}/build M=/module modules

# モジュール情報を表示（Secure Boot 環境では insmod 不可のため）
CMD modinfo hello.ko
