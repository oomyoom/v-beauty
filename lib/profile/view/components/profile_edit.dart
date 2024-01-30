import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/profile/models/user.dart';
import 'package:v_beauty/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/widgets/custom_textformfield.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key, required this.editSection});

  final String editSection;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDayController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController providerController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();

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
            context.read<ProfileBloc>().add(ProfileLoad());
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          context.read<ProfileBloc>().add(ProfileLoad());
          if (state is ProfileLoaded) {
            controllerinitvalue(state);
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

  void controllerinitvalue(ProfileLoaded state) {
    firstNameController.text = state.profile.personal.firstName;
    lastNameController.text = state.profile.personal.lastName;
    genderController.text = state.profile.personal.gender;
    birthDayController.text = state.profile.personal.birthday;
    emailController.text = state.profile.contact.email;
    telController.text = state.profile.contact.tel;
    providerController.text = state.profile.delivery.provider;
    addressController.text = state.profile.delivery.address;
    zipcodeController.text = state.profile.delivery.zipcode;
  }
}

class PersonalEdit extends StatelessWidget {
  const PersonalEdit({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.genderController,
    required this.birthDayController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController genderController;
  final TextEditingController birthDayController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'ชื่อ',
          controller: firstNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกชื่อ';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'นามสกุล',
          controller: lastNameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกนามสกุล';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'เพศ',
          controller: genderController,
          enableTap: true,
          onTap: () {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกเพศ';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'วันเกิด',
          controller: birthDayController,
          enableTap: true,
          onTap: () {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกวันเกิด';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class ContactEdit extends StatelessWidget {
  const ContactEdit({
    super.key,
    required this.emailController,
    required this.telController,
  });

  final TextEditingController emailController;
  final TextEditingController telController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'อีเมล์',
          controller: emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกอีเมล์';
            }
            if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                .hasMatch(value)) {
              return 'กรุณากรอกอีเมล์ที่ถูกต้อง';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'เบอร์โทรศัพท์',
          controller: telController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกเบอร์โทรศัพท์';
            }
            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
              return 'กรุณากรอกเบอร์โทรศัพท์ที่ถูกต้อง';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class DeliveryEdit extends StatelessWidget {
  const DeliveryEdit({
    super.key,
    required this.providerController,
    required this.addressController,
    required this.zipcodeController,
  });

  final TextEditingController providerController;
  final TextEditingController addressController;
  final TextEditingController zipcodeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          label: 'บ้านเลขที่,ถนน,ซอย',
          controller: providerController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกที่อยู่';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'ตำบล/อำเภอ/จังหวัด',
          controller: addressController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกที่อยู่';
            }
            return null;
          },
        ),
        CustomTextFormField(
          label: 'รหัสไปรษณีย์',
          controller: zipcodeController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกรหัสไปรษณีย์';
            }
            return null;
          },
        ),
      ],
    );
  }
}
