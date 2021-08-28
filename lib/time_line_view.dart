import 'package:Round2/setting_model.dart';
import 'package:Round2/time_line_model.dart';
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
          title: const Text(
            'タイムライン',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),

        // bodyの設定
        body: Consumer<TimeLineModel>(
          builder: (context, model, child) {
            // ローディング画面
            if (model.tweets == null) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // 投稿01
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
                                margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        model.tweets![0].userImage),
                                  ),
                                ),
                              ),
                              Text(model.tweets![0].userName),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Image(
                              image: NetworkImage(model.tweets![0].imageURL)),
                          width: double.infinity,
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            model.tweets![0].text,
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
