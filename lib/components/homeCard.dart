import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yoii/models/gigs.dart';
import 'package:yoii/process/GigDetail.dart';
import 'package:yoii/theme.dart';

class HomeCard extends StatefulWidget {
  final Gigs dataC;
  const HomeCard({super.key, required this.dataC});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  String formatPrice(int price) {
    double convertedPrice = price / 1;

    String formattedPrice = NumberFormat.compact().format(convertedPrice);

    return formattedPrice;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final data = widget.dataC;
    return Container(
      width: 200,
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
                child: Image.network(
                  "https://apigapro.000webhostapp.com/api/gigs/${data.image}",
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
                  data.title,
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
                        "4/5",
                        style: semibold.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  Text(
                    formatPrice(data.price),
                    style: bold.copyWith(fontSize: 18, color: ungu1),
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
