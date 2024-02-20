import 'package:v_beauty/models/product_data.dart';

class CartItem {
  final ProductModal productItem;
  int quantity;

  CartItem({required this.productItem, required this.quantity});
}
