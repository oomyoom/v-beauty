import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/models/user.dart';
import 'package:v_beauty/features/user_features/profile/view/components/profile.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key, required this.editSection});

  final String editSection;
  final _formKey = GlobalKey<FormState>();

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
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdated) {
            Navigator.pop(context);
            context.read<ProfileBloc>().add(ProfileLoad());
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoaded) {
            final TextEditingController firstNameController =
                TextEditingController(text: state.profile.personal.firstName);
            final TextEditingController lastNameController =
                TextEditingController(text: state.profile.personal.lastName);
            final TextEditingController genderController =
                TextEditingController(text: state.profile.personal.gender);
            final TextEditingController birthDayController =
                TextEditingController(text: state.profile.personal.birthday);
            final TextEditingController emailController =
                TextEditingController(text: state.profile.contact.email);
            final TextEditingController telController =
                TextEditingController(text: state.profile.contact.tel);
            final TextEditingController providerController =
                TextEditingController(text: state.profile.delivery.provider);
            final TextEditingController addressController =
                TextEditingController(text: state.profile.delivery.address);
            final TextEditingController zipcodeController =
                TextEditingController(text: state.profile.delivery.zipcode);

            return Form(
              key: _formKey,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: () {
                        if (editSection == 'personal') {
                          return PersonalEdit(
                              firstNameController: firstNameController,
                              lastNameController: lastNameController,
                              genderController: genderController,
                              birthDayController: birthDayController);
                        } else if (editSection == 'contact') {
                          return ContactEdit(
                              emailController: emailController,
                              telController: telController);
                        } else if (editSection == 'delivery') {
                          return DeliveryEdit(
                              providerController: providerController,
                              addressController: addressController,
                              zipcodeController: zipcodeController);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }(),
                    ),
                  ),
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final profileBloc =
                                BlocProvider.of<ProfileBloc>(context);
                            if (editSection == 'personal') {
                              profileBloc.add(UpdatePersonalEvent(
                                Personal(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  gender: genderController.text,
                                  birthday: birthDayController.text,
                                ),
                              ));
                            } else if (editSection == 'contact') {
                              profileBloc.add(UpdateContactEvent(
                                Contact(
                                    email: emailController.text,
                                    tel: telController.text),
                              ));
                            } else if (editSection == 'delivery') {
                              profileBloc.add(UpdateDeliveryEvent(
                                Delivery(
                                    provider: providerController.text,
                                    address: addressController.text,
                                    zipcode: zipcodeController.text),
                              ));
                            }
                          }
                        },
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height * 0.05),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFE5C1C5))),
                        child: Text('บันทึก'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyMedium!),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
