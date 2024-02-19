import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/features/user_features/profile/models/user.dart';
import 'package:v_beauty/utils/getToken.dart';

class UserRepository {
  Future<UserProfile> getUser() async {
    final token = await getToken();
    print(token);
    final url = Uri.parse('http://${ApiConstants.getUser}/get');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type':
            'application/json', // อาจจะต้องปรับแต่งตามความต้องการของ API
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> userDataList = json.decode(response.body);
      print(userDataList);
      if (userDataList.isNotEmpty) {
        final Map<String, dynamic> userData = userDataList[0];
        return UserProfile.fromJson(userData);
      } else {
        throw Exception('User data is empty');
      }
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<void> updatePersonalInfo(Personal personal) async {
    final token = await getToken();

    final url = Uri.parse('http://${ApiConstants.getUser}/update/personal');
    final response = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'fname': personal.firstName,
        'lname': personal.lastName,
        'gender': personal.gender,
        'birthday': personal.birthday
      }),
    );

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update personal profile');
    }
  }

  Future<void> updateContactInfo(Contact contact) async {
    final token = await getToken();

    final url = Uri.parse('http://${ApiConstants.getUser}/update/contact');
    final response = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({'email': contact.email, 'tel': contact.tel}),
    );

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update contact profile');
    }
  }

  Future<void> updateDeliveryInfo(Delivery delivery) async {
    final token = await getToken();

    final url = Uri.parse('http://${ApiConstants.getUser}/update/delivery');
    final response = await http.patch(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'provider': delivery.provider,
        'address': delivery.address,
        'zipcode': delivery.zipcode
      }),
    );

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update delivery profile');
    }
  }

  Future<void> uploadImage(File imageFile) async {
    final url = Uri.parse('http://${ApiConstants.getUser}/update/image');
    final request = http.MultipartRequest('PATCH', url);
    request.files.add(http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: 'image.jpg',
    ));

    final token = await getToken();

    request.headers['Authorization'] = 'Bearer $token';

    final response = await request.send();

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update image profile');
    }
  }
}
