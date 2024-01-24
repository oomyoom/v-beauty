class ProfileInfoData {
  String label, uinfo;

  ProfileInfoData({
    required this.label,
    required this.uinfo,
  });
}

List<ProfileInfoData> personalInfoList = [
  ProfileInfoData(label: 'ชื่อ', uinfo: 'TANAKORN'),
  ProfileInfoData(label: 'นามสกุล', uinfo: 'TOSANGUAN'),
  ProfileInfoData(label: 'เพศ', uinfo: 'ชาย'),
  ProfileInfoData(label: 'วันเกิด', uinfo: 'DD/MM/YYYY'),
];

List<ProfileInfoData> contactInfoList = [
  ProfileInfoData(label: 'อีเมล์', uinfo: 'oomyoom@xxx.com'),
  ProfileInfoData(label: 'เบอร์โทรศัพท์', uinfo: '09xxxxxxxx'),
];

List<ProfileInfoData> deliveryInfoList = [
  ProfileInfoData(label: 'บ้านเลขที่,ถนน,ซอย', uinfo: '999/99 หมู่ 99'),
  ProfileInfoData(
      label: 'ตำบล/อำเภอ/จังหวัด', uinfo: 'กรุงเทพฯ กรุงเทพฯ กรุงเทพฯ'),
  ProfileInfoData(label: 'รหัสไปรษณีย์', uinfo: '1xxxx'),
];

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
