import 'package:Round2/create_user_model.dart';
import 'package:Round2/login_view.dart';
import 'package:Round2/main.dart';
import 'package:Round2/privacy_policy.dart';
import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<CreateUserModel>(
      create: (_) => CreateUserModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // bodyの設定
        body: Consumer<CreateUserModel>(
          builder: (context, model, child) {
            // 真ん中に配置(縦方向)
            return Center(
              child: Container(
                // 色を設定
                color: Colors.white,
                // 外側の間隔を調整
                margin: EdgeInsets.fromLTRB(
                    size.width * 0.05, 0, size.width * 0.05, 0),
                // 内側の間隔を調整
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.1, 0, size.width * 0.1, 0),

                // スクロールするためのウィジェット
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // テキスト'会員登録'の配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
                        child: Text(
                          "会員登録",
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),

                      // お名前入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        height: size.height * 0.05,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: 'お名前(フルネーム)'),
                          onChanged: (String value) {
                            model.name = value;
                          },
                        ),
                      ),

                      // ニックネーム入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        height: size.height * 0.05,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: 'ニックネーム'),
                          onChanged: (String value) {
                            model.nickName = value;
                          },
                        ),
                      ),

                      // メールアドレス入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        height: size.height * 0.05,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: 'メールアドレス'),
                          onChanged: (String value) {
                            model.email = value;
                          },
                        ),
                      ),

                      // パスワード入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        height: size.height * 0.05,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: 'パスワード'),
                          onChanged: (String value) {
                            model.password = value;
                          },
                        ),
                      ),

                      // 確認用パスワード入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        height: size.height * 0.05,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: 'パスワード確認'),
                          onChanged: (String value) {
                            model.password2 = value;
                          },
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0, size.height * 0.02, 0, size.height * 0.02),
                        width: double.infinity,
                        // ユーザー登録ボタン
                        child: TextButton(
                          child: Text('利用規約とプライバシーポリシーに同意して'),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 11),
                            primary: Colors.grey,
                          ),
                          onPressed: () {
                            // ボタンを押した時の処理
                            // 画面遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivacyPolicy(),
                              ),
                            );
                          },
                        ),
                      ),

                      // 登録ボタンの配置
                      Container(
                        width: double.infinity,
                        height: size.height * 0.05,
                        // ログイン登録ボタン
                        child: ElevatedButton(
                          child: Text('登録する'),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(),
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            try {
                              // 新規ユーザ登録
                              await model.addUser();
                              // ユーザ登録が成功したら登録完了の表示
                              final snackBar = SnackBar(content: Text("登録完了"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              // 画面遷移
                              await Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }),
                              );
                            } catch (e) {
                              // 登録に失敗した時の処理↓

                              // エラー分を翻訳
                              String errorMessage =
                                  model.translateError(e.toString());

                              // エラーの表示
                              final snackBar =
                                  SnackBar(content: Text(errorMessage));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
                        child: TextButton(
                          child: Text('アカウントをお持ちの方はこちら'),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 13),
                            primary: Colors.grey,
                          ),
                          onPressed: () {
                            // 画面遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
