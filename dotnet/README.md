# C# (.NET 8) - Hello World

## C#言語とは

C# はMicrosoftが開発したオブジェクト指向プログラミング言語。.NETプラットフォーム上で動作し、型安全性と生産性を両立した汎用言語として広く利用されている。

> **注**: .NET Core は .NET 5 で「.NET」に名称統一された。本プロジェクトでは .NET 8（LTS）を使用している。

## 特徴

- **強い型システム**: コンパイル時に型エラーを検出
- **ガベージコレクション**: メモリ管理を自動化
- **クロスプラットフォーム**: .NET上でWindows/Linux/macOSに対応
- **豊富な標準ライブラリ**: ネットワーク、ファイルIO、LINQ等を標準搭載
- **非同期プログラミング**: `async`/`await` による直感的な非同期処理
- **マルチパラダイム**: オブジェクト指向・関数型の両スタイルに対応

## ファイル構成

| ファイル | 説明 |
|---|---|
| `hello.cs` | Hello Worldソースコード |
| `Dockerfile` | .NET 8.0のビルド・実行環境 |

## ビルドと実行

```bash
# Dockerイメージのビルド
docker build -t dotnet-hello .

# 実行
docker run --rm dotnet-hello
```

## 出力

```
Hello, World!
```
