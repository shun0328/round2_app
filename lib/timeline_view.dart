import 'package:flutter/material.dart';

class TimeLineView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,

        appBar: AppBar(
          title: const Text('タイムライン',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),

        body: Center(
        )

    );
  }

}