import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yoii/components/list_sayembara.dart';
// import 'package:yoii/process/daftar_sayembara.dart';
import 'package:yoii/process/daftar_sayembara.dart';
import 'package:yoii/process/daftar_event.dart';
import 'package:yoii/theme.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Growt Together",
              style: bold.copyWith(fontSize: 18, color: ungu2),
            ),
            const SizedBox(
              height: 13,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DaftarSharing();
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: width,
                height: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [ungu1, ungu1.withOpacity(0.1)])),
                child: Text(
                  "Sharing GaneshPro",
                  style: bold.copyWith(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DaftarSayembara();
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: width,
                height: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [ungu1, ungu1.withOpacity(0.1)])),
                child: Text(
                  "Sayembara GaneshPro",
                  style: bold.copyWith(color: Colors.white, fontSize: 17),
                ),
                
              ),
              
            )
          ],
        ),
      ),
    );
  }
}
