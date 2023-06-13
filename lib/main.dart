// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:profilelists/Page1.dart';
import 'package:profilelists/Page2.dart';
import 'package:profilelists/Splash_Screen.dart';
import 'package:profilelists/login_ff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // useMaterial3: true,
          //brightness: Brightness.dark,
          primaryColor: Colors.brown[200],
          primarySwatch: Colors.brown),
      home: const SplashScreen(),
    );
  }
}
