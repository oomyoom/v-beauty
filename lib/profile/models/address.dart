class SubDistrict {
  final String id;
  final String name;

  SubDistrict({required this.id, required this.name});

  factory SubDistrict.fromJson(Map<String, dynamic> json) {
    return SubDistrict(
      id: json['SUB_DISTRICT_ID'],
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
      id: json['DISTRICT_ID'],
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
      id: json['PROVINCE_ID'],
      name: json['PROVINCE_NAME'],
    );
  }
}

class Zipcode {
  final String id, pid, did, sdid;
  final String name;

  Zipcode(
      {required this.id,
      required this.name,
      required this.pid,
      required this.did,
      required this.sdid});

  factory Zipcode.fromJson(Map<String, dynamic> json) {
    return Zipcode(
      id: json['ZIPCODE_ID'],
      pid: json['PROVINCE_ID'],
      did: json['DISTRICT_ID'],
      sdid: json['SUB_DISTRICT_ID'],
      name: json['ZIPCODE'],
    );
  }
}
