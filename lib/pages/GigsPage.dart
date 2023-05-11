import 'package:flutter/material.dart';
import 'package:yoii/components/gigsCard.dart';
import 'package:yoii/components/notifikasi.dart';
import 'package:yoii/data/dataCard.dart';
import 'package:yoii/process/GigProcess.dart';
import 'package:yoii/theme.dart';

class GigsPage extends StatefulWidget {
  const GigsPage({super.key});

  @override
  State<GigsPage> createState() => _GigsPageState();
}

class _GigsPageState extends State<GigsPage> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          style: bold.copyWith(fontSize: 25, color: ungu2),
                          children: [
                        const TextSpan(
                          text: 'Gigs',
                        ),
                        TextSpan(
                          text: " Anda!",
                          style: bold.copyWith(fontSize: 25, color: ungu1),
                        )
                      ])),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/calendar.png',
                        width: 22,
                        height: 22,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          // aksi yang dijalankan ketika gambar di klik
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ListNotifikasi();
                          }));
                        },
                        child: Image.asset(
                          'assets/icons/notif.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Image.asset(
                        'assets/icons/chat.png',
                        width: 22,
                        height: 22,
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                height: height * 0.75 + 70,
                child: GridView.builder(
                  itemCount: dCards.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) {
                    if (index == dCards.length) {
                      // Widget kosong setelah data habis
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const OverViewGig();
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: ungu1,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/nav_plus_new.png",
                                scale: 1,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Buat Gig Baru",
                                style: semibold.copyWith(fontSize: 12),
                              )
                            ],
                          )),
                        ),
                      );
                    } else {
                      final data = dCards[index];
                      return GigsCard(dataC: data);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  TextButton.icon(
//                       onPressed: () {
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return MainPage();
//                         }));
//                       },
//                       icon: Icon(Icons.arrow_back_outlined),
//                       label: Text(
//                         'Beranda',
//                         style: semibold.copyWith(color: ungu1, fontSize: 13),
//                       )),