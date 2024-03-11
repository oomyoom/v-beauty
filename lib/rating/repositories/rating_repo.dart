import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/utils/token_management.dart';

class RatingRepository {
  Future<void> submitRating(int productId, int rating, String comment) async {
    final String? token = await getToken();
    var decodedToken = JwtDecoder.decode(token!);
    final uid = decodedToken['id'];

    final response =
        await http.post(Uri.parse('http://${ApiConstants.rating}/create'),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              'uid': uid,
              'productId': productId,
              'rating': rating,
              'comment': comment,
            }));
    if (response.statusCode == 200) {
      //final Map<String, dynamic> data = json.decode(response.body);
      print('success');
    }
  }
}
