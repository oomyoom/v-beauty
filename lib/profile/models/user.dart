import 'package:intl/intl.dart';

class Personal {
  final String firstName, lastName, gender, birthday;

  Personal(
      {required this.firstName,
      required this.lastName,
      required this.gender,
      required this.birthday});
}

class Contact {
  final String email, tel;

  Contact({required this.email, required this.tel});
}

class Delivery {
  final String provider, address, zipcode;

  Delivery(
      {required this.provider, required this.address, required this.zipcode});
}

class UserProfile {
  final List<int>? image;
  final Personal personal;
  final Contact contact;
  final Delivery delivery;

  UserProfile(
      {required this.personal,
      required this.contact,
      required this.delivery,
      required this.image});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = DateTime.parse(json['birthday']).toUtc().toLocal();
    return UserProfile(
      personal: Personal(
        firstName: json['fname'],
        lastName: json['lname'],
        gender: json['gender'],
        birthday: DateFormat('yyyy-MM-dd').format(dateTime),
      ),
      contact: Contact(
        email: json['email'],
        tel: json['tel'],
      ),
      delivery: Delivery(
        provider: json['provider'],
        address: json['address'],
        zipcode: json['zipcode'].toString(),
      ),
      image: (json['image']['data'] as List).cast<int>(),
    );
  }
}
