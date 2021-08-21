import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/setting_model.dart';
import 'package:flutter_app/tournament_model.dart';
import 'package:provider/provider.dart';

class TournamentView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<TournamentModel>(
      create: (_) => TournamentModel()..fetchTournament()..fetchProfile(),
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
        body: Consumer<TournamentModel>(
          builder: (context, model, child) {

              return viewTournament(size, model.tournaments);


          }
        ),
      ),
    );
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
                              0: FlexColumnWidth(0.4),
                              1: FlexColumnWidth(0.6),
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
                                  Text(tournaments[i].entry),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Text("レイトレジスト"),
                                  Text(tournaments[i].lateRegistration),
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

                              



                              Container(
                                width: size.width * 0.28,
                                child: ElevatedButton(
                                  child: (() {
                                    if (tournaments[i].isJoined() == true) {
                                      return Text('キャンセル');
                                    }else{
                                      return Text('参加');
                                    }
                                  })(),
                                  style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(),
                                    primary: (() {
                                      if (tournaments[i].isJoined() == true) {
                                        return Colors.pinkAccent;
                                      }else{
                                        return Colors.lightBlueAccent;
                                      }
                                    })(),
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () {
                                    if(tournaments[i].isJoined() == true){
                                      model.cancelTournament(tournaments[i]);
                                    }else{
                                      model.joinTournament(tournaments[i]);
                                    }
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation1, animation2) => TournamentView(),
                                        transitionDuration: Duration(seconds: 0),
                                      ),
                                    );
                                  },
                                ),
                              ),


                              SizedBox(width: 100),
                              Icon(Icons.account_circle, size: 30.0),
                              Text(' 現在：'),
                              Text(tournaments[i].member.length.toString()),
                              Text(' 人'),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
              ),

          ),

      );
    }
    return SingleChildScrollView(child: Column(children: list));
  }
}
