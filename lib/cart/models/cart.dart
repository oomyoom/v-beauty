import 'package:v_beauty/models/product_data.dart';

class CartItem {
  final ProductModal productItem;
  int quantity;

  CartItem({required this.productItem, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productItem: ProductModal.fromJson(json['Product']),
      quantity: json['Quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productItem': productItem.toJson(),
      'quantity': quantity,
    };
  }
}
