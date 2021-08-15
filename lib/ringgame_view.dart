import 'package:flutter/material.dart';

class RingGameView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 画面のサイズを取得
    final Size size = MediaQuery.of(context).size;

    final table_name = 'A';
    final time = '19:30';
    final num_member = 6;

    final table_name02 = 'B';
    final time02 = '17:00';
    final num_member02 = 8;



    return Scaffold(
        backgroundColor: Colors.blueGrey,

        appBar: AppBar(
          title: const Text('リングゲーム', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),

        body:SingleChildScrollView(
            child: Column(
                children: <Widget>[

                  // リングゲームA
                  Column(
                      children: <Widget>[

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                            child: Text('Table：'+table_name)
                        ),

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                            child: Row(
                              children: [
                                Icon(Icons.account_circle,size: 30.0),

                                SizedBox(width: 20,),

                                Text(num_member.toString()+' / 9名'),

                                SizedBox(width: 20,),

                                Text(time + ' 開始'),
                              ],
                            )
                        ),

                      ]
                  ),


                  // リングゲームB
                  Column(
                      children: <Widget>[

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            padding: EdgeInsets.fromLTRB(40, 10, 0, 14),
                            child: Text('Table：'+table_name02)
                        ),

                        Container(
                            width: size.width,
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            padding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                            child: Row(
                              children: [
                                Icon(Icons.account_circle,size: 30.0),

                                SizedBox(width: 20,),

                                Text(num_member02.toString()+' / 9名'),

                                SizedBox(width: 20,),

                                Text(time02 + ' 開始'),
                              ],
                            )
                        ),

                      ]
                  ),


                ]
            )

        )

    );
  }

}