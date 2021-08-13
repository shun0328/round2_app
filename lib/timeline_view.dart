import 'package:flutter/material.dart';

class TimeLineView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('タイムライン',
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