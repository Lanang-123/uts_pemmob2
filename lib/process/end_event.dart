import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/theme.dart';

class EndEvent extends StatefulWidget {
  const EndEvent({super.key});

  @override
  State<EndEvent> createState() => _EndEventState();
}

class _EndEventState extends State<EndEvent> {
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
                    "Berhasil Uploud Event",
                    style: bold.copyWith(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    "Terimakasih Telah Menambahkan Event GaneshPro",
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
                            "Daftar Event",
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
