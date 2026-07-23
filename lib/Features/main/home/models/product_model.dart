List<ProductModel> productModelFromJson(str) => List<ProductModel>.from(
  str.map((x) => ProductModel.fromJson(x)),
);


class ProductModel {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  ProductModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    price: json["price"],
    description: json["description"],
    category: json["category"] == null
        ? null
        : Category.fromJson(json["category"]),
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"]!.map((x) => x)),
    creationAt: json["creationAt"] == null
        ? null
        : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

}

class Category {
  int? id;
  Name? name;
  Slug? slug;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]],
    slug: slugValues.map[json["slug"]],
    image: json["image"],
    creationAt: json["creationAt"] == null
        ? null
        : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

}

// ignore: constant_identifier_names
enum Name { CLOTHES, ELECTRONICS, MISCELLANEOUS, SHOES, UPDATED_CATEGORY_NAME }

final nameValues = EnumValues({
  "Clothes": Name.CLOTHES,
  "Electronics": Name.ELECTRONICS,
  "Miscellaneous": Name.MISCELLANEOUS,
  "Shoes": Name.SHOES,
  "Updated Category Name": Name.UPDATED_CATEGORY_NAME,
});

// ignore: constant_identifier_names
enum Slug { CLOTHES, ELECTRONICS, MISCELLANEOUS, SHOES, UPDATED_CATEGORY_NAME }

final slugValues = EnumValues({
  "clothes": Slug.CLOTHES,
  "electronics": Slug.ELECTRONICS,
  "miscellaneous": Slug.MISCELLANEOUS,
  "shoes": Slug.SHOES,
  "updated-category-name": Slug.UPDATED_CATEGORY_NAME,
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
