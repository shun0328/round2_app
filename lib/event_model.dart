import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventModel extends ChangeNotifier {
  // メンバ変数
  String sample = "sample";

  launchInstagram() async {
    const url = "https://www.instagram.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  launchLine() async {
    const url = "https://line.me/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  launchTwitter() async {
    const url = "https://twitter.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  launchFacebook() async {
    const url = "https://www.facebook.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
