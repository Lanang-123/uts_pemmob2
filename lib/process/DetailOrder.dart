import 'package:flutter/material.dart';
import 'package:yoii/theme.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({super.key});

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  List<Map<String, dynamic>> contents = [
    {
      "judul": "Kategori",
      "isi": "Design",
      "isPurple": false,
    },
    {
      "judul": "Jenis",
      "isi": "Design Poster",
      "isPurple": false,
    },
    {
      "judul": "Konten",
      "isi": "Malam Gelar Seni Dies Natalis Undiksha",
      "isPurple": false,
    },
    {
      "judul": "Batas",
      "isi": "26-02-2023|16.00",
      "isPurple": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final apBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 2,
      backgroundColor: ungu2,
      title: Text(
        'Detail Order',
        style: semibold.copyWith(fontSize: 16, color: Colors.white),
      ),
    );

    double heighBody = height - apBar.preferredSize.height;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: apBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: width,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ungu1, width: 3)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Detail Pemesanan',
                          style: medium.copyWith(
                              fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Kategori',
                                      style: semibold.copyWith(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 26,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      ': Design',
                                      style: semibold.copyWith(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Jenis',
                                  style: semibold.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(":",
                                    style: semibold.copyWith(
                                        fontSize: 15, color: Colors.white)),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'Design Poster',
                                  style: semibold.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Konten',
                                  style: semibold.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(":",
                                    style: semibold.copyWith(
                                        fontSize: 15, color: Colors.white)),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  'Malam Gelar Seni Undiksha',
                                  style: semibold.copyWith(
                                      fontSize: 15, color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Batas',
                                  style: semibold.copyWith(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(":",
                                    style: semibold.copyWith(
                                        fontSize: 15, color: Colors.white)),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '26-08-2023 | 16.00',
                                  style: semibold.copyWith(
                                      fontSize: 15,
                                      color: ungu1,
                                      decoration: TextDecoration.underline),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: FilledButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(ungu1)),
                                  onPressed: () {},
                                  child: Text('Detail',
                                      style: semibold.copyWith(
                                          fontSize: 15, color: Colors.white))),
                            )
                          ],
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
