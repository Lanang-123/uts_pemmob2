import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yoii/theme.dart';

class ListNotifikasi extends StatefulWidget {
  const ListNotifikasi({super.key});

  @override
  State<ListNotifikasi> createState() => _ListNotifikasiState();
}

class _ListNotifikasiState extends State<ListNotifikasi> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final apBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: ungu2,
      title: Text(
        'Notifikasi',
        style: medium.copyWith(fontSize: 25, color: Colors.white),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terbaru',
                style: medium.copyWith(fontSize: 25, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 341,
                height: 190,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ungu1,
                      width: 2.5,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(29 / 2)),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Hai Wiardana Ganteng!',
                          style: semibold.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 43),
                      child: Text(
                        'Terimakasih sudah melakukan pemesanan jasa. Kami harap anda puas dengan aplikasi ini dan jangan lupa untuk melakukan repeat order pada aplikasi ini',
                        style:
                            regular.copyWith(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 341,
                height: 190,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ungu1,
                      width: 2.5,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(29 / 2)),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Hai Wiardana Ganteng!',
                          style: semibold.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 43),
                      child: Text(
                        'Terimakasih sudah melakukan pemesanan jasa. Kami harap anda puas dengan aplikasi ini dan jangan lupa untuk melakukan repeat order pada aplikasi ini',
                        style:
                            regular.copyWith(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Sebelumnya',
                style: medium.copyWith(fontSize: 25, color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 341,
                height: 190,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ungu1,
                      width: 2.5,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(29 / 2)),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Hai Wiardana Ganteng!',
                          style: semibold.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 43),
                      child: Text(
                        'Terimakasih sudah melakukan pemesanan jasa. Kami harap anda puas dengan aplikasi ini dan jangan lupa untuk melakukan repeat order pada aplikasi ini',
                        style:
                            regular.copyWith(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                width: 341,
                height: 190,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: ungu1,
                      width: 2.5,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              color: ungu1,
                              borderRadius: BorderRadius.circular(29 / 2)),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          'Hai Wiardana Ganteng!',
                          style: semibold.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 43),
                      child: Text(
                        'Terimakasih sudah melakukan pemesanan jasa. Kami harap anda puas dengan aplikasi ini dan jangan lupa untuk melakukan repeat order pada aplikasi ini',
                        style:
                            regular.copyWith(fontSize: 15, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
