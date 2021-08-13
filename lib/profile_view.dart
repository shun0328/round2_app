import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール',
            style: TextStyle(color: Colors.black45),),
          backgroundColor: Colors.white,
        ),

        body: Center(
          child: Container(
            height: double.infinity,
            color: Colors.lightBlueAccent,
          ),
        )

    );
  }

}