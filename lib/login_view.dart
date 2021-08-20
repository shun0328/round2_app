import 'package:flutter/material.dart';
import 'package:flutter_app/setting_model.dart';
import 'package:provider/provider.dart';
import 'create_user_view.dart';
import 'login_model.dart';
import 'main.dart';


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

            return Center(

                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(size.width*0.05,size.height*0.1, size.width*0.05,size.height*0.1),
                  padding: EdgeInsets.fromLTRB(size.width*0.1, 0, size.width*0.1, 0),

                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[

                        // テキスト'ログイン'の配置
                        Container(
                          margin: EdgeInsets.fromLTRB(0,size.height*0.04,0,size.height*0.04),
                          child: Text("ログイン",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                            ),),
                        ),


                        // メールアドレス入力フォームの配置
                        TextField(
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

                        SizedBox(height: size.height*0.03),

                        // パスワード入力フォームの配置
                        TextField(
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

                        // ログインボタンの配置
                        Container(
                          margin: EdgeInsets.fromLTRB(0,size.height*0.03,0,size.height*0.04),
                          width: double.infinity,
                          height: size.height*0.065,
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
                                // ログインに失敗した場合->エラーの表示
                                final snackBar = SnackBar(
                                    content: Text(e.toString())
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                          ),
                        ),

                        TextButton(
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

                        TextButton(
                            child: Text('パスワードをお忘れの方はこちら'),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 13),
                              primary: Colors.grey,
                            ),
                            onPressed: () {
                            },
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




