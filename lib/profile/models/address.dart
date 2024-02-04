class SubDistrict {
  final String id, pid, did;
  final String name;

  SubDistrict(
      {required this.id,
      required this.pid,
      required this.did,
      required this.name});

  factory SubDistrict.fromJson(Map<String, dynamic> json) {
    return SubDistrict(
      id: json['SUB_DISTRICT_ID'].toString(),
      pid: json['PROVINCE_ID'].toString(),
      did: json['DISTRICT_ID'].toString(),
      name: json['SUB_DISTRICT_NAME'],
    );
  }
}

class District {
  final String id;
  final String name;

  District({required this.id, required this.name});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['DISTRICT_ID'].toString(),
      name: json['DISTRICT_NAME'],
    );
  }
}

class Province {
  final String id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['PROVINCE_ID'].toString(),
      name: json['PROVINCE_NAME'],
    );
  }
}

class Zipcode {
  final String id, sdid;
  final String name;

  Zipcode({required this.id, required this.name, required this.sdid});

  factory Zipcode.fromJson(Map<String, dynamic> json) {
    return Zipcode(
      id: json['ZIPCODE_ID'].toString(),
      sdid: json['SUB_DISTRICT_ID'].toString(),
      name: json['ZIPCODE'],
    );
  }
}

class Address {
  final String address;
  final String zipcode;

  Address({required this.address, required this.zipcode});
}
