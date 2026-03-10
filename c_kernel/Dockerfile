FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        kmod \
        dkms \
        linux-headers-amd64 \
    && rm -rf /var/lib/apt/lists/*

# DKMS ソースツリーにコピー
COPY hello.c Makefile dkms.conf /usr/src/hello-1.0/

# DKMS でビルド
RUN KVER=$(ls /lib/modules/ | head -1) && \
    dkms add hello/1.0 && \
    dkms build hello/1.0 -k ${KVER}

# モジュール情報を表示（Secure Boot 環境では insmod 不可のため）
CMD KVER=$(ls /lib/modules/ | head -1) && \
    modinfo /var/lib/dkms/hello/1.0/${KVER}/*/module/hello.ko
