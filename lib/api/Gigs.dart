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

  Future deleteGigs(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/delete/$id'));
    var res = json.decode(response.body);
    print(res);
    return res;
  }
}

