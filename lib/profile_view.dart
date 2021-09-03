import 'package:Round2/profile_model.dart';
import 'package:Round2/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;
    // カードの中の文字の色
    final Color topColor = Colors.white;
    // カード以外の文字の色
    final Color bottomColor = Colors.white;
    // カード以外の文字の大きさ
    final double bottomFontSize = size.height * 0.024;

    // providerパターンでModelを使用
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..fetchProfile(),
      child: Scaffold(
        // 画面の背景色を設定
        backgroundColor: backGroundColor,

        // headerの設定
        appBar: AppBar(
          title: Text('プロフィール', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),

        // bodyの設定
        body: Consumer<ProfileModel>(
          builder: (context, model, child) {
            // ローディング画面
            if (model.isDownloadCompleted() == false) {
              return Center(
                // グルグルするやつ
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            }

            // Stack：子要素を重ねて描画できるwidget
            return Stack(
              children: <Widget>[
                // カードの配置
                Positioned(
                  left: (size.width * 0.5) - (size.height * 0.24 * 0.83),
                  top: size.height * 0.09,
                  height: size.height * 0.24,
                  child: Image.asset('images/black.png'),
                ),

                // IDの配置（カード内）
                Positioned(
                  left: size.width * 0.15 +
                      (size.width * 0.40 - size.height * 0.1992),
                  top: size.height * 0.105,
                  child: Text(
                    'ID：' + model.id!,
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: topColor,
                    ),
                  ),
                ),

                // 名前の配置（カード内）
                Positioned(
                  left: size.width * 0.15 +
                      (size.width * 0.40 - size.height * 0.1992),
                  top: size.height * 0.17,
                  child: Text(
                    model.nickName!,
                    style: TextStyle(
                      fontSize: size.height * 0.043,
                      color: topColor,
                    ),
                  ),
                ),

                // レートの配置（カード内）
                Positioned(
                  left: size.width * 0.15 +
                      (size.width * 0.40 - size.height * 0.1992),
                  top: size.height * 0.27,
                  child: Text(
                    model.rating.toString() + ' rt',
                    style: TextStyle(
                      fontSize: size.height * 0.024,
                      color: topColor,
                    ),
                  ),
                ),

                // プロフィール画像の配置（カード内）
                Positioned(
                  right: size.width * 0.15 +
                      (size.width * 0.40 - size.height * 0.1992),
                  top: size.height * 0.11,
                  child: Container(
                    width: size.height * 0.08,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(model.imageURL!),
                      ),
                    ),
                  ),
                ),

                // プロフィール詳細
                Positioned(
                  right: (size.width * 0.5) - (size.height * 0.24 * 0.83),
                  top: size.height * 0.32,
                  child: TextButton(
                    child: Text('rtやポイントについて'),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      // rtやポイントについての説明を表示
                      showModalBottomSheet(
                        //モーダルの背景の色、透過
                        backgroundColor: Colors.transparent,
                        //スクロール可能にする
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.only(top: 64),
                            decoration: BoxDecoration(
                              //モーダル自体の色
                              color: Colors.white,
                              //角丸にする
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                              height: size.height * 0.9,
                              child: Text(model.sentence),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                // 'ID'の配置
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.45,
                  child: Text(
                    'ID',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // IDの配置
                Positioned(
                  left: size.width * 0.57,
                  top: size.height * 0.45,
                  child: Text(
                    model.id!,
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // '名前'の配置
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.50,
                  child: Text(
                    '名前',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // 名前の配置
                Positioned(
                  left: size.width * 0.57,
                  top: size.height * 0.506,
                  child: Text(
                    model.nickName!,
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // '来店回数'の配置
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.55,
                  child: Text(
                    '来店回数',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // 来店回数の配置
                Positioned(
                  left: size.width * 0.57,
                  top: size.height * 0.55,
                  child: Text(
                    model.visitTime!.toString() + ' 回',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // 'ポイント'の配置
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.60,
                  child: Text(
                    'ポイント',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // ポイントの配置
                Positioned(
                  left: size.width * 0.57,
                  top: size.height * 0.606,
                  child: Text(
                    model.point.toString() + ' points',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // チップの配置
                Positioned(
                  left: size.width * 0.2,
                  top: size.height * 0.65,
                  child: Text(
                    'チップ',
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
                  ),
                ),

                // チップの配置
                Positioned(
                  left: size.width * 0.57,
                  top: size.height * 0.656,
                  child: Text(
                    model.chip.toString(),
                    style: TextStyle(
                      fontSize: bottomFontSize,
                      color: bottomColor,
                    ),
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
