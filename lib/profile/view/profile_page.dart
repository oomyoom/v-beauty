import 'package:flutter/material.dart';
import 'package:v_beauty/models/user.dart';
import 'package:v_beauty/profile/view/components/profile.dart';

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
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_rate_rounded)),
                        Text('การให้คะแนน')
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.history_rounded)),
                        Text('ประวัติคำสั่งซื้อ')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: ProfileContent(
                  title: 'ข้อมูลส่วนตัว',
                  editRoute: '/personaledit',
                  profileInfoList: personalInfoList)),
          SliverToBoxAdapter(
            child: ProfileContent(
                title: 'ข้อมูลติดต่อ',
                editRoute: '/personaledit',
                profileInfoList: contactInfoList),
          ),
          SliverToBoxAdapter(
            child: ProfileContent(
                title: 'ที่อยู่',
                editRoute: '/personaledit',
                profileInfoList: deliveryInfoList),
          )
        ],
      ),
    );
  }
}
