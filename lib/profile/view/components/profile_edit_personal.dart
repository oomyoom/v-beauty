import 'package:flutter/material.dart';
import 'package:v_beauty/models/user.dart';
import 'package:v_beauty/profile/view/components/profile_edit.dart';

class ProfileEditPersonal extends StatelessWidget {
  const ProfileEditPersonal({super.key, required this.profileInfoList});

  final List<ProfileInfoData> profileInfoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'แก้ไขข้อมูล',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFE5C1C5),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  ProfileInfoData data = profileInfoList[index];

                  return ProfileEdit(
                      label: data.label,
                      uinfo: data.uinfo,
                      enableTap: data.label == 'เพศ'
                          ? true
                          : false || data.label == 'วันเกิด'
                              ? true
                              : false,
                      onTap: () {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอก${data.label}';
                        }
                        return null;
                      });
                }, childCount: profileInfoList.length),
              )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.12),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.05),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFE5C1C5))),
                child: Text('แก้ไข'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
