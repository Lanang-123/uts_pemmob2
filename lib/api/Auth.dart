import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthController {
  final String baseUrl = "https://apigapro.000webhostapp.com/api/";


  Future register(String name, String email, String password,var nim, String alamat,String no_hp) async {
    var url = Uri.parse(baseUrl + 'register');
      var response = await http.post(
        url,
        body: {
          'name' : name,
          'email' : email,
          'password' : password,
          'nim' : nim,
          'alamat' : alamat,
          'no_hp' : no_hp
        },
      );

      var rsp = json.decode(response.body);
     
      if (response.statusCode == 200) {
        // Permintaan berhasil, lakukan operasi setelah login sukse
       
        return rsp;
      } else {
        return rsp;
      }
    }


    Future login(String email, String password) async {
      var url = Uri.parse(baseUrl + 'login');
        var response = await http.post(
          url,
          body: {
            'email': email,
            'password': password,
          },
        );
        var rsp = json.decode(response.body);
        if (response.statusCode == 200) {
          // Permintaan berhasil, lakukan operasi setelah login sukses
        
        
          print(rsp);
          return rsp;
        } else {
          // Permintaan gagal, tampilkan pesan kesalahan atau lakukan penanganan yang sesuai
        
          print(rsp);
          return rsp;
      }
  }

  }