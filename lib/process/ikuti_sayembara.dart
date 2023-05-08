import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/theme.dart';

class IkutiSayembara extends StatefulWidget {
  const IkutiSayembara({super.key});

  @override
  State<IkutiSayembara> createState() => _IkutiSayembaraState();
}

class _IkutiSayembaraState extends State<IkutiSayembara> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: AppBar(
        backgroundColor: ungu2,
        shadowColor: Colors.transparent,
        title: Text(
          'Detail Sayembara',
          style: semibold.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            width: width,
            height: height * 0.25 - 120,
            alignment: Alignment.bottomCenter,
            child: Text(
              "Uploud Karya",
              style: bold.copyWith(fontSize: 18, color: Colors.white),
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
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uploud Preview",
                        style: semibold.copyWith(color: ungu2, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width,
                        height: 143,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ungu1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/nav_plus_new.png",
                                scale: 1,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Tambah File",
                                style: semibold.copyWith(fontSize: 14),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Uploud Full Karya",
                        style: semibold.copyWith(color: ungu2, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: width,
                        height: 143,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ungu1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/nav_plus_new.png",
                                scale: 1,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Tambah File",
                                style: semibold.copyWith(fontSize: 14),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Deskripsi",
                        style: semibold.copyWith(color: ungu2, fontSize: 16),
                      ),
                      Container(
                        width: width,
                        height: 143,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ungu1,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Jelaskan Karya anda",
                            hintStyle: regular.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Row(
                        children: [
                          Text(
                            "Note: ",
                            style: semibold.copyWith(
                                color: Color.fromARGB(255, 255, 196, 0)),
                          ),
                          Text(
                            "Pastikan data yang anda inputkan sudah benar",
                            style: regular.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      Container(
                        width: width,
                        height: 57,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ungu1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Ajukan Karya",
                            style: bold.copyWith(
                              color: Colors.white,
                              fontSize: 17,
                            )),
                      )
                    ]),
              )),
        ]),
      ),
    );
  }
}
