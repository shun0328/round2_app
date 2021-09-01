import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_image_model.dart';

class EditImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<EditImageModel>(
      create: (_) => EditImageModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Text('プロフィール画像', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        // bodyの設定
        body: Consumer<EditImageModel>(builder: (context, model, child) {
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: InkWell(
                      hoverColor: Colors.black54,
                      onTap: () async {},
                      child: Container(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(model.imageURL),
                          ),
                        ),
                      )),
                ),
                // 登録ボタンの配置
                Container(
                  margin: EdgeInsets.fromLTRB(size.width * 0.2,
                      size.height * 0.1, size.width * 0.2, size.height * 0.1),
                  width: double.infinity,
                  height: size.height * 0.05,
                  // ログイン登録ボタン
                  child: ElevatedButton(
                    child: Text('保存'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(),
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () async {},
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
