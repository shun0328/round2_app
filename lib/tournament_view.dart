import 'package:flutter/material.dart';
import 'package:flutter_app/tournament_model.dart';
import 'package:provider/provider.dart';

class TournamentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<TournamentModel>(
      create: (_) => TournamentModel(),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text(
            'トーナメント',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<TournamentModel>(
          builder: (context, model, child) {
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
                          child: Text(model.tournament_name)),
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
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.top,
                          children: [
                            TableRow(
                              children: [
                                Text("日付"),
                                Text(model.date),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("エントリー"),
                                Text(model.time),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("バイイン"),
                                Text(model.buy_in.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("リバイ"),
                                Text(model.re_buy.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("初期スタック"),
                                Text(model.stack.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("インマネ人数"),
                                Text(model.in_money.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("ストラクチャー"),
                                Text(model.structure),
                              ],
                            ),
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
                            Icon(Icons.account_circle, size: 30.0),
                            Text(' 現在：'),
                            Text(model.num_member.toString()),
                            Text(' 人'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // トーナメント02
                  Column(
                    children: <Widget>[
                      Container(
                        width: size.width,
                        color: Colors.white,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                        child: Text(model.tournament_name),
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
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.top,
                          children: [
                            TableRow(
                              children: [
                                Text("日付"),
                                Text(model.date),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("エントリー"),
                                Text(model.time),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("バイイン"),
                                Text(model.buy_in.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("リバイ"),
                                Text(model.re_buy.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("初期スタック"),
                                Text(model.stack.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("インマネ人数"),
                                Text(model.in_money.toString()),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text("ストラクチャー"),
                                Text(model.structure),
                              ],
                            ),
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
                            Icon(Icons.account_circle, size: 30.0),
                            Text(' 現在：'),
                            Text(model.num_member.toString()),
                            Text(' 人'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
