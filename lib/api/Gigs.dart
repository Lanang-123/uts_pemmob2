import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:yoii/models/gigs.dart';

String uri = "https://apigapro.000webhostapp.com/api/gigs";

class GigsController {
  final String baseUrl = "https://apigapro.000webhostapp.com/api/gigs";

  Future<List<Gigs>> getGigs() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData.map((json) => Gigs.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<Map<String, dynamic>> getDetail(int id) async {
    final response = await http.get(Uri.parse(baseUrl + '/detail/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData;
    } else {
      throw Exception('Failed to fetch products');
    }
  }



  Future createGigs(String title, String keywords, String waktu_penyelesaian, String batas_revisi,var price,String image,String description,var id_category) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields['title'] = title;
    request.fields['keywords'] = keywords;
    request.fields['waktu_penyelesaian'] = waktu_penyelesaian;
    request.fields['batas_revisi'] = batas_revisi;
    request.fields['price'] = price;
    request.fields['description'] = description;
    request.fields['id_category'] = id_category;
    request.files.add(await http.MultipartFile.fromPath('image', image));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    return responseData;
  }

  Future updateGigs(String id,String title, String keywords,String waktu_penyelesaian, String batas_revisi,var price,String image,String description,var id_category) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/$id'), // Ganti URL sesuai dengan endpoint update yang sesuai
    );

    final dataId = await getDetail(int.parse(id));

    if (dataId != null) {
      request.fields['title'] = title;
      request.fields['keywords'] = keywords;
      request.fields['waktu_penyelesaian'] = waktu_penyelesaian;
      request.fields['batas_revisi'] = batas_revisi;
      request.fields['price'] = price;
      request.fields['description'] = description;
      request.fields['id_category'] = id_category;

      if (image.isNotEmpty) {
        var imageFile = File(image);
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();

        var multipartFile = http.MultipartFile(
          'image',
          stream,
          length,
          filename: path.basename(imageFile.path),
        );

        request.files.add(multipartFile);
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print(responseData);
        print('Product updated successfully');
      } else {
        print('Failed to update product. Status code: ${response.statusCode}');
      }
    } else {
      print('Product not found');
    }
  }
  



  Future deleteGigs(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/delete/$id'));
    var res = json.decode(response.body);
    print(res);
    return res;
  }
}

