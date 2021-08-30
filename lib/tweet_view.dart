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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                              //print("タップタップ");
                              FocusScope.of(context).unfocus();
                              await model.showImagePicker();
                              //print("test");
                              // model.updateURL();
                              //model.fetchProfile();
                              /*
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          TweetView(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );

                               */
                            },
                          ),
                        ),
                        Container(
                          //width: double.infinity,
                          //margin: EdgeInsets.fromLTRB(0, 0, size.width * 0.01, 0),
                          child: TextButton(
                            child: Text('投稿'),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20),
                              primary: Colors.lightBlue,
                            ),
                            onPressed: () {
                              model.addTweet();
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //margin: EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 0),
                      color: Colors.white.withOpacity(0.7),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: TextField(
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            //controller: _replyTextController,
                            onChanged: (String value) {
                              //reply = _replyTextController.text;
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
