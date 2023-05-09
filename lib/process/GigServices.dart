import 'package:flutter/material.dart';
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
        'OverView',
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
                "Package & Pricing",
                style: bold.copyWith(fontSize: 14, color: Colors.white),
              ),
            ),
            Container(
              width: width,
              height: heighBody * 1.4,
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
                              "Detail Paket",
                              style:
                                  semibold.copyWith(fontSize: 20, color: ungu2),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isChoose1 = true;
                                      isChoose2 = false;
                                      isChoose3 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 114,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      color: isChoose1 ? ungu1 : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Paket 1",
                                        style: semibold.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isChoose1 = false;
                                      isChoose2 = true;
                                      isChoose3 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 114,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      color: isChoose2 ? ungu1 : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Paket 2",
                                        style: semibold.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isChoose1 = false;
                                      isChoose2 = false;
                                      isChoose3 = true;
                                    });
                                  },
                                  child: Container(
                                    width: 114,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      color: isChoose3 ? ungu1 : Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Paket 3",
                                        style: semibold.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.solid,
                                                color: ungu1,
                                                width: 1))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        value: _selectedWaktu,
                                        items: _waktu.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: regular.copyWith(
                                                  fontSize: 8.5),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == 'Waktu Penyelesaian') {
                                              _selectedWaktu =
                                                  ""; // nonaktifkan pilihan "Pilih Kategori"
                                            } else {
                                              _selectedWaktu = value as String;
                                            }
                                            print(value);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 190,
                                    child: InputDecorator(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 12),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  style: BorderStyle.solid,
                                                  color: ungu1,
                                                  width: 1))),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField<String>(
                                          value: _selectedRevisi,
                                          items: _revisi.map((item) {
                                            return DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: regular.copyWith(
                                                    fontSize: 8.5),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              if (value ==
                                                  'Waktu Penyelesaian') {
                                                _selectedRevisi =
                                                    ""; // nonaktifkan pilihan "Pilih Kategori"
                                              } else {
                                                _selectedRevisi =
                                                    value as String;
                                              }
                                              print(value);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
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
