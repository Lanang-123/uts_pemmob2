import 'package:flutter/material.dart';
import 'package:yoii/components/gigsCard.dart';
import 'package:yoii/data/bannerHome.dart';
import 'package:yoii/data/dataCard.dart';
import 'package:yoii/pages/HomePage.dart';
import 'package:yoii/pages/index.dart';
import 'package:yoii/theme.dart';

class GigsPage extends StatefulWidget {
  const GigsPage({super.key});

  @override
  State<GigsPage> createState() => _GigsPageState();
}

class _GigsPageState extends State<GigsPage> {
  String url_img =
      "https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.intipesan.com%2Fwp-content%2Fuploads%2F2018%2F06%2Flima.perbedaan.amatir.profesional.intipesan.jpg&tbnid=nElcmM_LOcQ33M&vet=12ahUKEwiRjb-Mid7-AhWR6XMBHTr5D2YQMygLegUIARDSAQ..i&imgrefurl=https%3A%2F%2Fwww.intipesan.com%2Flima-perbedaan-antara-profesional-dan-amatir%2F&docid=4eL5pdDDzWAE5M&w=800&h=533&q=profesional&ved=2ahUKEwiRjb-Mid7-AhWR6XMBHTr5D2YQMygLegUIARDSAQ";

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop + 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/icons/calendar.png',
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Image.asset(
                    'assets/icons/notif.png',
                    width: 22,
                    height: 22,
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
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: height,
                child: GridView.builder(
                  itemCount: dCards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) {
                    final data = dCards[index];
                    final id = dCards[index]['id'];
                    return GestureDetector(
                      onTap: () {
                        return print("Sasra - ${data['id']}");
                      },
                      child: Card(
                        shadowColor: Colors.purple[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                data['img_path'],
                                width: width,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data['desc'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: width,
                              alignment: Alignment.centerRight,
                              child: Text(data['price']),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
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