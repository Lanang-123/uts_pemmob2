import 'package:flutter/material.dart';
import 'package:yoii/theme.dart';

class OverViewGig extends StatefulWidget {
  const OverViewGig({super.key});

  @override
  State<OverViewGig> createState() => _OverViewGigState();
}

class _OverViewGigState extends State<OverViewGig> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: AppBar(
        backgroundColor: ungu2,
        title: Text(
          'Etalase Gig',
          style: semibold.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              width: width,
              height: height * 0.25 - 120,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Overview",
                style: bold.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Stack(
                children: [
                  Column(),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        height: 70,
                        width: width,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(2, 2))
                        ]),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
