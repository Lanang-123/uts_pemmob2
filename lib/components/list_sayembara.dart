import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/data/sayembara_data.dart';
import 'package:yoii/process/detail_sayembara.dart';
import 'package:yoii/theme.dart';

class ListSayembara extends StatefulWidget {
  const ListSayembara({super.key});

  @override
  State<ListSayembara> createState() => _ListSayembaraState();
}

class _ListSayembaraState extends State<ListSayembara> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: sayembara.map((data) {
          return Container(
            width: width,
            height: 197,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  width: width,
                  height: 157,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ungu2, ungu1])),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 90,
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(data['img_path']),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(data['name'], style: medium.copyWith(fontSize: 16)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Text(
                    data['title'],
                    style: bold.copyWith(color: Colors.white, fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Imbalan ",
                            style: regular.copyWith(color: Colors.white),
                          ),
                          Text(data['price'] + "K",
                              style: bold.copyWith(
                                  fontSize: 18, color: Colors.white)),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const DetailSayembara();
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 5, left: 7),
                          width: 115,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ungu2,
                          ),
                          
                          child: Text(
                            "Ajukan Tawaran",
                            style: medium.copyWith(
                                color: Colors.white, fontSize: 12),
                          ),
                          
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
    // return Stack(
    //     children: sayembara.map((data) {
    //   return SizedBox(
    //     width: width,
    //     height: 197,

    //     child: Container(
    //       height: 159,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           gradient: const LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.centerRight,
    //               colors: [ungu2, ungu1])),
    //     ),
    //     // child: CircleAvatar(
    //     //   backgroundImage: AssetImage(data['img_path']),
    //     //   radius: 25,
    //     // ),
    //   );
    // }).toList()

    //     // const CircleAvatar(
    //     //   backgroundImage: AssetImage('assets/images/profile.jpg'),
    //     //   radius: 25,
    //     // ),,
    //     );
  }
}
