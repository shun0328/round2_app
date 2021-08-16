import 'package:flutter/material.dart';

class TournamentModel extends ChangeNotifier {
  // テキスト03
  final String text03 =
      '　勝ち負けの数にはあまり意味が無く、勝ったときのチップを大きくし、負けたときの損失を最小にするための総合的な戦術がより重要である。';

  final tournamentName = 'JOPT サテライト';
  final date = '2021/10/15';
  final time = '17:00~20:00';
  final buyIn = 3000;
  final reBuy = 2000;
  final stack = 1000;
  final inMoney = 2;
  final structure = "https://round2.poker.jp";
  final numMember = 12;

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
