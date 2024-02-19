import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/repositories/user_repository.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile_page/profile_banner.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile_page/profile_features.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile_page/profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final userRepository = UserRepository();
  // @override
  // void initState() {
  //   super.initState();
  //   ProfileBloc(userRepository: userRepository)..add(ProfileLoad());
  // }

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(userRepository: userRepository)..add(ProfileLoad()),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'โปรไฟล์'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 1,
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
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProfileLoaded) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: ProfileBanner(),
                    ),
                    const SliverToBoxAdapter(
                      child: ProfileFeatures(),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.02),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
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
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        color: Colors.white,
                        child: const DeliveryInfo(),
                      ),
                    )),
                  ],
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
