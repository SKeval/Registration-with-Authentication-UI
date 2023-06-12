// ignore_for_file: unused_import, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Page1.dart';

bool validate(String value, valuetype type) {
  String regName = '[a-zA-Z]';
  String regNumber = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String regMail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String regPassword =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  bool isvalid = true;
  switch (type) {
    case valuetype.name:
      if (value.isEmpty) {
        showMsg("Name should not be Empty");
        isvalid = false;
      }
      if (!RegExp(regName).hasMatch(value)) {
        showMsg("Name should be use Letter Only");
        isvalid = false;
      }
      break;

    case valuetype.email:
      if (value.isEmpty) {
        showMsg("Email should not be Empty");
        isvalid = false;
      }
      if (!RegExp(regMail).hasMatch(value)) {
        showMsg("Email should contain '@' and '.' at Perfect Place ");
        isvalid = false;
      }
    case valuetype.phone:
      if (value.isEmpty) {
        showMsg("Mobile Number should not be Empty");
        isvalid = false;
      }
      if (!RegExp(regNumber).hasMatch(value)) {
        showMsg("Mobile Number should contain only Numbers");
        isvalid = false;
      }
    case valuetype.password:
      if (value.isEmpty) {
        showMsg("Password should not be Empty");
        isvalid = false;
      }
      if (!RegExp(regPassword).hasMatch(value)) {
        showMsg(
            "Password Should contain at least One upper case, One lower case, One digit, One Special character, 8 characters in length");
        isvalid = false;
      }
      break;
    default:
      isvalid = true;
  }

  return isvalid;
}
