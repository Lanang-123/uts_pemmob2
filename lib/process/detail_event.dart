import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/theme.dart';

class DetailEvent extends StatefulWidget {
  final Map<String, dynamic> datas;
  const DetailEvent({super.key, required this.datas});

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final dataId = widget.datas;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(children: [
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
                Text(
                  "Detail Event",
                  style: bold.copyWith(fontSize: 20, color: ungu1),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(14),
              width: width,
              height: height,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ungu2, ungu1])),
              child: Column(
                children: [
                  Text(
                    dataId['title'],
                    style: bold.copyWith(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    dataId["img_path"],
                    fit: BoxFit.cover,
                    width: width / 2,
                    height: height / 6,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Waktu Kegiatan : ",
                                  style: medium.copyWith(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  dataId['time'] + " Wita",
                                  style: bold.copyWith(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tanggal Kegiatan : ",
                                  style: medium.copyWith(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  dataId['date'],
                                  style: bold.copyWith(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Text(
                              "Tempat Kegiatan : ",
                              style: medium.copyWith(
                                  color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              dataId['place'],
                              style: bold.copyWith(
                                  color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Deskripsi",
                          style:
                              bold.copyWith(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          dataId['desc'],
                          style: medium.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 1.8,
                    height: 41,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: ungu2),
                    child: Text(
                      "Gabung Grup WhatsApp",
                      style: bold.copyWith(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
