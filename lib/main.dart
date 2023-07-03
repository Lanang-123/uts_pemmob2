import 'package:flutter/material.dart';
import 'package:yoii/auth/LoginPage.dart';
import 'package:yoii/pages/HomePage.dart';
import 'package:yoii/pages/index.dart';
import 'package:yoii/process/buat_layanan.dart';
import 'package:yoii/process/buat_sayembara.dart';
import 'package:yoii/theme.dart';

void main() {
  runApp(const GaneshPro());
}

class GaneshPro extends StatelessWidget {
  const GaneshPro({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GaneshPro',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(
              // ignore: deprecated_member_use
              caption: regular.copyWith(fontSize: 11, color: Colors.red))),
      home: const LoginPage(),
    );
  }
}
