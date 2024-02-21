import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


bool isTokenExpired(String token) {
  try {
    Map<String, dynamic> payload = JwtDecoder.decode(token);

    // ตรวจสอบค่า exp
    final DateTime expirationDate =
        DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
    final DateTime now = DateTime.now();

    return now.isAfter(
        expirationDate); // ถ้าเวลาปัจจุบันหลังจากวันหมดอายุ, token หมดอายุแล้ว
  } catch (e) {
    // ในกรณีที่มีข้อผิดพลาดในการ decode (เช่น token ไม่ถูกต้อง), ถือว่า token หมดอายุ
    return true;
  }
}
