import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/pages/HomePage.dart';
import 'package:new_koperasi_undiksha/pages/ProfilePage.dart';
import 'package:new_koperasi_undiksha/pages/Scaner.dart';
import 'package:new_koperasi_undiksha/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: birutua,
        activeColor: Colors.white,
        style: TabStyle.reactCircle,
        items: [
          TabItem(
            icon: Icons.home,
            title: 'Home',
            fontFamily: 'Poppins',
          ),
          TabItem(
              activeIcon: Icon(Icons.qr_code,color: birutua,size: 40,),
              icon: Icon(Icons.qr_code,color: Colors.white,), title: 'Scan', fontFamily: 'Poppins'),
          TabItem(icon: Icons.person, title: 'Profile', fontFamily: 'Poppins'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => _onTabTapped(i),
      ),
    );
  }

  Widget _buildBody() {
    // Sesuaikan dengan logika untuk menentukan halaman yang akan ditampilkan sesuai dengan _currentIndex
    switch (_currentIndex) {
      case 0:
        return HomePage(); // Gantilah dengan halaman yang sesuai
      case 1:
        return Scanner(); // Gantilah dengan halaman yang sesuai
      case 2:
        return ProfilePage(); // Gantilah dengan halaman yang sesuai
      default:
        return HomePage(); // Atau tampilkan halaman default jika indeks tidak dikenali
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
