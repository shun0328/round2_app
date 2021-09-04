import 'package:Round2/create_user_view.dart';
import 'package:Round2/login_model.dart';
import 'package:Round2/main.dart';
import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // bodyの設定
        body: Consumer<LoginModel>(
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
                    size.width * 0.1, 0, size.width * 0.1, size.height * 0.02),

                // スクロールするためのウィジェット
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // テキスト'ログイン'の配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
                        child: Text(
                          "ログイン",
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),

                      // メールアドレス入力フォームの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
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

                      // ログインボタンの配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        width: double.infinity,
                        height: size.height * 0.065,
                        // ログイン登録ボタン
                        child: ElevatedButton(
                          child: Text('ログインする'),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(),
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            try {
                              // ログイン(email/pass認証)
                              await model.login();
                              // ログインに成功した時->画面遷移
                              await Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }),
                              );
                            } catch (e) {
                              // ログインに失敗した時の処理↓
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

                      // テキストボタン'会員登録はこちら'を配置
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
                        child: TextButton(
                          child: Text('会員登録はこちら'),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 13),
                            primary: Colors.grey,
                          ),
                          onPressed: () {
                            // 画面遷移
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateUserView(),
                              ),
                            );
                          },
                        ),
                      ),

                      // テキストボタン'パスワードをお忘れの方はこちら'を配置
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextButton(
                          child: Text('パスワードをお忘れの方はこちら'),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 13),
                            primary: Colors.grey,
                          ),
                          onPressed: () {},
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
