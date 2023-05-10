import 'package:flutter/material.dart';
import 'package:yoii/components/BannerGig.dart';
import 'package:yoii/theme.dart';

class GigDetail extends StatefulWidget {
  final Map<String, dynamic> dataId;
  const GigDetail({super.key, required this.dataId});

  @override
  State<GigDetail> createState() => _GigDetailState();
}

class _GigDetailState extends State<GigDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final apBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 2,
      backgroundColor: Colors.white,
      title: Text(
        'Detail Gig',
        style: semibold.copyWith(fontSize: 22, color: Colors.black),
      ),
      centerTitle: true,
    );

    double heighBody = height - apBar.preferredSize.height;
    final data = widget.dataId;
    return Scaffold(
      appBar: apBar,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              data['desc'],
              style: bold.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(data['avatar']),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/rating.png",
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "${data['rating']}/5",
                          style: semibold.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(data['profile_name'],
                        style: semibold.copyWith(
                            fontSize: 20, color: Colors.black))
                  ],
                ),
              ],
            ),
            BannerGig(
              images: data['gallery'],
            ),
          ],
        ),
      )),
    );
  }
}
