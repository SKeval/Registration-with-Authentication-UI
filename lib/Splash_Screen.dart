// ignore_for_file: unused_import, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:profilelists/Page1.dart';
import 'package:profilelists/login.dart';
import 'package:profilelists/login_ff.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

changePage(BuildContext context) {
  Timer(const Duration(seconds: 3), () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginFF(),
        ));
  });
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changePage(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_box_outlined,
              size: 100,
            ),
            Text(
              "Registration Forms",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
