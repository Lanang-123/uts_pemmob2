class Category {
  final int id;
  final String name_category;
  final String icons;

  Category({
    required this.id,
    required this.name_category,
    required this.icons,
  });

  factory Category.fromJson(Map<String,dynamic>json) {
    return Category(id: json['id'], name_category: json['name_category'], icons: json['icons']);
  }
}