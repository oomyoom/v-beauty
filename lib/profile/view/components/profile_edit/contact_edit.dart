import 'package:flutter/material.dart';
import 'package:v_beauty/widgets/custom_textformfield.dart';

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
