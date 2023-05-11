import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/data/data_detail_sayembara.dart';
import 'package:yoii/data/sayembara_data.dart';
import 'package:yoii/process/ikuti_sayembara.dart';
import 'package:yoii/theme.dart';

class DetailSayembara extends StatefulWidget {
  final Map<String, dynamic> datas;
  const DetailSayembara({super.key, required this.datas});

  @override
  State<DetailSayembara> createState() => DetailSayembaraState();
}

class DetailSayembaraState extends State<DetailSayembara> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final dataId = widget.datas;
    final dataSpek = widget.datas['spesification'];
    final dataContoh = widget.datas['contoh'];
    print(dataId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: ungu1,
                        ),
                        padding: EdgeInsets.only(right: 26),
                      ),
                      Text("Detail Sayembara",
                          style: medium.copyWith(color: ungu1, fontSize: 16))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                    backgroundImage: AssetImage(dataId['img_path']),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                    dataId['name'],
                        style: medium.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                dataId["title"],
                    style: bold.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Spesifikasi",
                    style: semibold.copyWith(color: ungu2, fontSize: 15),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          ...dataSpek.map((data) {
                            return Row(
                              children: [
                                Image.asset("assets/icons/checklist.png"),
                                Padding(
                                  padding: EdgeInsets.only(top: 21, left: 8),
                                ),
                                Text(
                                  data,
                                  style: medium.copyWith(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Contoh",
                    style: semibold.copyWith(color: ungu2, fontSize: 15),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...dataContoh.map((data) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            height: 132,
                            child: Stack(
                              children: [
                                Image.asset(
                                  data,
                                  width: 200,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: height,
                                  child: Image.asset(
                                    "assets/icons/play.png",
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 132,
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ungu1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(top: 7)),
                          Image.asset("assets/icons/dollar.png"),
                          Text(
                        dataId['price'] + "K",
                            style: bold.copyWith(color: ungu1, fontSize: 19),
                          )
                        ]),
                      ),
                      Container(
                        width: 132,
                        height: 65,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ungu1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.only(top: 7)),
                          Image.asset("assets/icons/deadline.png"),
                          Text(
                        dataId['deadline'],
                            style: bold.copyWith(color: ungu1, fontSize: 16),
                          )
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Deskripsi",
                    style: semibold.copyWith(color: ungu2, fontSize: 15),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                dataId['desc'],
                    style: medium.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width / 2.5,
                          height: 48,
                          decoration: BoxDecoration(
                            color: ungu2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("Kirim Pesan",
                              style: semibold.copyWith(
                                  color: Colors.white, fontSize: 16)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const IkutiSayembara();
                            }));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width / 2.5,
                            height: 48,
                            decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Ikuti Sayembara",
                                style: semibold.copyWith(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
          )),
    ));
  }
}
