import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventModel extends ChangeNotifier {
  // Instagramに遷移するための関数
  launchInstagram() async {
    const url = "https://www.instagram.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  // Lineに遷移するための関数
  launchLine() async {
    const url = "https://line.me/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  // Twitterに遷移するための関数
  launchTwitter() async {
    const url = "https://twitter.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  // Facebookに遷移するための関数
  launchFacebook() async {
    const url = "https://www.facebook.com/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}
