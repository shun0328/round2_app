import 'package:flutter/material.dart';
import 'package:flutter_app/event_model.dart';
import 'package:flutter_app/ring_game_view.dart';
import 'package:flutter_app/setting_model.dart';
import 'package:flutter_app/tournament_view.dart';
import 'package:provider/provider.dart';

class EventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<EventModel>(
      create: (_) => EventModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Text(
            'イベント情報',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),

        // bodyの設定
        body: Consumer<EventModel>(
          builder: (context, model, child) {
            // Stack：子要素を重ねて描画できるwidget
            return Stack(
              children: <Widget>[
                // トーナメントボタンの配置
                Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.2,
                  width: size.width * 0.8,
                  height: size.width * 0.15,
                  child: ElevatedButton(
                    child: Text('トーナメント'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      // ボタンを押した時の処理
                      // 画面遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TournamentView(),
                        ),
                      );
                    },
                  ),
                ),

                // リングゲームボタンの配置
                Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.32,
                  width: size.width * 0.8,
                  height: size.width * 0.15,
                  child: ElevatedButton(
                    child: const Text('リングゲーム'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      // ボタンを押した時の処理
                      // 画面遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RingGameView(),
                        ),
                      );
                    },
                  ),
                ),

                // インスタグラムボタンの配置
                Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.44,
                  width: size.width * 0.35,
                  height: size.width * 0.22,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'images/instagram.png',
                        ),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          model.launchInstagram();
                        },
                      ),
                    ),
                  ),
                ),

                // ツイッターボタンの配置
                Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.55,
                  width: size.width * 0.35,
                  height: size.width * 0.22,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'images/twitter.png',
                        ),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          // ボタンを押した時の処理
                          model.launchTwitter();
                        },
                      ),
                    ),
                  ),
                ),

                // ラインボタンの配置
                Positioned(
                  top: size.height * 0.44,
                  right: size.width * 0.1,
                  width: size.width * 0.35,
                  height: size.width * 0.22,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'images/line.png',
                        ),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          // ボタンを押した時の処理
                          model.launchLine();
                        },
                      ),
                    ),
                  ),
                ),

                // フェイスブックボタンの配置
                Positioned(
                  top: size.height * 0.55,
                  right: size.width * 0.1,
                  width: size.width * 0.35,
                  height: size.width * 0.22,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(
                          'images/facebook.png',
                        ),
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          // ボタンを押した時の処理
                          model.launchFacebook();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
