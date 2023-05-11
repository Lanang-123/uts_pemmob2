import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/theme.dart';

class EndIkutiSayembara extends StatefulWidget {
  const EndIkutiSayembara({super.key});

  @override
  State<EndIkutiSayembara> createState() => _EndIkutiSayembaraState();
}

class _EndIkutiSayembaraState extends State<EndIkutiSayembara> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [ungu2, ungu1])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Berhasil Uploud Karya",
                    style: bold.copyWith(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Terimakasih Telah Mengikuti Sayembara",
                    style: regular.copyWith(fontSize: 13, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: width / 2,
                      height: 37,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: ungu1,
                          ),
                          Text(
                            "Daftar Sayembara",
                            style: regular.copyWith(fontSize: 14, color: ungu1),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
