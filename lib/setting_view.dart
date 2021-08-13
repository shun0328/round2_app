import 'package:flutter/material.dart';

class SettingView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('設定',
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