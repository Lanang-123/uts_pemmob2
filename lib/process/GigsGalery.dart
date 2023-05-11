import 'package:flutter/material.dart';
import 'package:yoii/theme.dart';

class GigsGallery extends StatefulWidget {
  const GigsGallery({super.key});

  @override
  State<GigsGallery> createState() => _GigsGalleryState();
}

class _GigsGalleryState extends State<GigsGallery> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final apBar = AppBar(
      backgroundColor: ungu2,
      title: Text(
        'Buat Gig',
        style: semibold.copyWith(fontSize: 16),
      ),
    );

    double heighBody = height - apBar.preferredSize.height;

    return Scaffold(
      backgroundColor: ungu2,
      appBar: apBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              width: width,
              height: heighBody * 0.15,
              alignment: Alignment.bottomCenter,
              child: Text(
                "Gallery & Posting",
                style: bold.copyWith(fontSize: 20, color: Colors.white),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                width: width,
                padding: const EdgeInsets.all(15),
                height: heighBody,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Gambar",
                      style: semibold.copyWith(fontSize: 14, color: ungu2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 222,
                      width: 358,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ungu2, width: 2),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/nav_plus_new.png",
                              scale: 1,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Tambah Gambar",
                              style: semibold.copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Detail Gambar Gig",
                      style: semibold.copyWith(fontSize: 14, color: ungu2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: TextFormField(
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText: "Tambahkan Detail Gig...",
                            hintStyle: medium.copyWith(
                                fontSize: 13, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: ungu1,
                                    width: 1))),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        height: 100,
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
              RichText(
                  text: TextSpan(
                      style: bold.copyWith(fontSize: 13, color: Colors.amber),
                      children: [
                    const TextSpan(
                      text: 'Note:',
                    ),
                    TextSpan(
                      text: "Pastikan data yang inputkan sudah benar",
                      style: bold.copyWith(
                          fontSize: 13, color: Colors.grey.withOpacity(0.6)),
                    )
                  ])),
              FilledButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(ungu1),
                      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return const GigsGallery();
                    // }));
                  },
                  child: Center(
                    child: Text(
                      "Simpan & Lanjutkan",
                      style: bold.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
