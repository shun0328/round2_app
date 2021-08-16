import 'package:flutter/material.dart';
import 'package:flutter_app/profile_model.dart';
import 'package:flutter_app/tournament_view.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget{
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

    // ID
    final String id = 'asdfghjkl';
    // 名前
    final String name = 'REONA';
    // レート
    final int rating = 6000;
    // 来店回数
    final int visit_time = 6;
    // ポイント
    final point = 270;
    // チップ
    final chip = 15000;

    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel(),
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        
        appBar: AppBar(
          title: const Text('プロフィール',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),


        body: Consumer<ProfileModel>(builder: (context,model,child) {
          return Stack(
              children: <Widget>[

                // カードの配置
                Positioned(
                    left: (size.width*0.5)-(size.height*0.24*0.83),
                    top: size.height * 0.09,
                    //width: (size.width*0.5)-(size.height*0.24*0.83),
                    height: size.height*0.24,
                    child: FittedBox(
                      child: Image.asset('images/bronze.png'),
                      fit: BoxFit.fill,
                    )
                ),

                // IDの配置（カード内）
                Positioned(
                    left: size.width * 0.15 + (size.width*0.40-size.height*0.1992),
                    top: size.height * 0.105,
                    child: Text(
                      'ID：'+ id,
                      style: TextStyle(
                        fontSize: size.height * 0.024,
                        color: topColor,
                      ),
                    )
                ),

                // 名前の配置（カード内）
                Positioned(
                    left: size.width * 0.15+ (size.width*0.40-size.height*0.1992),
                    top: size.height * 0.17,
                    child: Text(name,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.043,
                        color: topColor,
                      ),
                    )
                ),

                // レートの配置（カード内）
                Positioned(
                    left: size.width * 0.15+ (size.width*0.40-size.height*0.1992),
                    top: size.height * 0.27,
                    child: Text(
                      rating.toString()+ ' rt',
                      style: TextStyle(
                        fontSize: size.height * 0.024,
                        color: topColor,
                      ),
                    )
                ),

                // プロフィール画像の配置（カード内）
                Positioned(
                  right: size.width * 0.15+ (size.width*0.40-size.height*0.1992),
                  top: size.height * 0.11,
                  child: Container(
                    width: size.width * 0.18,
                    height: size.width * 0.18,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/profile.png")
                        )
                    ),
                  ),
                ),

                // プロフィール詳細
                Positioned(
                  right: (size.width*0.5)-(size.height*0.24*0.83),
                  top: size.height * 0.32,
                  child: TextButton(
                    child: const Text('rtやポイントについて'),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 10),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        //モーダルの背景の色、透過
                          backgroundColor: Colors.transparent,
                          //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
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
                                  height: size.height*0.9,
                                  child: Text('レートの上がり方 \n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
                                      'ポイントの使い方 \n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
                                      'ポイントの使い方 \n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
                                      'ポイントの使い方 \n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n'
                                      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
                                  ),
                                ));
                          });
                    },
                  ),
                ),


                // IDの配置
                Positioned(
                    left: size.width * 0.2,
                    top: size.height * 0.45,
                    child: Text(
                      'ID',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),
                Positioned(
                    left: size.width * 0.57,
                    top: size.height * 0.45,
                    child: Text(
                      id,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),

                // 名前の配置
                Positioned(
                    left: size.width * 0.2,
                    top: size.height * 0.50,
                    child: Text(
                      '名前',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),
                Positioned(
                    left: size.width * 0.57,
                    top: size.height * 0.506,
                    child: Text(
                      name,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),

                // 来店回数の配置
                Positioned(
                    left: size.width * 0.2,
                    top: size.height * 0.55,
                    child: Text(
                      '来店回数',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),
                Positioned(
                    left: size.width * 0.57,
                    top: size.height * 0.55,
                    child: Text(
                      visit_time.toString() +' 回',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),

                // ポイントの配置
                Positioned(
                    left: size.width * 0.2,
                    top: size.height * 0.60,
                    child: Text(
                      'ポイント',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),
                Positioned(
                    left: size.width * 0.57,
                    top: size.height * 0.606,
                    child: Text(
                      point.toString() +' points',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),

                // チップの配置
                Positioned(
                    left: size.width * 0.2,
                    top: size.height * 0.65,
                    child: Text(
                      'チップ',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),
                Positioned(
                    left: size.width * 0.57,
                    top: size.height * 0.656,
                    child: Text(
                      chip.toString(),
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: bottomFontSize,
                        color: bottomColor,
                      ),
                    )
                ),

              ]
          );
        }),
      ),
    );

  }

}
