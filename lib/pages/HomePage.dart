import 'package:flutter/material.dart';
import 'package:yoii/components/banner.dart';
import 'package:yoii/data/category_home.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
            
           
            SizedBox(
              height: 10,
            ),
            Text(
              "Layanan Yang Kalian inginkan?",
              style: semibold.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 84,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: categorys.map((data) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(data['title']);
                            },
                            child: Container(
                              // margin: EdgeInsets.only(right: 10),
                              width: 53,
                              height: 53,
                              child: Image.asset(
                                data['img_path'],
                                width: 22,
                                height: 22,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 0.7,
                                    offset: const Offset(1, 4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['title'],
                            style: medium.copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Rekomendasi",
              style: semibold.copyWith(fontSize: 16),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Gigs Paling Populer",
              style: semibold.copyWith(fontSize: 16),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 133,
                    width: 197,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: temaWarna),
                  ),
                ],
              ),
            ),
          ])),
    ));
  }
}
