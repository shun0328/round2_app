import 'package:Round2/setting_model.dart';
import 'package:Round2/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TournamentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<TournamentModel>(
      create: (_) => TournamentModel()..fetchTournament(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: const Text(
            'トーナメント',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        // bodyの設定
        body: Consumer<TournamentModel>(builder: (context, model, child) {
          // ローディング画面
          if (model.tournaments == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            // 最後にWidgetのリスト"list"を使って画面を構成する
            List<Widget> list = [];

            // tournamentオブジェクトを元にレイアウトを行う
            for (var i = 0; i < model.tournaments!.length; i++) {
              list.add(
                ChangeNotifierProvider<TournamentModel>(
                  create: (_) => TournamentModel()..fetchTournament(),
                  child: Consumer<TournamentModel>(
                      builder: (context, model, child) {
                    return Column(
                      children: <Widget>[
                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                            child: Text(
                              model.tournaments?[i].tournamentName ?? 'hoge',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                          width: size.width,
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Table(
                            border: TableBorder.all(color: Colors.white),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FlexColumnWidth(0.4),
                              1: FlexColumnWidth(0.6),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.top,
                            children: [
                              TableRow(
                                children: [
                                  Text("日付"),
                                  Text(model.tournaments?[i].date ?? 'hoge'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("エントリー"),
                                  Text(model.tournaments?[i].entry ?? 'hoge'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("レイトレジスト"),
                                  Text(model.tournaments?[i].lateRegistration ??
                                      'hoge'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("バイイン"),
                                  Text(model.tournaments?[i].buyIn.toString() ??
                                      '0'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("リバイ"),
                                  Text(model.tournaments?[i].reBuy.toString() ??
                                      '0'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("初期スタック"),
                                  Text(model.tournaments?[i].stack.toString() ??
                                      '0'),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("ストラクチャー"),
                                  Text(
                                      model.tournaments?[i].structure ?? 'url'),
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
                              Container(
                                width: size.width * 0.28,
                                child: ElevatedButton(
                                  child: (() {
                                    if (model.tournaments?[i].isJoined() ??
                                        false == true) {
                                      return Text(
                                        'キャンセル',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    } else {
                                      return Text(
                                        '参加',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    }
                                  })(),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(),
                                    primary: (() {
                                      if (model.tournaments?[i].isJoined() ??
                                          false == true) {
                                        return Colors.pinkAccent;
                                      } else {
                                        return Colors.lightBlueAccent;
                                      }
                                    })(),
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () {
                                    if (model.tournaments![i].isJoined() ==
                                        true) {
                                      model.cancelTournament(
                                          model.tournaments![i]);
                                    } else {
                                      model.joinTournament(
                                          model.tournaments![i]);
                                    }
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation1, animation2) =>
                                                TournamentView(),
                                        transitionDuration:
                                            Duration(seconds: 0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 40),
                              Icon(Icons.account_circle, size: 30.0),
                              Text(' 現在：'),
                              Text(model.tournaments?[i].member.length
                                      .toString() ??
                                  '0'),
                              Text(' 人'),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              );
            }

            return SingleChildScrollView(child: Column(children: list));
          }
        }),
      ),
    );
  }
}
