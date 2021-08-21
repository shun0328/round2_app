import 'package:flutter/material.dart';
import 'package:flutter_app/ring_game_model.dart';
import 'package:flutter_app/setting_model.dart';
import 'package:provider/provider.dart';

class RingGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<RingGameModel>(
      create: (_) => RingGameModel()..fetchRingGame(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: const Text(
            'リングゲーム',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        // bodyの設定
        body: Consumer<RingGameModel>(builder: (context, model, child) {
          // ローディング画面
          if (model.ringGames == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          }
          // データが読み込めたらWidgetを作成
          else {
            // 最後にWidgetのリスト"list"を使って画面を構成する
            List<Widget> list = [];

            // RingGameオブジェクトを元にレイアウトを行う
            for (var i = 0; i < model.ringGames!.length; i++) {
              list.add(Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      // テーブル名を設置
                      Container(
                        width: size.width,
                        color: Colors.white,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                        child: Text('Table：' + model.ringGames![i].tableName),
                      ),
                      // アイコンと人数と時間を横に並べる
                      Container(
                        width: size.width,
                        color: Colors.white,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                        child: Row(
                          children: [
                            // アイコン
                            Icon(Icons.account_circle, size: 30.0),
                            SizedBox(
                              width: 10,
                            ),
                            // 人数
                            Text(model.ringGames![i].numMember.toString() +
                                ' / 9名'),
                            SizedBox(
                              width: 20,
                            ),
                            // 時間
                            Text(model.ringGames![i].time + ' 開始'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
            }

            // 作成したウィジェットのリストででSingleChildScrollViewを構成
            return SingleChildScrollView(child: Column(children: list));
          }
        }),
      ),
    );
  }
}
