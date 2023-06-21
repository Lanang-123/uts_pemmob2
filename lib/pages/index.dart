import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yoii/pages/GigsPage.dart';
import 'package:yoii/pages/HomePage.dart';
import 'package:yoii/pages/ProfilePage.dart';
import 'package:yoii/pages/SearchPage.dart';
import 'package:yoii/pages/event_page.dart';
import 'package:yoii/theme.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  int selectedPage = 0;
  List<Widget> pages = [];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currenIndex = 0;

  List<Widget> _pageOptions = [
    HomePage(),
    SearchPage(),
    GigsPage(),
    EventPage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_pageOptions.elementAt(currenIndex)],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 64,
        child: CustomNavigationBar(
          isFloating: true,
          borderRadius: const Radius.circular(40),
          selectedColor: Colors.white,
          unSelectedColor: Colors.white.withOpacity(0.4),
          backgroundColor: ungu2,
          strokeColor: Colors.transparent,
          scaleFactor: 0.1,
          iconSize: 37,
          items: [
            CustomNavigationBarItem(
                icon: currenIndex == 0
                    ? Image.asset('assets/icons/nav_home_new.png')
                    : Image.asset('assets/icons/nav_home_unselected_new.png')),
            CustomNavigationBarItem(
                icon: currenIndex == 1
                    ? Image.asset('assets/icons/nav_search.png')
                    : Image.asset('assets/icons/nav_search_unselected.png')),
            CustomNavigationBarItem(
                icon: currenIndex == 2
                    ? Image.asset(
                        'assets/icons/nav_plus_new.png',
                      )
                    : Image.asset(
                        'assets/icons/nav_plus_new.png',
                      )),
            CustomNavigationBarItem(
                icon: currenIndex == 3
                    ? Image.asset('assets/icons/nav_event.png')
                    : Image.asset('assets/icons/nav_event_unselected.png')),
            CustomNavigationBarItem(
                icon: currenIndex == 4
                    ? Image.asset('assets/icons/nav_profile.png')
                    : Image.asset('assets/icons/nav_profile_unselected.png')),
          ],
          currentIndex: currenIndex,
          onTap: (index) {
            setState(() {
              currenIndex = index;
            });
          },
        ),
      ),
    );
  }
}
