import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yoii/components/BannerGig.dart';
import 'package:yoii/process/GigOrder.dart';
import 'package:yoii/theme.dart';

class GigDetail extends StatefulWidget {
  final Map<String, dynamic> dataId;
  const GigDetail({super.key, required this.dataId});

  @override
  State<GigDetail> createState() => _GigDetailState();
}

class _GigDetailState extends State<GigDetail> {
  bool isChoose1 = true;
  bool isChoose2 = false;
  bool isChoose3 = false;

  List<String> dataPaket = [
    'Mendapatkan 12 file foto Edited',
    'Color Grading dan Curve edting',
    'Include Retouching kulit',
    'Include Retouching background'
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
        'Detail Gig',
        style: semibold.copyWith(fontSize: 16, color: Colors.white),
      ),
      centerTitle: true,
    );

    double heighBody = height - apBar.preferredSize.height;
    final data = widget.dataId;
    return Scaffold(
      appBar: apBar,
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['desc'],
              style: bold.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(data['avatar']),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/rating.png",
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "${data['rating']}/5",
                          style: semibold.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    Text(data['profile_name'],
                        style: semibold.copyWith(
                            fontSize: 20, color: Colors.black))
                  ],
                ),
              ],
            ),
            BannerGig(
              images: data['gallery'],
            ),
            const SizedBox(
              height: 15,
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
            SizedBox(
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Text(
                              "Rp${data['price']}",
                              style: bold.copyWith(fontSize: 32),
                              textAlign: TextAlign.center,
                            ),
                            Positioned(
                              bottom: 0, // atur posisi bottom border
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 2,
                                color: ungu1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Yang Include dalam Paket',
                          style: semibold.copyWith(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.6)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/revisiGigs.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "1 Hari \n penyelesaian",
                                style: semibold.copyWith(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/icons/timeGigs.png",
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Revisi tidak \n terbatas",
                                style: semibold.copyWith(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 140,
                          child: ListView.builder(
                              itemCount: dataPaket.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  leading: Icon(
                                    Icons.check,
                                    color: ungu1,
                                    size: 25,
                                  ),
                                  title: Text(
                                    dataPaket[index],
                                    style: medium.copyWith(
                                        fontSize: 14,
                                        color: Colors.grey.withOpacity(0.5)),
                                  ),
                                );
                              }),
                              itemExtent: 30))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Detail Gig",
              style: semibold.copyWith(fontSize: 26),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Hai Selamat Datang di Gig Saya,Apakah Anda mencari layanan Foto Profesional yang dapat dikirimkan dalam waktu 24 jam atau kurang",
              style: regular.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Pengeditan Foto itu rumit, jadi silakan hubungi saya dengan deskripsi Anda tentang apa yang Anda inginkan. Wedding, Foto tema old, beauty atau yang lainnya yang dapat mendeskripsikan secara detail tema foto tersebut Dan semua jenis pengeditan Video dapat dilakukan",
              style: regular.copyWith(fontSize: 16),
            ),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        height: 150,
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
              FilledButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 8)),
                      backgroundColor: const MaterialStatePropertyAll(ungu1),
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const GigOrder();
                    }));
                  },
                  child: Center(
                    child: Text(
                      "Lanjutkan",
                      style: bold.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: width,
                child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        width: 2,
                        color: ungu1,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/chat.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Hubungi Penjual",
                        style: bold.copyWith(fontSize: 20, color: ungu2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
