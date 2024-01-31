import 'package:flutter/material.dart';
import 'package:v_beauty/widgets/custom_textformfield.dart';

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
