import 'package:flutter/material.dart';

import 'package:v_beauty/profile/models/address.dart';
import 'package:v_beauty/profile/repositories/address_repository.dart';
import 'package:v_beauty/widgets/custom_textformfield.dart';
import 'package:v_beauty/widgets/search.dart';

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

  Future<void> _setAddress(BuildContext context) async {
    final AddressRepository repository = AddressRepository();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Search(
              searchFunction: (String searchName) async {
                return await repository.searchSubDistrictsByName(searchName);
              },
              onTap: (dynamic result) async {
                List<Province> proList =
                    await repository.searchProvinceById(result.pid);
                List<District> disList =
                    await repository.searchDistrictById(result.did);
                List<Zipcode> zipList =
                    await repository.searchZipcodeById(result.id);
                final address =
                    '${result.name}/${disList[0].name}/${proList[0].name}';
                final zipcode = zipList[0].name;
                Navigator.pop(
                    context, Address(address: address, zipcode: zipcode));
              },
              title: 'ตำบล')),
    );

    if (result != null) {
      addressController.text = result.address;
      zipcodeController.text = result.zipcode;
    }
  }

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
          label: 'ที่อยู่',
          controller: addressController,
          enableTap: true,
          onTap: () {
            _setAddress(context);
          },
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
            if (!RegExp(r'^\d{5}$').hasMatch(value)) {
              return 'กรุณากรอกรหัสไปรษณีย์ที่ถูกต้อง';
            }
            return null;
          },
        ),
      ],
    );
  }
}
