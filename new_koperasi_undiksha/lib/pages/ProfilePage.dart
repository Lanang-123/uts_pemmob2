import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_koperasi_undiksha/pages/DetailProfilPage.dart';
import 'package:new_koperasi_undiksha/theme.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final dio = Dio();
  String? nama;
  String? email;
  String? image;


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
              email = data['email'];
              if(data['image'] != '') {
                image = data['image'];
              }
            });
          }
      }else {
        print('Gagal mengambil data dari API');
      }
    }
  }

  Future<dynamic> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await _getToken();
    if(token != null) {
      final url = "https://apikoperasiundiksha.000webhostapp.com/api/logout";
      Response response = await dio.get(url,options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),);

      if (response.statusCode == 200) {
          final data = response.data;
          print(data);

          prefs.remove('token');
        
      }else {
        print('Gagal mengambil data dari API');
      }
    }
  }

    @override
    void initState() {
      super.initState();
      fetchData(); // Panggil fetchData saat initState
    }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.25 + 100,
              width: width,
              padding: const EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                color: birutua,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(110/2))
                    ),
                    child: image == null ? Image.network("https://www.pngarts.com/files/10/Default-Profile-Picture-Transparent-Image.png") : Image.network("https://apikoperasiundiksha.000webhostapp.com/api/userImage/${image}",width: 100, height: 100,),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(nama == null ? '' : '$nama', style: sedang.copyWith(fontSize: 18, color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_outline, color: Colors.white, size: 15,),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(email == null ? '' : "$email", style: sedang.copyWith(fontSize: 15, color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("Setting",style: tebal.copyWith(fontSize: 19),),
                  ListTile(
                      leading: Icon(Icons.person_2_outlined,size: 25,color: birutua,),
                      title: Text(
                        'Kelola Akun',
                        style: sedang.copyWith(
                            fontSize: 15, color: Colors.black),
                      ),
                      trailing: IconButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DetailProfilPage();
                        }));
                      }, icon:  const Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.black,
                      ),)
                    ),
                 
                  Divider(
                    thickness: 2,
                    color: Colors.grey[250],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Help",style: tebal.copyWith(fontSize: 19),),
                  ListTile(
                    leading: Icon(Icons.question_answer_outlined,size: 25,color: birutua,),
                    title: Text(
                      'Pusat Bantuan',
                      style: sedang.copyWith(
                          fontSize: 15, color: Colors.black),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[250],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("About",style: tebal.copyWith(fontSize: 19),),
                  ListTile(
                    leading: Icon(Icons.book_online_outlined,size: 25,color: birutua,),
                    title: Text(
                      'Panduan Aplikasi',
                      style: sedang.copyWith(
                          fontSize: 15, color: Colors.black),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black,
                    ),
                  ),
                   ListTile(
                    leading: Icon(Icons.security,size: 25,color: birutua,),
                    title: Text(
                      'Syarat dan Ketentuan',
                      style: sedang.copyWith(
                          fontSize: 15, color: Colors.black),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: 140,
                      height: 35,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(birutua)
                        ),
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                              
                                title: Text('Keluar dari Akun ini ?',textAlign: TextAlign.center,style: sedang.copyWith(fontWeight: FontWeight.bold,color: Colors.black),),
                                backgroundColor: Colors.white,
                                actionsAlignment: MainAxisAlignment.spaceEvenly,
                                actions: [
                                  ElevatedButton(style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(birutua)
                                  ), onPressed: ()async{
                                    await logout();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Anda berhasil logout !'),
                                        duration: Duration(seconds: 2), // Durasi notifikasi
                                      ),
                                    );
                                     Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );
                                  }, child: Text("iya",style: sedang.copyWith(fontSize: 14),)),
                                  ElevatedButton(style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(birutua)
                                  ), onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: Text("tidak",style: sedang.copyWith(fontSize: 14),)),
                                ],
                              );
                            },
                          );
                          
                        }, 
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.logout,size: 15,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Keluar akun',
                              style:
                                  tebal.copyWith(fontSize: 12),
                            )
                          ],
                        )),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

//  Container(
//                 alignment: Alignment.topCenter,
//                 padding: const EdgeInsets.only(top: 50),
//                 width: width,
//                 height: height * 0.25 + 300,
//                 color: birutua,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text("Petugas", style: sedang.copyWith(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     CircleAvatar(
//                       radius: 45,
//                       backgroundImage: AssetImage("assets/images/user2.jpg"),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Text("Luh Debi Pramesty", style: sedang.copyWith(fontSize: 18, color: Colors.white),),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.mail_outline, color: Colors.white, size: 15,),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text("debipramesty@gmail.com", style: sedang.copyWith(fontSize: 15, color: Colors.white),),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.phone_outlined, color: Colors.white, size: 15,),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text("+62 82144915020", style: sedang.copyWith(fontSize: 15, color: Colors.white),),
//                       ],
//                     )
                    
//                   ],
//                 ),
//               ),