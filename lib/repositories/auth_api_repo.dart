import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/models/auth_data.dart';


class AuthRepository {
  Future<AuthModel?> authenticate(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://${ApiConstants.authUrl}'),
        body: {
          'Email': username,
          'Password': password,
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final AuthModel authModel = AuthModel.fromJson(data);
        return authModel;
      } else {
        print('Authentication failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error during authentication: $e');
      return null;
    }
  }
}
