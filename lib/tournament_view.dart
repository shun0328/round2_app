import 'package:flutter/material.dart';
import 'package:flutter_app/tournament_model.dart';
import 'package:provider/provider.dart';

class TournamentView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // テキスト03
    final String text03 = '　勝ち負けの数にはあまり意味が無く、勝ったときのチップを大きくし、負けたときの損失を最小にするための総合的な戦術がより重要である。';

    final tournament_name = 'JOPT サテライト';
    final date = '2021/10/15';
    final time = '17:00~20:00';
    final buy_in = 3000;
    final re_buy = 2000;
    final stack = 1000;
    final in_money = 2;
    final structure = "https://round2.poker.jp";
    final num_member = 12;

    return ChangeNotifierProvider<TournamentModel>(
      create: (_) => TournamentModel(),
      child: Scaffold(
          backgroundColor: Colors.blueGrey,

          appBar: AppBar(
            title: const Text('トーナメント', style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),

          body:Consumer<TournamentModel>(builder: (context,model,child){
            return SingleChildScrollView(
                child: Column(
                    children: <Widget>[

                      // トーナメント01
                      Column(
                          children: <Widget>[

                            Container(
                                width: size.width,
                                color: Colors.white,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                                child: Text(tournament_name)
                            ),

                            Container(
                              width: size.width,
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                              child: Table(
                                border: TableBorder.all(color: Colors.white),
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(0.3),
                                  1: FlexColumnWidth(0.7),
                                },
                                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                children: [
                                  TableRow(children: [
                                    Text("日付"),
                                    Text(date),
                                  ]),
                                  TableRow(children: [
                                    Text("エントリー"),
                                    Text(time),
                                  ]),
                                  TableRow(children: [
                                    Text("バイイン"),
                                    Text(buy_in.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("リバイ"),
                                    Text(re_buy.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("初期スタック"),
                                    Text(stack.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("インマネ人数"),
                                    Text(in_money.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("ストラクチャー"),
                                    Text(structure),
                                  ]),

                                ],
                              ),

                            ),


                            Container(
                                width: size.width,
                                color: Colors.white,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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

                                    Icon(Icons.account_circle,size: 30.0),

                                    Text(' 現在：'),

                                    Text(num_member.toString()),

                                    Text(' 人'),

                                  ],
                                )
                            ),

                          ]
                      ),



                      // トーナメント02
                      Column(
                          children: <Widget>[

                            Container(
                                width: size.width,
                                color: Colors.white,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                                child: Text(tournament_name)
                            ),

                            Container(
                              width: size.width,
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                              child: Table(
                                border: TableBorder.all(color: Colors.white),
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(0.3),
                                  1: FlexColumnWidth(0.7),
                                },
                                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                children: [
                                  TableRow(children: [
                                    Text("日付"),
                                    Text(date),
                                  ]),
                                  TableRow(children: [
                                    Text("エントリー"),
                                    Text(time),
                                  ]),
                                  TableRow(children: [
                                    Text("バイイン"),
                                    Text(buy_in.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("リバイ"),
                                    Text(re_buy.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("初期スタック"),
                                    Text(stack.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("インマネ人数"),
                                    Text(in_money.toString()),
                                  ]),
                                  TableRow(children: [
                                    Text("ストラクチャー"),
                                    Text(structure),
                                  ]),

                                ],
                              ),

                            ),


                            Container(
                                width: size.width,
                                color: Colors.white,
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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

                                    Icon(Icons.account_circle,size: 30.0),

                                    Text(' 現在：'),

                                    Text(num_member.toString()),

                                    Text(' 人'),

                                  ],
                                )
                            ),

                          ]
                      ),

                    ]
                )

            );
          })
      )
    );

  }

}