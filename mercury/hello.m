% hello.m - Mercury言語のHello Worldプログラム

% モジュール宣言: このファイルが "hello" モジュールであることを定義
:- module hello.

% インターフェースセクション: 外部に公開する宣言を記述
:- interface.

% ioモジュールのインポート: 入出力操作に必要
:- import_module io.

% main述語の宣言
% io::di (destructive input) - IO状態の入力（消費される）
% io::uo (unique output) - IO状態の出力（新たに生成される）
% is det - この述語は必ず1つの解を持つ（決定的）
:- pred main(io::di, io::uo) is det.

% 実装セクション: 述語の具体的な処理を記述
:- implementation.

% main述語の実装
% !IO は状態変数の省略記法で、IO0 -> IO1 のように状態を受け渡す
% io.write_string/3 で文字列を標準出力に書き出す
main(!IO) :-
    io.write_string("Hello, World!\n", !IO).
