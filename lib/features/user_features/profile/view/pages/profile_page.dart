import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile.dart';
import 'package:v_beauty/utils/session_expired.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
        backgroundColor: Colors.grey[200],
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is Unauthenticated) {
              showSessionExpiredSnackbarAndNavigate(context);
            }
          },
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
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.02),
                    child: InkWell(
                      onTap: () {
                        showLogoutConfirmationDialog(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'ออกจากระบบ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              );
            }
            if (state is ProfileError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Container();
          },
        ));
  }
}
