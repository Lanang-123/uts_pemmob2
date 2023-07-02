import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoii/process/GigServices.dart';
import 'package:yoii/theme.dart';

class OverViewGig extends StatefulWidget {
  const OverViewGig({super.key});

  @override
  State<OverViewGig> createState() => _OverViewGigState();
}

class _OverViewGigState extends State<OverViewGig> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _categorys = [
    'Plih Kategori',
    'Programming',
    'Animasi',
    'Design 3D'
  ];

  final List<String> _waktu = [
    'Waktu Penyelesaian',
    '1 minggu',
    '1 bulan',
    'lebih dari 1 bulan'
  ];

  final List<String> _revisi = [
    'Batas Revisi',
    '1 minggu',
    '1 bulan',
    'lebih dari 1 bulan'
  ];
  late String _selectedItem;
  late String _selectedWaktu;
  late String _selectedRevisi;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _selectedItem = _categorys[0];
    _selectedWaktu = _waktu[0];
    _selectedRevisi = _revisi[0];

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
                "Overview",
                style: bold.copyWith(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              width: width,
              height: heighBody * 2.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Judul Gig",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
                          ),
                          Text(
                            "Sebagai etalase Gig Anda, judul Anda adalah tempat paling penting untuk memasukkan kata kunci yang kemungkinan besar akan digunakan pembeli untuk mencari layanan seperti milik Anda.",
                            style: regular.copyWith(
                                fontSize: 13,
                                color: Colors.grey.withOpacity(0.6)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: ungu1,
                                        width: 1))),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Kategory",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
                          ),
                          Text(
                            "Pilih Kategori sesuai dengan layanan yang kamu tawarkan, demi memudahkan pelanggan dalam mencari keinginanya.",
                            style: regular.copyWith(
                                fontSize: 13,
                                color: Colors.grey.withOpacity(0.6)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputDecorator(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: ungu1,
                                        width: 1))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                value: _selectedItem,
                                items: _categorys.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == 'Pilih Kategori') {
                                      _selectedItem =
                                          ""; // nonaktifkan pilihan "Pilih Kategori"
                                    } else {
                                      _selectedItem = value as String;
                                    }
                                    print(value);
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Kata Kunci",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: regular.copyWith(
                                      fontSize: 13,
                                      color: Colors.grey.withOpacity(0.6)),
                                  children: [
                                const TextSpan(
                                  text:
                                      'Tag Gig Anda dengan kata-kata yang relevan dengan kesesuaian layanan yang Anda tawarkan. Gunakan semua tag untuk memaksimalkan pencarian. \n\n',
                                ),
                                TextSpan(
                                  text:
                                      'Masukkan istilah pencarian yang menurut Anda akan digunakan pembeli saat mencari layanan Anda.',
                                  style: regular.copyWith(
                                      fontSize: 13,
                                      color: Colors.grey.withOpacity(0.6)),
                                )
                              ])),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        style: BorderStyle.solid,
                                        color: ungu1,
                                        width: 1))),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Harga",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: regular.copyWith(
                                      fontSize: 13,
                                      color: Colors.grey.withOpacity(0.6)),
                                  children: const [
                                TextSpan(
                                  text:
                                      'Masukkan harga yang relevan untuk Gigs yang ingin anda buat!',
                                ),
                              ])),
                          const SizedBox(
                            height: 8,
                          ),
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              decoration: InputDecoration(
                                  prefixText: "Rp. ",
                                  prefixStyle: medium.copyWith(
                                      fontSize: 13, color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          style: BorderStyle.solid,
                                          color: ungu1,
                                          width: 1))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Durasi",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              style: BorderStyle.solid,
                                              color: ungu1,
                                              width: 1))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      value: _selectedWaktu,
                                      items: _waktu.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style:
                                                regular.copyWith(fontSize: 8.5),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          if (value == 'Waktu Penyelesaian') {
                                            _selectedWaktu =
                                                ""; // nonaktifkan pilihan "Pilih Kategori"
                                          } else {
                                            _selectedWaktu = value as String;
                                          }
                                          print(value);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                child: SizedBox(
                                  width: 190,
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.solid,
                                                color: ungu1,
                                                width: 1))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        value: _selectedRevisi,
                                        items: _revisi.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: regular.copyWith(
                                                  fontSize: 8.5),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == 'Waktu Penyelesaian') {
                                              _selectedRevisi =
                                                  ""; // nonaktifkan pilihan "Pilih Kategori"
                                            } else {
                                              _selectedRevisi = value as String;
                                            }
                                            print(value);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Pilih Gambar",
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
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
                            style:
                                semibold.copyWith(fontSize: 20, color: ungu2),
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
                  ),
                ],
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const GigServices();
                    }));
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
