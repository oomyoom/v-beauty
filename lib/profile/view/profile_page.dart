import 'package:flutter/material.dart';
import 'package:v_beauty/profile/view/components/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          backgroundColor: const Color(0xFFE5C1C5),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.manage_accounts,
                  )),
            )
          ],
        ),
        backgroundColor: Colors.grey[200],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                color: Colors.white,
                child: const PersonalInfo(),
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                color: Colors.white,
                child: const ContactInfo(),
              ),
            )),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                color: Colors.white,
                child: const DeliveryInfo(),
              ),
            )),
          ],
        ));
  }
}