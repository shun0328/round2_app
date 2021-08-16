import 'package:flutter/material.dart';
import 'package:flutter_app/ringgame_model.dart';
import 'package:provider/provider.dart';

class RingGameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<RingGameModel>(
      create: (_) => RingGameModel(),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text(
            'リングゲーム',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
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
                      child: Text('Table：' + model.table_name),
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
                          Text(model.num_member.toString() + ' / 9名'),
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
                      child: Text('Table：' + model.table_name02),
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
                          Text(model.num_member02.toString() + ' / 9名'),
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
