import 'package:flutter/foundation.dart';

class Gigs {
  Gigs({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
  });
  final int id;
  String title;
  String images;
  final int price;

  factory Gigs.fromJson(Map<String, dynamic> json) => Gigs(
      id: json["id"],
      title: json["title"],
      images: json["images"],
      price: json["price"]);
}
