import 'package:flutter/material.dart';
import 'package:yoii/process/GigDetail.dart';
import 'package:yoii/theme.dart';

class HomeCard extends StatefulWidget {
  final Map<String, dynamic> dataC;
  const HomeCard({super.key, required this.dataC});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final data = widget.dataC;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return GigDetail(
            dataId: data,
          );
        }));
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: width),
        child: Stack(children: [
          Card(
            shadowColor: Colors.purple[800],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    data["img_path"],
                    width: width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data["desc"],
                    style: regular.copyWith(fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Container(
                width: width,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/rating.png",
                          width: 10,
                          height: 10,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${data['rating']}/5",
                          style: semibold.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                    Text(
                      data['price'],
                      style: bold.copyWith(fontSize: 18, color: ungu1),
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
