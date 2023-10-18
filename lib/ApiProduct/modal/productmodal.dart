// To parse this JSON data, do
//
//     final productmodal = productmodalFromJson(jsonString);

import 'dart:convert';

List<Productmodal> productmodalFromJson(String str) => List<Productmodal>.from(json.decode(str).map((x) => Productmodal.fromJson(x)));

String productmodalToJson(List<Productmodal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productmodal {
  int id;
  String title;
  int price;
  String description;
  String images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  Productmodal({
   required this.id,
   required this.title,
   required this.price,
   required this.description,
   required this.images,
   required this.creationAt,
   required this.updatedAt,
   required this.category,
  });

  factory Productmodal.fromJson(Map<String, dynamic> json) => Productmodal(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: json["images"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": images,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "category": category.toJson(),
  };
}

class Category {
  int id;
  Name name;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
   required this.id,
   required this.name,
   required this.image,
   required this.creationAt,
   required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: DateTime.parse(json["creationAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "image": image,
    "creationAt": creationAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

enum Name {
  ELECTRONICS,
  FURNITURE,
  NUEVO,
  OTHERS,
  SHOES
}

final nameValues = EnumValues({
  "Electronics": Name.ELECTRONICS,
  "Furniture": Name.FURNITURE,
  "nuevo": Name.NUEVO,
  "Others": Name.OTHERS,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
