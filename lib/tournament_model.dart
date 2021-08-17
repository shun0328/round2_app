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
      final String time = data['time'];
      final int buyIn = data['buyIn'];
      final int reBuy = data['reBuy'];
      final int stack = data['stack'];
      final int inMoney = data['inMoney'];
      final String structure = data['structure'];
      final int numMember = data['numMember'];
      return Tournament(tournamentName, date, time, buyIn, reBuy, stack, inMoney, structure, numMember);
    }).toList();

    // トーナメントオブジェクトのリストが完成
    this.tournaments = tournaments;

    // 終わった事をviewに知らせる
    notifyListeners();
  }


  // トーナメントViewを表示するためのカスタムWidgetを作成
  Widget viewTournament (Size size, List<Tournament>? tournaments) {

    // 最後にWidgetのリスト"list"をColumnに包んでViewに渡す
    List <Widget> list = [];

    // ローディング画面
    if(tournaments == null){
      return Center(
        child: Text('Loading...',
        textAlign: TextAlign.center,),
      );
    }

    // tournamentオブジェクトを元にレイアウトを行う
    for(var i = 0; i < tournaments.length; i++) {
      list.add(
        Column(
          children: <Widget>[

            Container(
                width: size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                child: Text(tournaments[i].tournamentName,
                style: TextStyle(fontWeight: FontWeight.bold),)),

            Container(
              width: size.width,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(0.3),
                  1: FlexColumnWidth(0.7),
                },
                defaultVerticalAlignment:
                TableCellVerticalAlignment.top,
                children: [
                  TableRow(
                    children: [
                      Text("日付"),
                      Text(tournaments[i].date),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("エントリー"),
                      Text(tournaments[i].time),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("バイイン"),
                      Text(tournaments[i].buyIn.toString()),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("リバイ"),
                      Text(tournaments[i].reBuy.toString()),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("初期スタック"),
                      Text(tournaments[i].stack.toString()),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("インマネ人数"),
                      Text(tournaments[i].inMoney.toString()),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("ストラクチャー"),
                      Text(tournaments[i].structure),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: size.width,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text('参加'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(),
                      primary: Colors.lightBlueAccent,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 100),
                  Icon(Icons.account_circle, size: 30.0),
                  Text(' 現在：'),
                  Text(tournaments[i].numMember.toString()),
                  Text(' 人'),
                ],
              ),
            ),
          ],
        )
      );
    }

    return Column(children: list);
  }

}


// tournament object
class Tournament{
  Tournament(this.tournamentName, this.date, this.time, this.buyIn, this.reBuy, this.stack, this.inMoney, this.structure, this.numMember );
  String tournamentName;
  String date;
  String time;
  int buyIn;
  int reBuy;
  int stack;
  int inMoney;
  String structure;
  int numMember;
}
