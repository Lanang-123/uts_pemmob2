import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoii/theme.dart';

class GigServices extends StatefulWidget {
  const GigServices({super.key});

  @override
  State<GigServices> createState() => _GigServicesState();
}

class _GigServicesState extends State<GigServices> {
  bool isChoose1 = false;
  bool isChoose2 = false;
  bool isChoose3 = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _waktu = [
    'Waktu Penyelesaian',
    '1 minggu',
    '1 bulan',
    'lebih dari 1 bulan'
  ];

  final List<String> _revisi = [
    'Batas Revisi',
    '1 minggu',
    '1 bulan',
    'lebih dari 1 bulan'
  ];

  late String _selectedWaktu;
  late String _selectedRevisi;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _selectedWaktu = _waktu[0];
    _selectedRevisi = _revisi[0];

    final apBar = AppBar(
      backgroundColor: ungu2,
      title: Text(
        'Buat Gig',
        style: semibold.copyWith(fontSize: 16),
      ),
    );

    double heighBody = height - apBar.preferredSize.height;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: apBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              width: width,
              height: heighBody * 0.15,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Package",
                style: bold.copyWith(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              width: width,
              height: heighBody * 0.79,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Stack(
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Paket",
                              style:
                                  semibold.copyWith(fontSize: 20, color: ungu2),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: regular.copyWith(
                                        fontSize: 13,
                                        color: Colors.grey.withOpacity(0.6)),
                                    children: const [
                                  TextSpan(
                                    text:
                                        'Silakan masukan nama yang sesuai dengan paket yang ingin anda buat!\n',
                                  ),
                                ])),
                            Flexible(
                              child: TextFormField(
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "Masukkan Nama Gig...",
                                    hintStyle: medium.copyWith(
                                        fontSize: 13, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: ungu1,
                                            width: 1))),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Deskripsi Paket",
                              style:
                                  semibold.copyWith(fontSize: 20, color: ungu2),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            RichText(
                                text: TextSpan(
                                    style: regular.copyWith(
                                        fontSize: 13,
                                        color: Colors.grey.withOpacity(0.6)),
                                    children: const [
                                  TextSpan(
                                    text:
                                        'Masukkan deskripsi untuk menjelaskan secara detail terkait paket gigi yang anda buat!',
                                  ),
                                ])),
                            const SizedBox(
                              height: 8,
                            ),
                            Flexible(
                              child: TextFormField(
                                maxLines: 8,
                                decoration: InputDecoration(
                                    hintText: "Masukkan Nama Gig...",
                                    hintStyle: medium.copyWith(
                                        fontSize: 13, color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: ungu1,
                                            width: 1))),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
        width: width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(2, 2))
        ]),
        child: Center(
          child: Column(
            children: [
              RichText(
                  text: TextSpan(
                      style: bold.copyWith(fontSize: 13, color: Colors.amber),
                      children: [
                    const TextSpan(
                      text: 'Note:',
                    ),
                    TextSpan(
                      text: "Pastikan data yang inputkan sudah benar",
                      style: bold.copyWith(
                          fontSize: 13, color: Colors.grey.withOpacity(0.6)),
                    )
                  ])),
              FilledButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(ungu1),
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Simpan & Lanjutkan",
                      style: bold.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
