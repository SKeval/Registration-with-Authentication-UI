// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

//all keys
const String registrationKey = 'register';

Future<bool> getvalues(Map registration) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  String registrationStr = jsonEncode(registration);

  return pref.setString(registrationKey, registrationStr);
}

Future<Map> showValues() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  String result = pref.getString(registrationKey) ?? "NA";
  Map<String, dynamic> RegistrationMap = {};
  RegistrationMap = jsonDecode(result);

  return RegistrationMap;
}
