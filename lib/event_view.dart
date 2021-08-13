import 'package:flutter/material.dart';

class EventView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,

        appBar: AppBar(
          title: const Text('イベント情報',
          style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: Center(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(
                width: 300,
                height: 50,
                child:ElevatedButton(
                  child: const Text('トーナメント'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: 300,
                height: 50,
                child:ElevatedButton(
                  child: const Text('リングゲームの開催状況'),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),

              SizedBox(
                height: 70,
              ),

              Row(
                children: [
                  
                  Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          //color: Colors.black54,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(
                              'images/instagram.png',
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              // 押下時の処理を記述
                            },
                          ),
                        ),
                      ),
                  ),


                  Expanded(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          //color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(
                              'images/twitter.png',
                            ),
                            //fit: BoxFit.cover,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onTap: () {
                              // 押下時の処理を記述
                            },
                          ),
                        ),
                      ),
                  ),


                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        //color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'images/line.png',
                          ),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {
                            // 押下時の処理を記述
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

}