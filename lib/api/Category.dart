import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:yoii/models/category.dart';

String uri = "https://apigapro.000webhostapp.com/api/gigs";

class CategoryController {
  final String baseUrl = "https://apigapro.000webhostapp.com/api/category";

  Future<List<Category>> getCategory() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)["data"];
      return jsonData
          .map((json) => Category.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
  
  Future<void> createGigs(String title, String desc, String price, String imagePath) async {
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields['title'] = title;
    request.fields['desc'] = desc;
    request.fields['price'] = price;
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    print(responseData);
  }


  Future deleteCategory(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/delete/$id'));
    var res = json.decode(response.body);
    print(res);
    return res;
  }
}
