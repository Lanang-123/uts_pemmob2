import 'dart:convert';
import 'package:http/http.dart' as http;

String uri = "https://ganeshpro.000webhostapp.com/api/gigs";

// Get Data
Future fetchData() async {
  var url = Uri.parse(uri);
  var response = await http.get(url);

  var data = json.decode(response.body);
  if (data.containsKey('data')) {
    List<dynamic> gigs = data['data'];
    return gigs.cast<Map<String, dynamic>>();
  } else {
    return [];
  }
}

// Tambah Data
// Future saveGigs() async {

// }

// Hapus Data
Future deleteGigs(id) async {
  var response = await http.get(Uri.parse(uri + '/delete/' + id.toString()));
  print(response.body);
  return json.decode(response.body);
}
