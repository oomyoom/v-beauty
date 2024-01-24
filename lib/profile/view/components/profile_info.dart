import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/profile/view/components/profile_edit.dart';
import 'package:v_beauty/widgets/section_title.dart';

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
              .copyWith(color: const Color(0xFF615C62)),
        ),
        Text(
          uinfo,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: 'ข้อมูลส่วนตัว',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            editSection: 'personal',
                          )));
            },
            labelbutton: 'แก้ไข'),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                ProfileInfo(
                  label: 'ชื่อ',
                  uinfo: state.personal.firstName,
                ),
                ProfileInfo(
                  label: 'นามสกุล',
                  uinfo: state.personal.lastName,
                ),
                ProfileInfo(
                  label: 'เพศ',
                  uinfo: state.personal.gender,
                ),
                ProfileInfo(
                  label: 'วันเกิด',
                  uinfo: state.personal.birthday,
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: 'ข้อมูลติดต่อ',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            editSection: 'contact',
                          )));
            },
            labelbutton: 'แก้ไข'),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                ProfileInfo(
                  label: 'อีเมล์',
                  uinfo: state.contact.email,
                ),
                ProfileInfo(
                  label: 'เบอร์โทรศัพท์',
                  uinfo: state.contact.tel,
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: 'ที่อยู่',
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            editSection: 'delivery',
                          )));
            },
            labelbutton: 'แก้ไข'),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                ProfileInfo(
                  label: 'บ้านเลขที่,ถนน,ซอย',
                  uinfo: state.delivery.provider,
                ),
                ProfileInfo(
                  label: 'ตำบล/อำเภอ/จังหวัด',
                  uinfo: state.delivery.address,
                ),
                ProfileInfo(
                  label: 'รหัสไปรษณีย์',
                  uinfo: state.delivery.zipcode,
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}