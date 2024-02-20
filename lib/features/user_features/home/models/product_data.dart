// To parse this JSON data, do
//
//     final productModal = productModalFromJson(jsonString);

import 'dart:convert';

List<ProductModal> productModalFromJson(String str) => List<ProductModal>.from(json.decode(str).map((x) => ProductModal.fromJson(x)));

String productModalToJson(List<ProductModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModal {
    int productId;
    String productName;
    int price;
    int categoryId;
    int r;
    int g;
    int b;
    int o;
    String image;
    String filterUrl;
    int shopperId;
    String categoryName;
    String name;
    String address;
    String email;
    String phone;

    ProductModal({
        required this.productId,
        required this.productName,
        required this.price,
        required this.categoryId,
        required this.r,
        required this.g,
        required this.b,
        required this.o,
        required this.image,
        required this.filterUrl,
        required this.shopperId,
        required this.categoryName,
        required this.name,
        required this.address,
        required this.email,
        required this.phone,
    });

    factory ProductModal.fromJson(Map<String, dynamic> json) => ProductModal(
        productId: json["ProductID"],
        productName: json["ProductName"],
        price: json["Price"],
        categoryId: json["CategoryID"],
        r: json["R"],
        g: json["G"],
        b: json["B"],
        o: json["O"],
        image: json["Image"],
        filterUrl: json["FilterURL"],
        shopperId: json["ShopperID"],
        categoryName: json["CategoryName"],
        name: json["Name"],
        address: json["Address"],
        email: json["Email"],
        phone: json["Phone"],
    );

    Map<String, dynamic> toJson() => {
        "ProductID": productId,
        "ProductName": productName,
        "Price": price,
        "CategoryID": categoryId,
        "R": r,
        "G": g,
        "B": b,
        "O": o,
        "Image": image,
        "FilterURL": filterUrl,
        "ShopperID": shopperId,
        "CategoryName": categoryName,
        "Name": name,
        "Address": address,
        "Email": email,
        "Phone": phone,
    };
}
