import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/profile_view.dart';
import 'package:flutter_app/setting_view.dart';

import 'event_view.dart';
import 'login_view.dart';
import 'time_line_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Round2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,

      // ログイン済だとホームページにそうでなければログイン画面に遷移
      home: (() {
        if (FirebaseAuth.instance.currentUser == null) {
          return LoginView();
        } else {
          print(FirebaseAuth.instance.currentUser!.email! + "でログイン");
          return HomePage();
        }
      })(),
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
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35.0),
            label: 'イベント',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 35.0),
            label: 'プロフィール',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, size: 35.0),
            label: 'タイムライン',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 35.0),
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
