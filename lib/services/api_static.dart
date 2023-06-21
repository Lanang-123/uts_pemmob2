import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:yoii/models/gigs.dart';

class ApiStatic {
  static Future<List<Gigs>> getGigs() async {
    try {
      final response = await http
          .get(Uri.parse("https://ganeshpro.000webhostapp.com/api/gigs"));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Gigs>((json) => Gigs.fromJson(json)).toList();
      } else {
        return [];
      }
      //
    } catch (e) {
      return [];
    }
  }
}
