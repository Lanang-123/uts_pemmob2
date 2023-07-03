import 'package:flutter/foundation.dart';

class Gigs {
  Gigs({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
  final int id;
  String title;
  String image;
  final int price;

  factory Gigs.fromJson(Map<String, dynamic> json) => Gigs(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      price: json["price"]);
}
