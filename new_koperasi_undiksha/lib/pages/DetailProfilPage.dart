import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_koperasi_undiksha/auth/LoginPage.dart';
import 'package:new_koperasi_undiksha/pages/ProfilePage.dart';
import 'package:new_koperasi_undiksha/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProfilPage extends StatefulWidget {
  const DetailProfilPage({super.key});

  @override
  State<DetailProfilPage> createState() => _DetailProfilPageState();
}

class _DetailProfilPageState extends State<DetailProfilPage> {
  final _formKey = GlobalKey<FormState>();
   final dio = Dio();
  TextEditingController _nimController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email = '', _password = '';

  
  late File? _getImage;
  String namaLengkap ='';
  String imageProfile = '';
  String no_rek='';

  bool _showPassword = false;

  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

   Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) { // Periksa jika gambar telah berhasil diambil
      setState(() {
        _getImage = File(pickedFile.path);
      });

      imageController.text = _getImage!.path;
    }
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
          if(data != null) {
            setState(() {
              namaLengkap = data['nama'];
              no_rek = data['no_rekening'];
              _nimController.text = data['nim'].toString();
              _emailController.text = data['email'];
              _namaController.text = data['nama'];

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
  

  Future<void> updateUser(
    String name,
    String email,
    String password,
    String nim,
    String imagePath,
  ) async {
    final token = await _getToken();
    final baseUrl = "https://apikoperasiundiksha.000webhostapp.com/api/";


    if (token != null) {
      final url = "$baseUrl" + "update-user";

      var formData = FormData.fromMap({
        'nama': name,
        'username': email,
        'password': password,
        'nim': nim,
      });

      if (imagePath.isNotEmpty) {
        var imageFile = await MultipartFile.fromFile(imagePath, filename: 'file');
        formData.files.add(MapEntry('file', imageFile));
      }

      try {
        var response = await dio.post(
          url,
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) { return status! < 500; },
            headers: {
              "Accept" : "application/json",
              'Authorization': 'Bearer $token',
              },
          ),
        );

        print(response.data);
        // Tambahkan logika lain sesuai kebutuhan, misalnya penanganan respons sukses atau gagal.
      } catch (error) {
        print('Error: $error');
        // Tambahkan logika penanganan kesalahan sesuai kebutuhan.
      }
    }
  }



  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: birutua,
        elevation: 0,
        title: Text("Kelola akun",style: sedang.copyWith(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 15),
            color: Colors.white,
            width: 350,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 350,
                  height: 150,
                  margin: const EdgeInsets.only(top: 1),
                  padding: EdgeInsets.only(right: 8, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:  imageProfile == null ? Image.asset("assets/images/avatar.jpeg",width: 100,height: 100,) : Image.network("https://apikoperasiundiksha.000webhostapp.com/api/userImage/${imageProfile}",width: 100, height: 100,),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context){
                                      return Container(
                                          height: 60.0,
                                          child: Column(
                                          children: [
                                          ListTile(
                                            leading: Icon(Icons.photo),
                                            title: Text('Gallery'),
                                            onTap: () {
                                                _pickImage(ImageSource.gallery);
                                                          Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30/2)
                                  ),
                                  child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: sedang.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: '$namaLengkap',
                                ),
                              ],
                            ),
                          ),
        
                          Text("No rek. $no_rek", style: sedang.copyWith(color: Colors.black, fontSize: 15),)
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: height * 0.5 + 250,
                  width: 350,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Visibility(
                          visible: false,
                            child: Container(
                              width: width,
                              height: 80,
                              margin: const EdgeInsets.only(top: 12),
                              child: TextFormField(
                                controller: imageController,
                                decoration: InputDecoration(labelText: 'Image URL'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter product image URL.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        Text(imageController.text.isNotEmpty ? 'Gambar sudah siap diupdate silahkan klik tombol simpan !' : '', style: sedang.copyWith(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text("NIM", style: sedang.copyWith(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 5,
                        ),
                        
                        TextFormField(
                          style: sedang,
                          controller: _nimController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Nama Lengkap", style: sedang.copyWith(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: sedang,
                          controller: _namaController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[300], 
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Email", style: sedang.copyWith(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: sedang,
                          controller: _emailController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Kata Sandi", style: sedang.copyWith(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: sedang,
                          obscureText: !_showPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan masukkan password akun terlebih dahulu';
                            }else if (value.length < 8) {
                              return 'Password minimal 8 karakter';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: togglePasswordVisibility,
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  )),
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 350,
                          height: 41,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(birutua),
                              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()) {
                                _formKey.currentState!.validate();

                                String nama = _namaController.text;
                                String username = _emailController.text;
                                String imagePath = imageController.text;
                                String password = _passwordController.text;
                                String nim = _nimController.text;

                                final data = {
                                  'nama' : nama,
                                  'email' : username,
                                  'image' : imagePath,
                                  'password' : password,
                                  'nim' : nim
                                };

                                await updateUser(nama, username, password, nim, imagePath).then((value) => 
                                    {
                                       ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text('Data berhasil diupdate'),
                                                duration: Duration(seconds: 2), // Durasi notifikasi
                                              ),
                                            ),

                                           Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailProfilPage(),
                                            ),
                                          )
                                    }
                                );


                              }
                            },
                            child: Text('SIMPAN', style: sedang.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}