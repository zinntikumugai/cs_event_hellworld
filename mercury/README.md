# Mercury - Hello World

## Mercury言語とは

Mercury は強い型付けと決定性解析を持つ論理型/関数型プログラミング言語。Prologをベースに、コンパイル時の静的解析による高い信頼性と最適化を実現している。

## 特徴

- **強い型システム**: コンパイル時に型エラーを検出
- **決定性解析**: 述語が返す解の数をコンパイル時に保証（`det`, `semidet`, `multi`, `nondet`）
- **モード解析**: 引数の入出力方向を静的に解析（`di`, `uo`, `in`, `out`）
- **一意型**: IO状態の安全な受け渡しを型で保証
- **モジュールシステム**: `interface` と `implementation` の分離による情報隠蔽
- **C言語へのコンパイル**: ネイティブコードに変換され高速に実行

## ファイル構成

| ファイル | 説明 |
|---|---|
| `hello.m` | Hello Worldソースコード |
| `Dockerfile` | Mercury言語のビルド環境 |

## ビルドと実行

```bash
# Dockerイメージのビルド
docker build -t mercury .

# コンパイルと実行
docker run --rm -v "$(pwd)":/workspace mercury sh -c "mmc --make hello && ./hello"
```

## 出力

```
Hello, World!
```
