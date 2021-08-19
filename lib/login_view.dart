import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        backgroundColor: Colors.blueGrey,

        /*
        // headerの設定
        appBar: AppBar(
          title: Text('ログイン', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
         */

        // bodyの設定
        body: Consumer<LoginModel>(
          builder: (context, model, child) {
            // Stack：子要素を重ねて描画できるwidget
            return Center(

                child: Container(
                  color: Colors.white,
                  //height: size.height * 0.6,
                  margin: EdgeInsets.fromLTRB(size.width*0.05,size.height*0.1, size.width*0.05,size.height*0.1),
                  padding: EdgeInsets.fromLTRB(size.width*0.1, 0, size.width*0.1, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0,size.height*0.04,0,size.height*0.02),
                          child: Text("ログイン",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                            ),),
                        ),

                        SizedBox(height: size.height*0.02,),

                        // メールアドレス入力
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

                        SizedBox(height: 30,),

                        // パスワード入力
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

                        /*
                        Container(
                          padding: EdgeInsets.fromLTRB(0,size.height*0.03,0,size.height*0.01),
                          // メッセージ表示
                          child: Text(model.infoText),
                        ),
                        */

                        SizedBox(height: size.height*0.03),


                        Container(
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
                                model.sampleMethod();
                                // メール/パスワードでログイン
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                await auth.signInWithEmailAndPassword(
                                  email: model.email,
                                  password: model.password,
                                );
                                // ログインに成功した場合
                                // チャット画面に遷移＋ログイン画面を破棄
                                await Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }),
                                );
                              } catch (e) {
                                // ログインに失敗した場合
                                final snackBar = SnackBar(
                                    content: Text(e.toString())
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                //model.infoText = "ログインに失敗しました：${e.toString()}";
                                //model.sampleMethod();

                              }
                            },
                          ),
                        ),

                        SizedBox(height: size.height*0.04),

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




class CreateUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel()..sampleMethod(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: Colors.blueGrey,

        /*
        // headerの設定
        appBar: AppBar(
          title: Text('会員登録', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
         */

        // bodyの設定
        body: Consumer<LoginModel>(
          builder: (context, model, child) {
            // Stack：子要素を重ねて描画できるwidget
            return Center(

                child: Container(
                  color: Colors.white,
                  //height: size.height * 0.6,
                  margin: EdgeInsets.fromLTRB(size.width*0.05,size.height*0.1, size.width*0.05,size.height*0.05),
                  padding: EdgeInsets.fromLTRB(size.width*0.1,0, size.width*0.1,0),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0,size.height*0.04,0,size.height*0.02),
                          child: Text("会員登録",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                            ),),
                        ),

                        SizedBox(height: size.height*0.01,),

                        // メールアドレス入力
                        Container(
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


                        SizedBox(height: 30,),

                        // パスワード入力
                        Container(
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


                        SizedBox(height: 30,),

                        // ニックネーム入力
                        Container(
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


                        SizedBox(height: 30,),

                        // パスワード入力
                        Container(
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


                        SizedBox(height: 30,),

                        // パスワード入力
                        Container(
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


                        /*
                        Container(
                          padding: EdgeInsets.fromLTRB(0,size.height*0.03,0,size.height*0.01),
                          // メッセージ表示
                          child: Text(model.infoText),
                        ),

                         */

                        Container(
                          margin: EdgeInsets.fromLTRB(0, size.height*0.02, 0, size.height*0.02),
                          //height: size.height*0.05,
                          width: double.infinity,
                          // ユーザー登録ボタン
                          child: TextButton(
                            child: Text('利用規約とプライバシーポリシーに同意して'),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 11),
                              primary: Colors.grey,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),


                        Container(
                          width: double.infinity,
                          height: size.height*0.05,
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
                                // メール/パスワードでユーザー登録
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                await auth.createUserWithEmailAndPassword(
                                  email: model.email,
                                  password: model.password,
                                );
                                // ユーザー登録に成功した場合
                                // チャット画面に遷移＋ログイン画面を破棄
                                await Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }),
                                );

                              } catch (e) {
                                // ユーザー登録に失敗した場合
                                final snackBar = SnackBar(
                                    content: Text(e.toString())
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(0, size.height*0.02, 0, 0),
                          //height: size.height*0.05,
                          // ユーザー登録ボタン
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