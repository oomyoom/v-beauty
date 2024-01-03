import 'package:flutter/material.dart';
import 'package:v_beauty/profile/view/components/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'โปรไฟล์',
          style: Theme.of(context).textTheme.titleMedium!,
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
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileBanner(),
          ),
          SliverToBoxAdapter(
            child: PersonalInfo(),
          ),
          SliverToBoxAdapter(
            child: ContactInfo(),
          ),
          SliverToBoxAdapter(
            child: DeliveryInfo(),
          )
        ],
      ),
    );
  }
}
