import 'package:v_beauty/cart/models/cart.dart';

class Order {
  final List<CartItem> orderlines;
  final String orderId, createAt;
  final double total;

  Order(
      {required this.orderId,
      required this.total,
      required this.createAt,
      required this.orderlines});

  factory Order.fromJson(Map<String, dynamic> json) {
    DateTime createAt = DateTime.parse(json['CreatedAt']).toUtc().toLocal();
    var cartItems = List<CartItem>.from(
        json['Cart'].map((item) => CartItem.fromJson(item)));
    return Order(
        orderId: json['OrderID'],
        total: (json['Total'] as int).toDouble(),
        createAt: createAt.toString(),
        orderlines: cartItems);
  }
}
