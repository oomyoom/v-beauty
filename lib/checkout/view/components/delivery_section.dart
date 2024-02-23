import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/view/pages/profile_edit.dart';
import 'package:v_beauty/widget/section_title.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.04),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoaded) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                      title: 'ที่อยู่สำหรับจัดส่ง',
                      press: () {
                        context.read<ProfileBloc>().add(ProfileEdit());
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileEditPage(
                                  editSection: 'delivery',
                                )));
                      },
                      labelbutton: 'แก้ไข'),
                  Text(
                    state.profile.delivery.provider,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xFF615C62)),
                  ),
                  Text(
                    state.profile.delivery.address,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xFF615C62)),
                  ),
                  Text(
                    state.profile.delivery.zipcode,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xFF615C62)),
                  ),
                ]);
          }
          if (state is ProfileError) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
