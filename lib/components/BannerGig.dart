import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yoii/data/bannerHome.dart';
import 'package:yoii/theme.dart';

class BannerGig extends StatefulWidget {
  final List<String> images;
  const BannerGig({super.key, required this.images});

  @override
  State<BannerGig> createState() => _BannerGigState();
}

class _BannerGigState extends State<BannerGig> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final data = widget.images;

    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 250,
      child: Stack(children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
              items: data
                  .map((bh) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                            width: width,
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Image.asset(
                                bh,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
        ),
        Positioned(
          top: 200,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? ungu1
                          : Colors.grey.withOpacity(0.4)),
                ),
              );
            }).toList(),
          ),
        )
      ]),
    );
  }
}
