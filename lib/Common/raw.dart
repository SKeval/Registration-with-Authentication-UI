// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class raw extends StatelessWidget {
  String title;
  raw({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15.2,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          // SizedBox(
          //   width: 30,
          // ),
        ],
      ),
    );
  }
}
