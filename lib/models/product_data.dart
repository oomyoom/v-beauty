// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

List<ProductModal> productModalFromJson(String str) => List<ProductModal>.from(
    json.decode(str).map((x) => ProductModal.fromJson(x)));

String productModalToJson(List<ProductModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModal {
  int? productId;
  String? name;
  int? price;
  int? categoryId;
  int? r;
  int? g;
  int? b;
  int? o;
  String? image;
  String? categoryName;
  String? filterUrl;
  double? rating;

  ProductModal(
      {this.productId,
      this.name,
      this.price,
      this.categoryId,
      this.r,
      this.g,
      this.b,
      this.o,
      this.image,
      this.categoryName,
      this.filterUrl,
      this.rating});

  factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        productId: json["ProductID"],
        name: json["ProductName"],
        price: json["Price"],
        categoryId: json["CategoryID"],
        r: json["R"],
        g: json["G"],
        b: json["B"],
        o: json["O"],
        image: json["Image"],
        categoryName: json["CategoryName"],
        filterUrl: json["FilterURL"],
        rating: json["AverageRating"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ProductName": name,
        "Price": price,
        "CategoryID": categoryId,
        "R": r,
        "G": g,
        "B": b,
        "O": o,
        "Image": image,
        "CategoryName": categoryName,
        "FilterURL": filterUrl,
        "AverageRating": rating,
      };
}
