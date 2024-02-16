import 'package:flutter/material.dart';
import 'package:v_beauty/widget/custom_textformfield.dart';

class PersonalEdit extends StatelessWidget {
  PersonalEdit({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.genderController,
    required this.birthDayController,
  });
  final List<String> genders = ['ชาย', 'หญิง', 'ไม่ระบุ'];

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController genderController;
  final TextEditingController birthDayController;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      errorFormatText: 'กรุณากรอกวันเกิดที่ถูกต้อง',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDayController.text = picked.toString().split(' ')[0];
    }
  }

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
        CustomDropdown(genderController: genderController, genders: genders),
        CustomTextFormField(
          label: 'วันเกิด',
          controller: birthDayController,
          enableTap: true,
          onTap: () {
            _selectDate(context);
          },
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

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.genderController,
    required this.genders,
  });

  final TextEditingController genderController;
  final List<String> genders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          dropdownColor: const Color(0xFFeee8f4),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.lightBlue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.04)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.04)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.04),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.04),
              ),
            ),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red),
            labelText: 'เพศ',
            labelStyle: Theme.of(context).textTheme.bodyMedium!,
            hintText: 'กรอกเพศ',
            hintStyle: Theme.of(context).textTheme.bodyMedium!,
            //border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
          ),
          value: genderController.text,
          items: genders.map((String gender) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: gender,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      gender,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            genderController.text = value!;
          },
          validator: (value) => value == null ? 'กรุณาเลือกเพศ' : null,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}