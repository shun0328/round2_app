import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,

        appBar: AppBar(
          title: const Text('プロフィール',
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),


    );
  }

}