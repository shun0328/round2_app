import 'package:flutter/material.dart';
import 'package:flutter_app/event_model.dart';
import 'package:flutter_app/ringgame_view.dart';
import 'package:flutter_app/tournament_view.dart';
import 'package:provider/provider.dart';

class EventView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<EventModel>(
      create: (_) => EventModel(),

      child: Scaffold(
          backgroundColor: Colors.blueGrey,

          appBar: AppBar(
            title: const Text('イベント情報',
              style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
          ),

          body: Consumer<EventModel>(builder: (context,model,child){
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
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => TournamentView(),
                            )
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
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => RingGameView(),
                            )
                        );
                      },
                    ),
                  ),


                  // インスタグラムボタンの配置
                  Positioned(
                    left: size.width * 0.1,
                    top: size.height * 0.44,
                    width: size.width * 0.2,
                    height: size.width * 0.22,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/instagram.png',
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {
                            // 押下時の処理を記述
                          },
                        ),
                      ),
                    ),
                  ),


                  // ツイッターボタンの配置
                  Positioned(
                    top: size.height * 0.44,
                    left: size.width * 0.5 - size.width * 0.1,
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/twitter.png',
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {
                            // 押下時の処理を記述
                          },
                        ),
                      ),
                    ),
                  ),


                  // ラインボタンの配置
                  Positioned(
                    top: size.height * 0.44,
                    right: size.width * 0.1,
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/line.png',
                          ),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {
                            // 押下時の処理を記述
                          },
                        ),
                      ),
                    ),
                  )

                ]
            );
          }
          )


      )
    );
      
      

  }

}