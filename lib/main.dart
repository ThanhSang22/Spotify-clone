import 'package:flutter/material.dart';
import 'package:spotify_clone/page/Song_screen.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen1.dart';
import 'package:spotify_clone/page/Song_screen/Song_screen2.dart';
import 'package:spotify_clone/page/login_page.dart';

import 'package:spotify_clone/page/root_app.dart';
import 'package:spotify_clone/page/setting.dart';
import 'package:spotify_clone/page/user_page.dart';
import 'package:spotify_clone/page/register_email.dart';
import 'package:spotify_clone/page/register_pass.dart';
import 'package:spotify_clone/page/splashScreen.dart';
import 'package:spotify_clone/page/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        RegisterEmailScreen.routeName: (context) => RegisterEmailScreen(),
        RegisterPassScreen.routeName: (context) => RegisterPassScreen(),
        RootApp.routeName: (context) => RootApp(),
        SongScreen.routeName: (context) => SongScreen(),
        SongScreen2.routeName: (context) => SongScreen2(),
        SongScreen1.routeName: (context) => SongScreen1(),
        LoginPage.routeName: (context) => LoginPage(title: 'login'),
        UserPage.routeName: (context) => UserPage(),
        SongScreen1.routeName: (context) => SongScreen1(),
        SittingScreen.routeName: (context) => SittingScreen(),
      },
    );
  }
}
