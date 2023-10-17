import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/SplashScreen.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:new_koperasi_undiksha/index.dart';
import 'package:new_koperasi_undiksha/pages/HomePage.dart';
import 'package:new_koperasi_undiksha/pages/ProfilePage.dart';
import 'package:new_koperasi_undiksha/pages/Scaner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/": (_) => MySplashScreen(),
        "/home": (BuildContext context) => HomePage(),
        "/scan": (BuildContext context) => Scanner(),
        "/profile": (BuildContext context) => ProfilePage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Koperasi Undiksha',
    );
  }
}
