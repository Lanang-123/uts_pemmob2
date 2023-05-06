import 'package:flutter/material.dart';
import 'package:yoii/data/bannerHome.dart';
import 'package:yoii/data/rekomHome.dart';
import 'package:yoii/theme.dart';

class RecomendedHome extends StatefulWidget {
  const RecomendedHome({super.key});

  @override
  State<RecomendedHome> createState() => _RecomendedHomeState();
}

class _RecomendedHomeState extends State<RecomendedHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: rekomsHome.map((data) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            height: 133,
            width: 197,
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      data["img_path"],
                      fit: BoxFit.cover,
                    )),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        ungu2.withOpacity(0),
                        ungu2.withOpacity(0.8)
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 140,
                        child: Text(
                          data['title'],
                          style:
                              bold.copyWith(color: Colors.white, fontSize: 8),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/rating.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${data["rate"]}/5",
                            style: regular.copyWith(
                                color: Colors.white, fontSize: 8),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
