import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,

        appBar: AppBar(
          title: const Text('プロフィール',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: Center(
            child: Column(
                children: [

                  // 調整
                  SizedBox(height: 50),

                  Stack(
                      children: <Widget>[
                        SizedBox(
                            width: 360,
                            child: Image.asset('images/bronze.png')
                        ),

                        Column(
                          children: [
                            // 調整
                            SizedBox(height: 20),

                            Text(
                              '　ID：'+'asdfghjkl',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                            // 高さ調整
                            SizedBox(height: 10),

                            Text(
                              'Kaito',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black,
                              ),
                            ),

                            // 高さ調整
                            SizedBox(height: 30),

                            Text(
                              '6000'+' rt',
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),

                          ],
                        ),
                      ]
                  ),





                ]
            )
        )

    );
  }

}