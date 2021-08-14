import 'package:flutter/material.dart';

class TimeLineView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;
    // テキスト01
    final String text01 ='　ポーカーは、トランプを使って行うゲームのジャンルである。'
        '心理戦を特徴とするゲームである。プレイヤー達は5枚の札でハンドを作って役の強さを競う。 '
        'ギャンブルとしてプレイする場合は現金をチップに交換し、勝って獲得したチップが収入になる。'
        '自らプレイを行いチップを獲得する。';
    // テキスト02
    final String text02 = '　ポーカーは、ハンドの強さを競うゲームである。'
        '相手をフォールドさせれば（ゲームから降りさせれば）、'
        'ハンドの強さに関わらず勝つことが出来ることから、'
        'ブラフ（ハッタリ。ベットすることによって弱い手を強く見せて'
        '相手をフォールドさせようとすること）に代表される'
        '心理戦の占める割合の高いゲームであるとされる。';
    // テキスト03
    final String text03 = '　勝ち負けの数にはあまり意味が無く、勝ったときのチップを大きくし、負けたときの損失を最小にするための総合的な戦術がより重要である。';

    return Scaffold(
        backgroundColor: Colors.black54,

        appBar: AppBar(
          title: const Text('タイムライン',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[

                  // 投稿01
                  Column(
                      children: <Widget>[

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/profile.png")
                                      )
                                  ),
                                ),

                                Text('REONA'),
                              ],
                            )


                        ),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Image.asset('images/trump.png')
                        ),

                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(text01,
                            style: TextStyle(
                                fontSize: 15
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ]
                  ),



                  // 投稿02
                  Column(
                      children: <Widget>[

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/profile.png")
                                      )
                                  ),
                                ),

                                Text('REONA'),
                              ],
                            )


                        ),

                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(text02,
                            style: TextStyle(
                                fontSize: 15
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ]
                  ),


                  // 投稿03
                  Column(
                      children: <Widget>[

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage("images/profile.png")
                                      )
                                  ),
                                ),

                                Text('REONA'),
                              ],
                            )


                        ),

                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(text03,
                            style: TextStyle(
                                fontSize: 15
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ]
                  ),







                ]
            )

        )



    );
  }

}