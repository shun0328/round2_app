import 'package:Round2/setting_model.dart';
import 'package:Round2/time_line_model.dart';
import 'package:Round2/tweet_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeLineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<TimeLineModel>(
      create: (_) => TimeLineModel()..fetchTweet(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'タイムライン',
                style: TextStyle(color: Colors.black),
              ),
              /*
              IconButton(
                icon: Icon(Icons.add, color: Colors.lightBlue),
                onPressed: () {
                  // 画面遷移
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          TweetView(),
                      transitionDuration: Duration(seconds: 0),
                    ),
                  );
                },
              )

               */
            ],
          ),
          backgroundColor: Colors.white,
        ),

        // bodyの設定
        body: Stack(
          children: [
            Positioned(
              //left: 0,
              //top: 0,
              //height: size.height,
              child: Consumer<TimeLineModel>(
                builder: (context, model, child) {
                  // ローディング画面
                  if (model.tweets == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }
                  // データが読み込めたらWidgetを作成
                  else {
                    // 最後にWidgetのリスト"list"を使って画面を構成する
                    List<Widget> list = [];

                    // RingGameオブジェクトを元にレイアウトを行う
                    for (var i = 0; i < model.tweets!.length; i++) {
                      list.add(
                        Column(
                          children: <Widget>[
                            // 投稿内容
                            Column(
                              children: <Widget>[
                                Container(
                                  width: size.width,
                                  color: Colors.white,
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 15, 0),
                                        width: size.height * 0.06,
                                        height: size.height * 0.06,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                model.tweets![i].userImage),
                                          ),
                                        ),
                                      ),
                                      Text(model.tweets![i].userName),
                                      Expanded(child: SizedBox()),
                                      (() {
                                        if (model.tweets![i].userUID ==
                                            FirebaseAuth
                                                .instance.currentUser!.uid) {
                                          return IconButton(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 15, 0),
                                            color: Colors.redAccent,
                                            onPressed: () {
                                              // ツイートを削除
                                              model.deleteTweet(
                                                  model.tweets![i].docId);
                                              //
                                            },
                                            icon: const Icon(
                                                Icons.delete_forever),
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      }()),
                                    ],
                                  ),
                                ),

                                Container(
                                  width: double.infinity,
                                  color: Colors.white,
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Text(
                                    model.tweets![i].text,
                                    style: TextStyle(fontSize: 15),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),

                                // 画像があれば画像を表示
                                (() {
                                  if (model.tweets![i].imageURL == '') {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  } else {
                                    return Container(
                                      color: Colors.white,
                                      margin:
                                          EdgeInsets.fromLTRB(10, 0, 10, 10),
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Image(
                                          image: NetworkImage(
                                              model.tweets![i].imageURL)),
                                      width: double.infinity,
                                    );
                                  }
                                })(),
                              ],
                            ),
                          ],
                        ),
                      );
                    }

                    // 作成したウィジェットのリストででSingleChildScrollViewを構成
                    return SingleChildScrollView(child: Column(children: list));
                  }
                },
              ),
            ),
            Positioned(
              top: size.height * 0.66,
              left: size.width * 0.75,
              child: CircleAvatar(
                radius: size.height * 0.04,
                backgroundColor: Colors.lightBlue,
                child: IconButton(
                  padding: EdgeInsets.fromLTRB(0.1, 0.1, 0.1, 0.1),
                  icon: Icon(
                    Icons.add,
                    size: size.height * 0.05,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // 画面遷移
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            TweetView(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
