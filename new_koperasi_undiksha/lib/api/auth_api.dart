import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class AuthController {
   final dio = Dio();
   final baseUrl = "https://apikoperasiundiksha.000webhostapp.com/api/";

   Future<dynamic> register(String nama,String username, String password,String nim) async {
     Response response = await dio.post(
        '$baseUrl' + 'register',
        data: {
          'nama' : nama,
          'nim' : nim,
          'username': username,
          'password': password,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) { return status! < 500; },
          headers: {
            "Accept" : "application/json",
            },
        ),
      );

      print(response.data); // Tambahkan baris ini untuk melihat respons
      print(response.statusCode);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.data);
      }

  }

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await dio.post(
        '$baseUrl' + 'login',
        data: {
          'username': username,
          'password': password,
        },
      );

      print(response.data); // Tambahkan baris ini untuk melihat respons
      print(response.statusCode);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      print('Error: $error'); // Tambahkan baris ini untuk melihat error
      throw Exception('Failed to login: $error');
    }

  }
}