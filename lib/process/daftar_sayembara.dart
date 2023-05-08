import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/components/list_sayembara.dart';
import 'package:yoii/theme.dart';

class DaftarSayembara extends StatefulWidget {
  const DaftarSayembara({super.key});

  @override
  State<DaftarSayembara> createState() => _DaftarSayembaraState();
}

class _DaftarSayembaraState extends State<DaftarSayembara> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
   

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ungu2),
                        child: Text(
                          "Info Tawaran",
                          style: regular.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: ungu2),
                        child: Text(
                          "Buat Tawaran +",
                          style: regular.copyWith(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Daftar Sayembara",
                style: bold.copyWith(fontSize: 20, color: ungu1),
              ),
              const ListSayembara(),
            ],
          ),
        ),
      ),
    );
  }
}
