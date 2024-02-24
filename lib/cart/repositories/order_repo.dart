import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:v_beauty/cart/models/cart.dart';
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/utils/token_management.dart';

class OrderRepository {
  Future<void> createOrder(
      int payment, int total, List<CartItem> cartItems) async {
    final String? token = await getToken();
    var decodedToken = JwtDecoder.decode(token!);
    final uid = decodedToken['id'];

    List<Map<String, dynamic>> cartItemsMap =
        cartItems.map((item) => item.toJson()).toList();

    final response =
        await http.post(Uri.parse('http://${ApiConstants.order}/create'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              // รายละเอียดคำสั่งซื้อและการชำระเงิน
              'uid': uid,
              'payment': payment,
              'total': total,
              'items': cartItemsMap,
            }));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    }
  }
}
