import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yoii/data/bannerHome.dart';
import 'package:yoii/theme.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({super.key});

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                              Container(
                                width: width,
                                height: 141,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [ungu1, ungu1.withOpacity(0)])),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bh['title'],
                                          style: bold.copyWith(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          bh['subtitle'],
                                          style: regular.copyWith(
                                              fontSize: 15,
                                              color: Colors.white
                                                  .withOpacity(0.6)),
                                        )
                                      ],
                                    )),
                              )
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


// Container(
//                     width: width,
//                     height: 141,
//                     alignment: Alignment.topLeft,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(

//                             image: AssetImage(bh['img_path'], ),
//                             fit: BoxFit.cover),
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: LinearGradient(
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                             colors: [ungu1, ungu1.withOpacity(0)])),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           bh['title'],
//                           style:
//                               bold.copyWith(fontSize: 16, color: Colors.white),
//                         ),
//                         Text(
//                           bh['subtitle'],
//                           style: regular.copyWith(
//                               fontSize: 15,
//                               color: Colors.white.withOpacity(0.6)),
//                         )
//                       ],
//                     ),
//                   ),