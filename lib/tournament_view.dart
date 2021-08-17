import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tournament_model.dart';
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
        backgroundColor: Colors.blueGrey,

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
            return model.viewTournament(size, model.tournaments);
          }
        ),
      ),
    );
  }
}
