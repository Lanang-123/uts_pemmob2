import 'package:flutter/material.dart';
import 'package:yoii/api/Category.dart';
import 'package:yoii/api/Gigs.dart';
import 'package:yoii/components/banner.dart';
import 'package:yoii/components/homeCard.dart';
import 'package:yoii/components/notifikasi.dart';
import 'package:yoii/components/rekomenHome.dart';
import 'package:yoii/data/category_home.dart';
import 'package:yoii/data/dataCard.dart';
import 'package:yoii/models/category.dart';
import 'package:yoii/models/gigs.dart';
import 'package:yoii/pages/event_page.dart';
import 'package:yoii/process/DetailOrder.dart';
import 'package:yoii/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GigsController _gigsController = GigsController();
  final CategoryController _categoryController = CategoryController();
  bool _isLoading = false;
  bool _isLoadingCtg = false;

  List<Gigs> _gigs = [];
  List<Category> _categorys = [];

  Future<void>fetchGigs() async {
    setState(() {
      _isLoading = true;
    });
    final gigs = await _gigsController.getGigs();
    setState(() {
      _gigs = gigs;
    _isLoading = false;
    });
  }

  Future<void>fetchCategory() async {
    setState(() {
      _isLoadingCtg = true;
    });
    final category = await _categoryController.getCategory();
    setState(() {
      _categorys = category;
      _isLoadingCtg = false;
    });
    
  }

  @override
  void initState() {
    super.initState();
    fetchGigs();
    fetchCategory();
  }


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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailOrder();
                        }));
                      },
                      child: Image.asset(
                        'assets/icons/order.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    GestureDetector(
                      onTap: () {
                        // aksi yang dijalankan ketika gambar di klik
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ListNotifikasi();
                        }));
                      },
                      child: Image.asset(
                        'assets/icons/notif.png',
                        width: 22,
                        height: 22,
                      ),
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
              width: double.infinity,
              child: _isLoading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categorys.length,
                itemBuilder: (BuildContext context,index) {
                  Category category = _categorys[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(category.id);
                          },
                          child: Container(
                            // margin: EdgeInsets.only(right: 10),
                            width: 53,
                            height: 53,
                            child: Image.network(
                              "https://apigapro.000webhostapp.com/api/category/${category.icons}",
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
                          category.name_category,
                          style: medium.copyWith(fontSize: 11),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }
              )
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Rekomendasi",
              style: semibold.copyWith(fontSize: 16),
            ),
            Container(
              width: double.infinity,
              height: 140,
              child: const RecomendedHome()
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Gigs Paling Populer",
              style: semibold.copyWith(fontSize: 16),
            ),
            Container(
            margin:
                const EdgeInsets.only(right: 10, bottom: 10),
            height: 220,
            width: double.infinity,
            child:_isLoading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context,index) {
                Gigs gigs = _gigs[index];
                return HomeCard(dataC: gigs);
              }
            )
            ),
          ])),
    ));
  }
}
