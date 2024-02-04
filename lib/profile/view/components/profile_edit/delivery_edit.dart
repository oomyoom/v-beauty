import 'package:flutter/material.dart';

import 'package:v_beauty/profile/models/address.dart';
import 'package:v_beauty/profile/repositories/address_repository.dart';
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

  Future<void> _setAddress(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddressSearch()),
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

class AddressSearch extends StatefulWidget {
  const AddressSearch({super.key});

  @override
  _AddressSearchState createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  final AddressRepository _repository = AddressRepository();
  List<SubDistrict> _searchResults = [];

  void _search(String searchName) async {
    if (searchName.isNotEmpty) {
      List<SubDistrict> results =
          await _repository.searchSubDistrictsByName(searchName);
      setState(() {
        _searchResults = results;
      });
    } else {
      // ถ้าไม่มีข้อความในการค้นหา ล้างผลลัพธ์
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.06),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _search(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'ตำบล',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    List<Province> proList =
                        await AddressRepository().getProvinces();
                    List<District> disList =
                        await AddressRepository().getDistricts();
                    List<Zipcode> zipList =
                        await AddressRepository().getZipcodes();
                    proList = proList
                        .where((element) => element.id
                            .toLowerCase()
                            .contains(_searchResults[index].pid.toLowerCase()))
                        .toList();
                    disList = disList
                        .where((element) => element.id
                            .toLowerCase()
                            .contains(_searchResults[index].did.toLowerCase()))
                        .toList();
                    zipList = zipList
                        .where((element) => element.sdid
                            .toLowerCase()
                            .contains(_searchResults[index].id.toLowerCase()))
                        .toList();
                    final address =
                        '${_searchResults[index].name}/${disList[0].name}/${proList[0].name}';
                    final zipcode = zipList[0].name;
                    Navigator.pop(
                        context, Address(address: address, zipcode: zipcode));
                  },
                  title: Text(_searchResults[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
