import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yoii/data/bannerHome.dart';

class BannerGig extends StatefulWidget {
  final Map<String, dynamic> images;
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
    print(data);

    return Stack(children: [
      InkWell(
        onTap: () {
          print(currentIndex);
        },
        child: CarouselSlider(
            items: bannerHome
                .map((bh) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                          width: width,
                          height: 141,
                          child: Stack(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                child: Image.asset(
                                  bh['img_path'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )),
                    ))
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.5,
                viewportFraction: 1,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
      ),
      Positioned(
        bottom: 10,
        left: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerHome.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: currentIndex == entry.key ? 17 : 7,
                height: 7.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == entry.key
                        ? Colors.white
                        : Colors.white.withOpacity(0.4)),
              ),
            );
          }).toList(),
        ),
      )
    ]);
  }
}
