import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TournamentModel extends ChangeNotifier {
  final _tournamentCollection = FirebaseFirestore.instance.collection('tournaments');

  // トーナメントオブジェクトのリスト
  List<Tournament>? tournaments;

  // FireBaseからトーナメント情報を取得
  void fetchTournament() async{

    // データベースからデータを受け取る
    final snapshot = await _tournamentCollection.get();

    // 受け取った情報からインスタンスを生成
    final List<Tournament> tournaments = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String tournamentName = data['tournamentName'];
      final String date = data['date'];
      final String entry = data['entry'];
      final String lateRegistration = data['lateRegistration'];
      final int buyIn = data['buyIn'];
      final int reBuy = data['reBuy'];
      final int stack = data['stack'];
      final String structure = data['structure'];
      final int numMember = data['numMember'];
      return Tournament(tournamentName, date, entry, lateRegistration, buyIn, reBuy, stack, structure, numMember);
    }).toList();

    // トーナメントオブジェクトのリストが完成
    this.tournaments = tournaments;

    // 終わった事をviewに知らせる
    notifyListeners();
  }
}


// tournament object
class Tournament{

  // constructor
  Tournament(this.tournamentName, this.date, this.entry, this.lateRegistration, this.buyIn, this.reBuy, this.stack, this.structure, this.numMember );
  String tournamentName;
  String date;
  String entry;
  String lateRegistration;
  int buyIn;
  int reBuy;
  int stack;
  String structure;
  int numMember;
}
