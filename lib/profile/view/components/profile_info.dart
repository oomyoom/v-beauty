import 'package:flutter/material.dart';
import 'package:v_beauty/models/user.dart';
import 'package:v_beauty/widgets/section_title.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
    required this.title,
    required this.editRoute,
    required this.profileInfoList,
  });

  final String title;
  final VoidCallback editRoute;
  final List<ProfileInfoData> profileInfoList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        color: Colors.white,
        child: Column(
          children: [
            SectionTitle(
                title: title,
                press: editRoute,
                labelbutton: 'แก้ไข'),
            for (var profileInfo in profileInfoList)
              ProfileInfo(
                label: profileInfo.label,
                uinfo: profileInfo.uinfo,
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.label, required this.uinfo});

  final String label, uinfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Color(0xFF615C62)),
        ),
        Text(
          uinfo,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
      ],
    );
  }
}
