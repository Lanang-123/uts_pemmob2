import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:new_koperasi_undiksha/pages/Transfer/TransferPage.dart';
import 'package:new_koperasi_undiksha/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogged = false;
  final dio = Dio();
  String? nama;
  int? saldo;
  String?no_rek;
  String? imageProfile;

  String formatRupiah(int saldo) {
    if (saldo == null) {
        return '';
    }

    // Format angka ke dalam format Rupiah
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(saldo);
  }









  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<dynamic> fetchData() async {
    final token = await _getToken();
    if(token != null) {
      final url = "https://apikoperasiundiksha.000webhostapp.com/api/me";
      Response response = await dio.get(url,options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),);

      if (response.statusCode == 200) {
          final data = response.data;
          print(data);
          if(data != null) {
            setState(() {
              nama = data['nama'];
              saldo = data['saldo']['total'];
              no_rek = data['no_rekening'];
              
              if(data['image'] != '') {
                imageProfile = data['image'];
              }
            });
          }
      }else {
        print('Gagal mengambil data dari API');
      }
    }else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    }
  }

    @override
    void initState() {
      super.initState();
      fetchData(); // Panggil fetchData saat initState
    }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      backgroundColor: Colors.grey[100],
      
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 8, left: 8),
        child: Column(
          children: [
            Container(
              width:width,
              height: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 224, 222, 222),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50/2))
                        ),
                        // : Image.network("https://apikoperasiundiksha.000webhostapp.com/api/userImage/${imageProfile}"),
                        child: imageProfile == null ? Image.network("https://www.pngarts.com/files/10/Default-Profile-Picture-Transparent-Image.png") : Image.network("https://apikoperasiundiksha.000webhostapp.com/api/userImage/${imageProfile}")
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Selamat Datang",style: biasa.copyWith(fontSize: 11),),
                          Text(nama == null ? '': '$nama',style: sedang.copyWith(fontSize: 14),)
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.notifications_none_sharp,color: birutua,)
                ],
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Container(
              width: width,
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 0, 60, 255), Color.fromARGB(255, 14, 2, 143)], // Ubah warna sesuai keinginan
                ), 
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(saldo == null ? '' : formatRupiah(saldo!),style: sedang.copyWith(fontSize: 18,color: Colors.white),),
                      const SizedBox(width: 15,),
                      GestureDetector(
                        onTap: (){},
                        child: Icon(Icons.remove_red_eye,size: 18,color: Colors.white,)
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(no_rek == null ? '' : '$no_rek',style: sedang.copyWith(fontSize: 14,color: Colors.white),),
                      const SizedBox(width: 15,),
                      GestureDetector(
                        onTap: (){},
                        child: Icon(Icons.copy,size: 14,color: Colors.white,)
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Tanggal : ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                    style: sedang.copyWith(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(width: 15,),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 230,
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return TransferPage();
                            }));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 80,
                              height: 80,
                              child: Card(
                                color: const Color.fromARGB(255, 54, 193, 244),
                                elevation: 2,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                shadowColor: const Color.fromARGB(255, 54, 193, 244),
                                child: Center(
                                  child: Image.asset("assets/icons/transfer.png", scale: 1.5,),
                                ),
                              ),
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text("Transfer",style: sedang.copyWith(fontSize: 11),),
                          )
                      ],
                    ),
                    // Color.fromARGB(255, 98, 104, 255),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Color.fromARGB(255, 34, 40, 210),
                              elevation: 2,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              shadowColor: Color.fromARGB(255, 1, 6, 154),
                              child: Center(
                                child: Icon(Icons.attach_money_outlined,color: Colors.white,size: 40,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text("Deposit",style: sedang.copyWith(fontSize: 11),),
                          )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Color.fromARGB(255, 98, 104, 255),
                              elevation: 2,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              shadowColor: Color.fromARGB(255, 98, 104, 255),
                              child: Center(
                                child: Icon(Icons.add_card_sharp,color: Colors.white,size: 40,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text("Pembayaran",style: sedang.copyWith(fontSize: 11),),
                          )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 80,
                            height: 80,
                            child: Card(
                              color: Color.fromARGB(255, 255, 135, 70),
                              elevation: 2,
                              shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)
                              ),
                              shadowColor: Color.fromARGB(255, 255, 135, 70),
                              child: Center(
                                child: Icon(Icons.money,color: Colors.white,size: 40,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text("Tarik Tunai",style: sedang.copyWith(fontSize: 11),),
                          )
                      ],
                    ),
                     
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 Row(
                    children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 80,
                              height: 80,
                              child: Card(
                                color: Color.fromARGB(255, 4, 143, 57),
                                elevation: 2,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                shadowColor: Color.fromARGB(255, 4, 176, 70),
                                child: Center(
                                  child: Icon(Icons.shopify_rounded,color: Colors.white,size: 40,),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text("Pinjaman",style: sedang.copyWith(fontSize: 11),),
                            )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 80,
                              height: 80,
                              child: Card(
                                color: Color.fromARGB(255, 244, 212, 7),
                                elevation: 2,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                shadowColor: Color.fromARGB(255, 243, 239, 7),
                                child: Center(
                                  child: Icon(Icons.bar_chart_rounded,color: Colors.white,size: 40,),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text("Mutasi",style: sedang.copyWith(fontSize: 11),),
                            )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 80,
                              height: 80,
                              child: Card(
                                color: Color.fromARGB(255, 213, 213, 208),
                                elevation: 2,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                shadowColor: Color.fromARGB(255, 245, 243, 230),
                                child: Center(
                                  child: Icon(Icons.dialpad_outlined,color: Colors.white,size: 40,),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text("Lainnya",style: sedang.copyWith(fontSize: 11),),
                            )
                        ],
                      ),
                     
                    ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Catatan Keungan",style: tebal.copyWith(fontSize: 16, color: birutua, fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){}, child: Text("Lihat Detail",style: biasa.copyWith(fontSize: 16,color: birutua),))
                ],
              ),
            ),
            
            SizedBox(
              height: 190,
              width: width,
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Container(
                            height: 100,
                             decoration: BoxDecoration(
                              border: Border(
                              
                                bottom: BorderSide(
                                  color: const Color.fromARGB(255, 223, 219, 219),
                                  width: 2
                                )
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/arrow-down.png"),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text("Pemasukan", style: tebal.copyWith(fontSize: 18, color: Colors.grey[400]),)
                                  ],
                                ),
                                Text("Rp10.000.000", style: sedang.copyWith(fontSize: 18, color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: const Color.fromARGB(255, 223, 219, 219),
                                  width: 2
                                ),
                                bottom: BorderSide(
                                  color: const Color.fromARGB(255, 223, 219, 219),
                                  width: 2
                                )
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/arrow-up.png"),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text("Pengeluaran", style: tebal.copyWith(fontSize: 18, color: Colors.grey[400]),)
                                  ],
                                ),
                                Text("Rp5.000.000", style: sedang.copyWith(fontSize: 18, color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Selisih",
                            style: tebal.copyWith(fontSize: 18, color: Colors.grey[400]),
                            children: [
                              TextSpan(
                                text: "  -Rp5.000.000",
                                style: tebal.copyWith(fontSize: 20, color: Colors.red)
                              )
                            ]
                          )
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
