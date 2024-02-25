import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:v_beauty/features/user_features/profile/models/address.dart';

class AddressRepository {
  //final String baseUrl = "https://yourapi.com/todos";

  Future<List<SubDistrict>> getsubDistricts() async {
    final String response =
        await rootBundle.loadString('assets/address/subDistricts.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<SubDistrict> subDistricts =
        dataList.map((data) => SubDistrict.fromJson(data)).toList();
    return subDistricts;
  }

  Future<List<SubDistrict>> searchSubDistrictsByName(String searchName) async {
    // ได้รับ list ของ SubDistricts จาก JSON
    List<SubDistrict> subDistricts = await getsubDistricts();
    // กรอง SubDistricts ตามชื่อ
    List<SubDistrict> filteredSubDistricts = subDistricts.where((subDistrict) => 
      subDistrict.name.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
    return filteredSubDistricts;
  }

  Future<List<District>> getDistricts() async {
    final String response =
        await rootBundle.loadString('assets/address/districts.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<District> districts =
        dataList.map((data) => District.fromJson(data)).toList();
    return districts;
  }

  Future<List<District>> searchDistrictById(String searchName) async {
    // ได้รับ list ของ SubDistricts จาก JSON
    List<District> districts = await getDistricts();
    // กรอง SubDistricts ตามชื่อ
    List<District> filteredDistricts = districts.where((district) => 
      district.id.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
    return filteredDistricts;
  }

  Future<List<Province>> getProvinces() async {
    final String response =
        await rootBundle.loadString('assets/address/provinces.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<Province> provinces =
        dataList.map((data) => Province.fromJson(data)).toList();
    return provinces;
  }

  Future<List<Province>> searchProvinceById(String searchName) async {
    // ได้รับ list ของ SubDistricts จาก JSON
    List<Province> province = await getProvinces();
    // กรอง SubDistricts ตามชื่อ
    List<Province> filteredProvinces = province.where((province) => 
      province.id.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
    return filteredProvinces;
  }

  Future<List<Zipcode>> getZipcodes() async {
    final String response =
        await rootBundle.loadString('assets/address/zipcodes.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<Zipcode> zipcodes =
        dataList.map((data) => Zipcode.fromJson(data)).toList();
    return zipcodes;
  }

  Future<List<Zipcode>> searchZipcodeById(String searchName) async {
    // ได้รับ list ของ SubDistricts จาก JSON
    List<Zipcode> zipcodes = await getZipcodes();
    // กรอง SubDistricts ตามชื่อ
    List<Zipcode> filteredZipcodes = zipcodes.where((zipcode) => 
      zipcode.sdid.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
    return filteredZipcodes;
  }

  // Add methods for create, update, and delete operations here
}
