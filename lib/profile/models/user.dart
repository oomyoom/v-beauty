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
