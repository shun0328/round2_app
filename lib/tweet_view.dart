import 'package:Round2/setting_model.dart';
import 'package:Round2/tweet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TweetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<TweetModel>(
      create: (_) => TweetModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Text(
            '新規投稿',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        // bodyの設定
        body: Consumer<TweetModel>(
          builder: (context, model, child) {
            return Container(
              // 外側の間隔を調整
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              // 内側の間隔を調整
              padding: EdgeInsets.fromLTRB(
                  size.width * 0.05, size.width * 0.05, size.width * 0.05, 0),
              width: size.width - 20,
              height: size.height * 0.8,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // 画像の追加アイコンボタン、投稿ボタン
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // 画像の追加アイコンボタン
                        Container(
                          //width: double.infinity,
                          margin:
                              EdgeInsets.fromLTRB(0, 0, size.width * 0.05, 0),
                          child: IconButton(
                            //iconSize: size.height * 0.05,
                            icon:
                                const Icon(Icons.add_photo_alternate_outlined),
                            color: Colors.lightBlue,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              await model.showImagePicker();
                            },
                          ),
                        ),

                        // 投稿ボタン
                        Container(
                          child: TextButton(
                            child: Text('投稿'),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              primary: Colors.lightBlue,
                            ),
                            onPressed: () {
                              // ボタンを押した時の処理
                              // データベースに投稿内容を送信
                              model.addTweet();
                              // 画面遷移
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),

                    // 投稿内容の入力フォーム
                    Container(
                      color: Colors.white.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            onChanged: (String value) {
                              model.text = value;
                            },
                            decoration: InputDecoration(
                              //labelText: 'ここにテキストを入力',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 画像があれば画像を表示
                    (() {
                      print(model.imageFile);
                      if (model.imageFile == null) {
                        return SizedBox();
                      } else {
                        return Container(
                          color: Colors.white,
                          //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Image(image: FileImage(model.imageFile!)),
                          width: double.infinity,
                        );
                      }
                    })(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
