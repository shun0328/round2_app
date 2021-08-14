import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;
    // カードの中の文字の色
    final Color topColor = Colors.white;
    // カード以外の文字の色
    final Color bottomColor = Colors.white;

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

    return Scaffold(
        backgroundColor: Colors.black54,

        appBar: AppBar(
          title: const Text('プロフィール',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: Stack(
            children: <Widget>[

              // カードの配置
              Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.05,
                  width: size.width * 0.8,
                  child: Image.asset('images/bronze.png')
              ),

              // IDの配置（カード内）
              Positioned(
                  left: size.width * 0.15,
                  top: size.height * 0.065,
                  child: Text(
                    'ID：'+ id,
                    style: TextStyle(
                      fontSize: 20,
                      color: topColor,
                    ),
                  )
              ),

              // 名前の配置（カード内）
              Positioned(
                  left: size.width * 0.15,
                  top: size.height * 0.12,
                  child: Text(name,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: topColor,
                    ),
                  )
              ),

              // レートの配置（カード内）
              Positioned(
                  left: size.width * 0.15,
                  top: size.height * 0.21,
                  child: Text(
                    rating.toString()+ ' rt',
                    style: TextStyle(
                      fontSize: 20,
                      color: topColor,
                    ),
                  )
              ),

              // プロフィール画像の配置（カード内）
              Positioned(
                right: size.width * 0.15,
                top: size.height * 0.07,
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/profile.png")
                      )
                  ),
                ),
              ),

              // IDの配置
              Positioned(
                  left: size.width * 0.1,
                  bottom: size.height * 0.38,
                  child: Text(
                    'ID',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),
              Positioned(
                  left: size.width * 0.47,
                  bottom: size.height * 0.38,
                  child: Text(
                    id,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),

              // 名前の配置
              Positioned(
                  left: size.width * 0.1,
                  bottom: size.height * 0.317,
                  child: Text(
                    '名前',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),
              Positioned(
                  left: size.width * 0.47,
                  bottom: size.height * 0.317,
                  child: Text(
                    name,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),

              // 来店回数の配置
              Positioned(
                  left: size.width * 0.1,
                  bottom: size.height * 0.255,
                  child: Text(
                    '来店回数',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),
              Positioned(
                  left: size.width * 0.47,
                  bottom: size.height * 0.255,
                  child: Text(
                    visit_time.toString() +' 回',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),

              // ポイントの配置
              Positioned(
                  left: size.width * 0.1,
                  bottom: size.height * 0.193,
                  child: Text(
                    'ポイント',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),
              Positioned(
                  left: size.width * 0.47,
                  bottom: size.height * 0.193,
                  child: Text(
                    point.toString() +' points',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),

              // チップの配置
              Positioned(
                  left: size.width * 0.1,
                  bottom: size.height * 0.13,
                  child: Text(
                    'チップ',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),
              Positioned(
                  left: size.width * 0.47,
                  bottom: size.height * 0.13,
                  child: Text(
                    chip.toString(),
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: bottomColor,
                    ),
                  )
              ),

            ]
        ),

    );
  }

}