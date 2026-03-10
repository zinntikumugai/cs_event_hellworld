// hello.dart - Dart言語のHello Worldプログラム

// dart:async - 非同期プログラミングの中核ライブラリ
// Stream, Future, Timer などを提供
import 'dart:async';

// dart:io - ファイル・ネットワーク・標準入出力を提供
// stdout を使うことで改行なしの1文字出力が可能
import 'dart:io';

// Stream.periodic: 一定間隔でイベントを発行するストリームを生成
// Dart の非同期ストリームは、イベント駆動処理の基盤
// await for: ストリームからイベントを1つずつ非同期に受け取る構文
void main() async {
  final message = 'Hello, World!';

  // Stream.periodic で 80ms 間隔のストリームを生成
  // コールバックでインデックスを受け取り、対応する文字を返す
  // .take(n) で必要な文字数だけ取り出して自動終了
  final stream = Stream<String>.periodic(
    Duration(milliseconds: 80),
    (i) => message[i],
  ).take(message.length);

  // await for でストリームを購読し、1文字ずつ出力
  // print() ではなく stdout.write() を使い、改行なしで出力
  await for (final char in stream) {
    stdout.write(char);
  }

  // 最後に改行を出力
  print('');
}
