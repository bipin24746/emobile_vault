import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart'; // Necessary for code generation

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "price")
  String? price;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.brand,
    required double? price,
    bool? offer,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
