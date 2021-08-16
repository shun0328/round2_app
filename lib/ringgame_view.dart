import 'package:flutter/material.dart';
import 'package:flutter_app/ringgame_model.dart';
import 'package:provider/provider.dart';

class RingGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<RingGameModel>(
      create: (_) => RingGameModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: Colors.blueGrey,

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
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[


                // リングゲームA
                Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                      child: Text('Table：' + model.tableName),
                    ),
                    Container(
                      width: size.width,
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, size: 30.0),
                          SizedBox(
                            width: 20,
                          ),
                          Text(model.numMember.toString() + ' / 9名'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(model.time + ' 開始'),
                        ],
                      ),
                    ),
                  ],
                ),


                // リングゲームB
                Column(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                      child: Text('Table：' + model.tableName02),
                    ),
                    Container(
                      width: size.width,
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, size: 30.0),
                          SizedBox(
                            width: 20,
                          ),
                          Text(model.numMember02.toString() + ' / 9名'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(model.time02 + ' 開始'),
                        ],
                      ),
                    ),
                  ],
                ),


              ],
            ),
          );
        }),
      ),
    );
  }
}
