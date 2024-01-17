import 'package:flutter/material.dart';
import 'package:v_beauty/models/user.dart';
import 'package:v_beauty/profile/view/components/profile.dart';
import 'package:v_beauty/profile/view/components/profile_edit_contact.dart';
import 'package:v_beauty/profile/view/components/profile_edit_delivery.dart';
import 'package:v_beauty/profile/view/components/profile_edit_personal.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'โปรไฟล์'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFE5C1C5),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.manage_accounts,
                )),
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ProfileBanner(),
          ),
          const SliverToBoxAdapter(
            child: ProfileFeatures(),
          ),
          SliverToBoxAdapter(
              child: ProfileContent(
            title: 'ข้อมูลส่วนตัว',
            profileInfoList: personalInfoList,
            editRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileEditPersonal(
                          profileInfoList: personalInfoList)));
            },
          )),
          SliverToBoxAdapter(
            child: ProfileContent(
              title: 'ข้อมูลติดต่อ',
              profileInfoList: contactInfoList,
              editRoute: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileEditContact(
                            profileInfoList: contactInfoList)));
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileContent(
              title: 'ที่อยู่',
              profileInfoList: deliveryInfoList,
              editRoute: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileEditDelivery(
                            profileInfoList: deliveryInfoList)));
              },
            ),
          )
        ],
      ),
    );
  }
}
