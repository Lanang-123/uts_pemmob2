import 'package:flutter/material.dart';
import 'package:yoii/data/recent_search.dart';
import 'package:yoii/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: ungu2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 350,
                        height: 44,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                            key: _formKey,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8),
                                  isCollapsed: true,
                                  prefixIcon: const Icon(Icons.search_outlined),
                                  hintText: "Cari Gigs",
                                  hintStyle: regular.copyWith(
                                      color: Colors.grey, fontSize: 12),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none)),
                            )))
                  ],
                ),
              ),
              Container(
                width: width,
                height: height * 0.5 + 400,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Column(
                      children: recentSearch.map(
                        (data) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      data['icons_time'],
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      data['title'],
                                      style:
                                          regular.copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Icon(data['icons_close'], color: Colors.grey)
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Icon(Icons.history, color: Colors.grey),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Text(
                    //           "Jasa editing Video",
                    //           style: regular.copyWith(color: Colors.grey),
                    //         ),
                    //       ],
                    //     ),
                    //     Icon(Icons.close_outlined, color: Colors.grey),
                    //   ],
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lihat Lebih banyak",
                          style: medium.copyWith(color: Colors.black),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
