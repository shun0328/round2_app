import 'package:Round2/edit_name_view.dart';
import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_image_view.dart';

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
                // ニックネームの変更
                Container(
                  width: size.width,
                  height: size.height * 0.07,
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.04, 0, 0),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 35.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'ニックネームの変更',
                          style: TextStyle(color: Colors.black),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () async {
                      // 画面遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNameView(),
                        ),
                      );
                    },
                  ),
                ),

                // プロフィール画像の変更
                Container(
                  width: size.width,
                  height: size.height * 0.07,
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.001, 0, 0),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          size: 35.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'プロフィール画像の変更',
                          style: TextStyle(color: Colors.black),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {
                      // 画面遷移
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditImageView(),
                        ),
                      );
                    },
                  ),
                ),

                // 通知設定
                Container(
                  width: size.width,
                  height: size.height * 0.07,
                  margin: EdgeInsets.fromLTRB(0, size.height * 0.001, 0, 0),
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.volume_up,
                          size: 35.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '通知設定',
                          style: TextStyle(color: Colors.black),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    onPressed: () {},
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
