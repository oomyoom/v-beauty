import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/profile/view/pages/profile_edit.dart';
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
        Flexible(
          child: Text(
            uinfo,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
        } else if (state is ProfileLoaded) {
          return Column(
            children: [
              SectionTitle(
                  title: 'ข้อมูลส่วนตัว',
                  press: () {
                    context.read<ProfileBloc>().add(ProfileEdit());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                                  editSection: 'personal',
                                )));
                  },
                  labelbutton: 'แก้ไข'),
              Column(
                children: [
                  ProfileInfo(
                    label: 'ชื่อ',
                    uinfo: state.profile.personal.firstName,
                  ),
                  ProfileInfo(
                    label: 'นามสกุล',
                    uinfo: state.profile.personal.lastName,
                  ),
                  ProfileInfo(
                    label: 'เพศ',
                    uinfo: state.profile.personal.gender,
                  ),
                  ProfileInfo(
                    label: 'วันเกิด',
                    uinfo: state.profile.personal.birthday,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
        } else if (state is ProfileLoaded) {
          return Column(
            children: [
              SectionTitle(
                  title: 'ข้อมูลติดต่อ',
                  press: () {
                    context.read<ProfileBloc>().add(ProfileEdit());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                                  editSection: 'contact',
                                )));
                  },
                  labelbutton: 'แก้ไข'),
              Column(
                children: [
                  ProfileInfo(
                    label: 'อีเมล์',
                    uinfo: state.profile.contact.email,
                  ),
                  ProfileInfo(
                    label: 'เบอร์โทรศัพท์',
                    uinfo: state.profile.contact.tel,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
        } else if (state is ProfileLoaded) {
          return Column(
            children: [
              SectionTitle(
                  title: 'ที่อยู่',
                  press: () {
                    context.read<ProfileBloc>().add(ProfileEdit());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                                  editSection: 'delivery',
                                )));
                  },
                  labelbutton: 'แก้ไข'),
              Column(
                children: [
                  ProfileInfo(
                    label: 'บ้านเลขที่,ถนน,ซอย',
                    uinfo: state.profile.delivery.provider,
                  ),
                  ProfileInfo(
                    label: 'ตำบล/อำเภอ/จังหวัด',
                    uinfo: state.profile.delivery.address,
                  ),
                  ProfileInfo(
                    label: 'รหัสไปรษณีย์',
                    uinfo: state.profile.delivery.zipcode,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
