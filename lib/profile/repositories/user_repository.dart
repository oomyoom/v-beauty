import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:v_beauty/profile/models/user.dart';

class UserRepository {
  Future<UserProfile> getUser() async {
    final url = Uri.parse('http://192.168.1.3:3333/user/get');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> userDataList = json.decode(response.body);

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
    final url = Uri.parse('http://192.168.1.3:3333/user/update/personal');
    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
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
    final url = Uri.parse('http://192.168.1.3:3333/user/update/contact');
    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': contact.email, 'tel': contact.tel}),
    );

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update contact profile');
    }
  }

  Future<void> updateDeliveryInfo(Delivery delivery) async {
    final url = Uri.parse('http://192.168.1.3:3333/user/update/delivery');
    final response = await http.patch(
      url,
      headers: {'Content-Type': 'application/json'},
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
    final url = Uri.parse('http://192.168.1.3:3333/user/update/image');
    final request = http.MultipartRequest('PATCH', url);
    request.files.add(http.MultipartFile(
      'image',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: 'image.jpg',
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      print("Profile updated successfully.");
    } else {
      throw Exception('Failed to update image profile');
    }
  }
}
