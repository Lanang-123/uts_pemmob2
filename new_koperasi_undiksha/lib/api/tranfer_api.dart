import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class TransferController {
   final dio = Dio();
   final baseUrl = "https://apikoperasiundiksha.000webhostapp.com/api/";


   Future<dynamic> fetchData(String no_rek) async {
   
    Response response = await dio.get(baseUrl + 'transfer/$no_rek',);

      if (response.statusCode == 200) {
          final data = response.data;
          print(data);
          
      }else {
        print('Gagal mengambil data dari API');
      }
  }
}