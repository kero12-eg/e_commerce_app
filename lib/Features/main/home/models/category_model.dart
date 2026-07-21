// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);


List<CategoryModel> categoryModelFromJson(str) {
  return List<CategoryModel>.from(
      str.map((x) => CategoryModel.fromJson(x)),
    );
}

class CategoryModel {
  int? id;
  String? name;
  String? slug;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    creationAt: json["creationAt"] == null
        ? null
        : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );
}
