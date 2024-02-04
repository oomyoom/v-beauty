import 'package:v_beauty/profile/models/user.dart';

class UserRepository {
  //final String baseUrl = "https://yourapi.com/todos";

  Future<UserProfile> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserProfile(
        image: null,
        personal: Personal(
            firstName: 'TANAKORN',
            lastName: 'TOSANGUAN',
            gender: 'ชาย',
            birthday: 'YYYY-MM-DD'),
        contact: Contact(email: 'oomyoom@xxx.com', tel: '0900000000'),
        delivery: Delivery(
            provider: 'PROVIDER', address: 'ADDRESS', zipcode: 'ZIPCODE'));
  }

  // Add methods for create, update, and delete operations here
}
