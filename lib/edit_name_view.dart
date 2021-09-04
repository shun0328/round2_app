import 'dart:ui';

import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_name_model.dart';

class EditNameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<EditNameModel>(
      create: (_) => EditNameModel()..getDocId(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Text('ニックネーム', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        // bodyの設定
        body: Consumer<EditNameModel>(
          builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 新しい名前の入力フォーム
                Container(
                  margin: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.height * 0.1, size.width * 0.05, 0),
                  height: size.height * 0.05,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        labelText: '新しいニックネーム',
                        labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (String value) {
                      model.newName = value;
                    },
                  ),
                ),

                // 登録ボタンの配置
                Container(
                  margin: EdgeInsets.fromLTRB(size.width * 0.05,
                      size.height * 0.05, size.width * 0.05, size.height * 0.2),
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
                    onPressed: () async {
                      try {
                        await model.upDateName();
                        // 変更完了の表示
                        final snackBar = SnackBar(content: Text("変更完了"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // 画面遷移
                        Navigator.of(context).pop();
                      } catch (e) {
                        // 失敗した場合->エラーの表示
                        final snackBar = SnackBar(content: Text(e.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
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
