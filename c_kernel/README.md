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

### ホスト環境で直接ビルド・実行する場合

```bash
# ビルド（linux-headers が必要）
make

# モジュールのロード（Secure Boot 無効環境のみ）
sudo insmod hello.ko

# カーネルログで出力を確認
dmesg | tail -1

# モジュールのアンロード
sudo rmmod hello
```

> Secure Boot 有効環境では署名なしモジュールの `insmod` は拒否されます。

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
