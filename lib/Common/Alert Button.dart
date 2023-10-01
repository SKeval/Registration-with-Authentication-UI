// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/login_ff.dart';

class Diolog {
  static void showAwesome(BuildContext context, String title, String content) {
    AwesomeDialog(
      context: context,
      title: title,
      desc: content,
      dialogType: DialogType.warning,
      animType: AnimType.rightSlide,
      dismissOnTouchOutside: false,
      btnOkText: "Logout",
      btnOkOnPress: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginFF(),
        ));
        showMsg("Log Out");
      },
      btnCancelOnPress: () {},
    ).show();
  }

  static void showAlertDiolog(
      BuildContext context, String title, String content) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Text(title),
          content: Text(content),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginFF(),
                  ));
                  showMsg("Log Out");
                },
                child: const Text("Log Out")),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
          ],
        );
      },
    );
  }
}
