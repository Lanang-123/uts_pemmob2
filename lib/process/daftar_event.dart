import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/data/data_daftar_even.dart';
import 'package:yoii/process/buat_event.dart';
import 'package:yoii/process/detail_event.dart';
import 'package:yoii/theme.dart';

class DaftarSharing extends StatefulWidget {
  const DaftarSharing({super.key});

  @override
  State<DaftarSharing> createState() => _DaftarSHaringState();
}

class _DaftarSHaringState extends State<DaftarSharing> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BuatEvent();
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7), color: ungu2),
                    child: Text(
                      "Buat Event +",
                      style:
                          semibold.copyWith(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Daftar Event",
              style: bold.copyWith(fontSize: 20, color: ungu1),
            ),
            SizedBox(
              height: 7,
            ),
            Column(
              children: daftarEvent.map((data) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DetailEvent(datas: data);
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 5),
                    width: width,
                    height: 112,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [ungu1, ungu2])),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(5)),
                        Container(
                            width: width / 3,
                            child: Image.asset(data['img_path'])),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(4)),
                            Text(
                              data["title"],
                              style: semibold.copyWith(
                                  color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              data["date"],
                              style: regular.copyWith(
                                  color: Colors.white, fontSize: 13),
                            ),
                            Text(
                              data["time"],
                              style: regular.copyWith(
                                  color: Colors.white, fontSize: 13),
                            ),
                            Text(
                              data["place"],
                              style: regular.copyWith(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          ]),
        ),
      ),
    );
  }
}
