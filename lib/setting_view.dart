import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<SettingModel>(
      create: (_) => SettingModel(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: const Text(
            '設定',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),

        // bodyの設定
        body: Consumer<SettingModel>(
          builder: (context, model, child) {
            return Column(
              children: <Widget>[
                // サイズ調整
                SizedBox(height: size.height * 0.05),

                // プロフィール設定
                SizedBox(
                  width: size.width,
                  height: size.height * 0.07,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                        width: size.width,
                        height: size.height * 0.7,
                        child: ElevatedButton(
                          child: const Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        left: size.width * 0.2,
                        child: Text(
                          'プロフィール',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      //左のアイコン
                      Positioned(
                        left: 10,
                        child: Icon(Icons.account_circle_rounded, size: 35.0),
                      ),
                      //右のアイコン
                      Positioned(
                        right: 10,
                        child: Icon(Icons.arrow_forward_ios, size: 20.0),
                      ),
                    ],
                  ),
                ),

                // サイズ調整
                SizedBox(height: size.height * 0.001),

                // 通知設定
                SizedBox(
                  width: size.width,
                  height: size.height * 0.07,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                        width: size.width,
                        height: size.height * 0.7,
                        child: ElevatedButton(
                          child: const Text(''),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 20),
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        left: size.width * 0.2,
                        child: Text(
                          '通知',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      //左のアイコン
                      Positioned(
                        left: 10,
                        child: Icon(Icons.volume_up, size: 35.0),
                      ),
                      //右のアイコン
                      Positioned(
                        right: 10,
                        child: Icon(Icons.arrow_forward_ios, size: 20.0),
                      ),
                    ],
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
