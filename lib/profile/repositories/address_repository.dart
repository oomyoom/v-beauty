import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:v_beauty/profile/models/address.dart';

class AddressRepository {
  //final String baseUrl = "https://yourapi.com/todos";

  Future<List> getsubDistricts() async {
    final String response =
        await rootBundle.loadString('assets/address/subDistricts.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<SubDistrict> subDistricts =
        dataList.map((data) => SubDistrict.fromJson(data)).toList();
    return subDistricts;
  }

  Future<List> getDistricts() async {
    final String response =
        await rootBundle.loadString('assets/address/districts.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<District> districts =
        dataList.map((data) => District.fromJson(data)).toList();
    return districts;
  }

  Future<List> getsubProvinces() async {
    final String response =
        await rootBundle.loadString('assets/address/provinces.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<Province> provinces =
        dataList.map((data) => Province.fromJson(data)).toList();
    return provinces;
  }

  Future<List> getZipcodes() async {
    final String response =
        await rootBundle.loadString('assets/address/zipcodes.json');
    final List<dynamic> dataList = await json.decode(response);
    final List<Zipcode> zipcodes =
        dataList.map((data) => Zipcode.fromJson(data)).toList();
    return zipcodes;
  }

  // Add methods for create, update, and delete operations here
}
