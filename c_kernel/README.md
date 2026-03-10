# C カーネルモジュール - Hello, World!

## 概要

Linux カーネルモジュールとして "Hello, World!" を出力するプログラム。
ユーザー空間のプログラムとは異なり、`printf` ではなく `printk` を使用してカーネルログに出力する。

## カーネルモジュールの特徴

- カーネル空間で動作するコード
- `printk` によるカーネルログバッファへの出力（`dmesg` で確認）
- `module_init` / `module_exit` によるロード・アンロード時の処理定義
- `insmod` / `rmmod` コマンドで動的にロード・アンロード可能
- GPL ライセンスの宣言が必要

## ファイル構成

| ファイル | 説明 |
|---|---|
| `hello.c` | カーネルモジュールのソースコード |
| `Makefile` | kbuild システム用ビルドファイル |
| `dkms.conf` | DKMS 設定ファイル |
| `Dockerfile` | ビルド・実行環境の定義 |
| `README.md` | このファイル |

## ビルドと実行

### Docker でビルド

```bash
docker build -t hello-kernel .
```

### Docker で実行（モジュール情報の表示）

```bash
docker run hello-kernel
```

### ホスト環境で DKMS を使う場合

```bash
# DKMS にソースを登録
sudo cp -r . /usr/src/hello-1.0/
sudo dkms add hello/1.0

# ビルド・インストール
sudo dkms build hello/1.0
sudo dkms install hello/1.0

# モジュールのロード（Secure Boot 無効環境のみ）
sudo modprobe hello

# カーネルログで出力を確認
dmesg | tail -1

# アンロード・削除
sudo modprobe -r hello
sudo dkms remove hello/1.0 --all
```

> Secure Boot 有効環境では署名なしモジュールのロードは拒否されます。

## 期待される出力

### Docker（modinfo）

```
filename:       /module/hello.ko
description:    Hello World Kernel Module
author:         cs_event
license:        GPL
```

### ホスト環境（dmesg）

```
Hello, World!
```
