import 'package:flutter/material.dart';
import 'package:yoii/components/banner.dart';
import 'package:yoii/components/homeCard.dart';
import 'package:yoii/components/rekomenHome.dart';
import 'package:yoii/data/category_home.dart';
import 'package:yoii/data/dataCard.dart';
import 'package:yoii/pages/event_page.dart';
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
    double padddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(
              top: paddingTop + 20, left: 20, right: 20, bottom: 100),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
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
                      'assets/icons/order.png',
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
            const SizedBox(
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
                      margin: const EdgeInsets.only(right: 10),
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
                            style: medium.copyWith(fontSize: 11),
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
            const RecomendedHome(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: dCards.isEmpty
                    ? [const Center(child: Text('Data masih kosong'))]
                    : dCards
                        .map((data) {
                          return Container(
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            height: 220,
                            width: 197,
                            child: HomeCard(
                              dataC: data,
                            ),
                          );
                        })
                        .take(3)
                        .toList(),
              ),
            ),
          ])),
    ));
  }
}
