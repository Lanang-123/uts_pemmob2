import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  int selectedPage = 0;
  List<Widget> pages = [];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [],
    );
  }
}
