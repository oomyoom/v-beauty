class ProfileInfoData {
  final String label, uinfo;

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
