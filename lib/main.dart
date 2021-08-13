import 'package:flutter/material.dart';
import 'package:flutter_app/profile_view.dart';
import 'package:flutter_app/setting_view.dart';
import 'timeline_view.dart';
import 'event_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    EventView(),
    ProfileView(),
    TimeLineView(),
    SettingView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      body: _pageList[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 35.0),
            label: 'イベント',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded,size: 35.0),
            label: 'プロフィール',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time,size: 35.0),
            label: 'タイムライン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 35.0),
            label: '設定',
          ),
        ],

        currentIndex: _selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
