import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yoii/api/Gigs.dart';
import 'package:yoii/models/gigs.dart';
import 'package:yoii/pages/GigsPage.dart';
import 'package:yoii/pages/index.dart';
import 'package:yoii/process/GigDetail.dart';
import 'package:yoii/process/GigProcess.dart';
import 'package:yoii/theme.dart';

class GigsCard extends StatefulWidget {
  final Gigs dataC;
  const GigsCard({super.key, required this.dataC});

  @override
  State<GigsCard> createState() => _GigsCardState();
}

class _GigsCardState extends State<GigsCard> {
  String formatPrice(int price) {
    double convertedPrice = price / 1;

    String formattedPrice = NumberFormat.compact().format(convertedPrice);

    return formattedPrice;
  }

  final GigsController _gigsController = GigsController();


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Gigs data = widget.dataC;
    var imagePath = data.image;
    var kPrice = formatPrice(data.price);




    return Container(
        constraints: BoxConstraints(maxWidth: width),
        child: Stack(
          children: [
            Card(
              shadowColor: Colors.purple[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        "https://apigapro.000webhostapp.com/api/gigs/$imagePath",
                        width: width,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: regular.copyWith(fontSize: 12),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                                "${kPrice}",
                                style:
                                    bold.copyWith(fontSize: 18, color: ungu1),
                              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                   context: context,
                                   builder: (context) {
                                     return Container(
                                       height: 100,
                                       child: AlertDialog(
                                         shape: RoundedRectangleBorder(
                                             borderRadius:
                                                 BorderRadius.circular(
                                                     20)),
                                         title: Padding(
                                           padding:
                                               const EdgeInsets.all(8.0),
                                           child: Column(
                                             children: [
                                               Text(
                                                 'Anda Yakin Ingin menghapus gig ini?',
                                                 textAlign:
                                                     TextAlign.center,
                                                 style: bold.copyWith(
                                                     fontSize: 14,
                                                     color: ungu2),
                                               ),
                                               Row(
                                                 mainAxisAlignment:
                                                     MainAxisAlignment
                                                         .spaceEvenly,
                                                 children: [
                                    ElevatedButton(
                                 onPressed: () {
                                   _gigsController
                                       .deleteGigs(
                                           data.id)
                                       .then(
                                           (value) {
                                     if (value[
                                             "success"] ==
                                         true) {
                                       Navigator.of(
                                               context)
                                           .push(MaterialPageRoute(
                                               builder: (context) =>
                                                   MainPage(page: 2)));
                                     }
                                                       });
                                                     },
                                                     style:
                                                         ElevatedButton
                                                             .styleFrom(
                                                       primary:
                                                           ungu2, // Mengubah warna latar belakang tombol
                                                       onPrimary: Colors
                                                           .white, // Mengubah warna teks pada tombol
                                                     ),
                                                     child:
                                                         Text("Yakin"),
                                                   ),
                                                   ElevatedButton(
                                                     onPressed: () {
                                                       Navigator.of(
                                                               context)
                                                           .pop();
                                                     },
                                                     style:
                                                         ElevatedButton
                                                             .styleFrom(
                                                       primary:
                                                           ungu2, // Mengubah warna latar belakang tombol
                                                       onPrimary: Colors
                                                           .white, // Mengubah warna teks pada tombol
                                                     ),
                                                     child:
                                                         Text("Tidak"),
                                                   ),
                                                 ],
                                               )
                                             ],
                                           ),
                                         ),
                                       ),
                                     );
                                   });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  )),
                              ),
                              IconButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return OverViewGig(idGigs: data.id,pageUpdate: true,);
                                }));
                              }, icon: const Icon(Icons.edit,color: Colors.grey,))
                             
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30 / 2),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(2, 2),
                            spreadRadius: 2,
                            blurRadius: 3)
                      ]),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 100,
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)),
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Tingkatkan Usaha Anda',
                                      textAlign: TextAlign.center,
                                      style: bold.copyWith(
                                          fontSize: 18, color: ungu2),
                                    ),
                                  ),
                                  content: SizedBox(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            "Bagikan Gig kamu untuk mendapatkan pelanggan lebih banyak dengan pembeli yang berpotensial untuk mendapatkan kepercayaan lebih",
                                            style: regular.copyWith(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/facebookDialog.png",
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'FaceBook',
                                                      style:
                                                          semibold.copyWith(
                                                              fontSize: 7),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/icons/wadialog.png",
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'WhatsApp',
                                                      style:
                                                          semibold.copyWith(
                                                              fontSize: 7),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              child: SizedBox(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration:
                                                          BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50 /
                                                                              2),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.6),
                                                                    blurRadius:
                                                                        1,
                                                                    spreadRadius:
                                                                        1,
                                                                    offset:
                                                                        const Offset(
                                                                            2,
                                                                            2))
                                                              ],
                                                              color: Colors
                                                                  .white),
                                                      child: Center(
                                                        child: Image.asset(
                                                          "assets/icons/linkDialog.png",
                                                          width: 50,
                                                          height: 50,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Copy Link',
                                                      style:
                                                          semibold.copyWith(
                                                              fontSize: 7),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                ),
                              );
                            });
                      },
                      child: Image.asset(
                        "assets/icons/share.png",
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ),
                  
                )),
           
          ],
        ));
  }
}
