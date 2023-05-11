import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/process/end_uploud_sayembara.dart';
import 'package:yoii/theme.dart';

class BuatSayembara extends StatefulWidget {
  const BuatSayembara({super.key});

  @override
  State<BuatSayembara> createState() => _BuatSayembaraState();
}

class _BuatSayembaraState extends State<BuatSayembara> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ungu2,
      appBar: AppBar(
        backgroundColor: ungu2,
        shadowColor: Colors.transparent,
        title: Text(
          'Buat Sayembara',
          style: semibold.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              width: width,
              height: height * 0.25 - 120,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Uploud Sayembara",
                style: bold.copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
            Container(
                width: width,
                height: height + 150,
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
                          "Judul Sayembara",
                          style: semibold.copyWith(color: ungu2, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width,
                          height: 55,
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
                              hintText: "Berikan Judul Kegiatan anda",
                              hintStyle: regular.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Spesifikasi",
                          style: semibold.copyWith(color: ungu2, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check,
                              color: ungu1,
                              size: 20,
                              weight: 200,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Flexible(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText:
                                        "Tambahkan spesifikasi apa yang diinginkan",
                                    hintStyle: medium.copyWith(
                                        fontSize: 13, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: ungu1,
                                            width: 1))),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Tambah +",
                              style: semibold.copyWith(
                                  fontSize: 12, color: Colors.black),
                            )),
                        Text(
                          "Price",
                          style: semibold.copyWith(color: ungu2, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ungu1,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Rp. contoh: 400K",
                              hintStyle: regular.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Deadline",
                          style: semibold.copyWith(color: ungu2, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width,
                          height: 55,
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
                              hintText:
                                  "Berikan Tanggal Deadline (DD/MM/YYYY))",
                              hintStyle: regular.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tambahkan Referensi",
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
                              hintText: "Jelaskan detail sayembara anda",
                              hintStyle: regular.copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EndUploudSayembara()));
                          },
                          child: Container(
                            width: width,
                            height: 57,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Uploud Sayembara",
                                style: bold.copyWith(
                                  color: Colors.white,
                                  fontSize: 17,
                                )),
                          ),
                        )
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
