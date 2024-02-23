// ignore_for_file: use_build_context_synchronously

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';

Future<void> saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<void> removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}

Future<bool> checkTokenExpiration() async {
  final String? token = await getToken();
  if (token == null || JwtDecoder.isExpired(token)) {
    CartBloc().add(CartCleared());
    await removeToken();
    return true;
  } else {
    return false;
  }
}
