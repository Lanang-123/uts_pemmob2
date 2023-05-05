import 'package:flutter/material.dart';
import 'package:yoii/components/banner.dart';
import 'package:yoii/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      Text(
                        'Hi, Lanang',
                        style: semibold.copyWith(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendar.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Image.asset(
                        'assets/icons/notif.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Image.asset(
                        'assets/icons/chat.png',
                        width: 22,
                        height: 22,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const BannerHome(),
            ],
          ),
        ),
      ),
    );
  }
}
