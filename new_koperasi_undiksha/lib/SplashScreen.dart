import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:new_koperasi_undiksha/index.dart';
import 'package:new_koperasi_undiksha/pages/HomePage.dart';
import 'package:new_koperasi_undiksha/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  String? token = '';

  Future<void> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('token');
    if (data != null && data.isNotEmpty) {
      setState(() {
        token = data;
      });
    } else {
      // Token is empty or null, navigate to login page
       Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _getToken();
  }

  @override
 Widget build(BuildContext context) {
    print(token);
    return AnimatedSplashScreen(
      splash: Transform.scale(
        scale: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/logo.png",
              scale: 3.5,
            ),
            Text("KOPERASI UNDIKSHA",style: tebal.copyWith(fontSize: 8,color: Colors.white),)
          ],
        ),
      ),
      nextScreen:  token != null && token!.isNotEmpty
          ? MainPage()
          : LoginPage(), // Gantilah dengan halaman utama Anda
      splashTransition: SplashTransition.fadeTransition, // Animasi fade
      duration: 3000, // Durasi tampilan splash screen (dalam milidetik)
      backgroundColor: const Color.fromARGB(255, 10, 63, 143), // Warna latar belakang
    );
  }
}