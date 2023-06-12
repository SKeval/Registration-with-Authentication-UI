// ignore_for_file: file_names, must_be_immutable, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profilelists/Common/ShowMsg.dart';

class Txtfield extends StatefulWidget {
  IconData? icon;
  TextEditingController? controller;
  TextInputType keyboard;
  String? hint;
  String? label;
  DateTime? date;
  bool isVisible;
  bool pass;
  VoidCallback? onTap;
  String? Function(String? val)? Onvalidator;

  Txtfield({
    super.key,
    this.label,
    this.isVisible = false,
    this.hint,
    this.keyboard = TextInputType.text,
    this.icon,
    this.date,
    this.controller,
    this.onTap,
    this.Onvalidator,
    this.pass = false,
  });

  @override
  State<Txtfield> createState() => _TxtfieldState();
}

class _TxtfieldState extends State<Txtfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Icon(widget.icon),
                  ),
                  SizedBox(
                      width: 200,
                      child: widget.date == null
                          ? TextFormField(
                              validator: widget.Onvalidator,
                              obscureText: widget.pass,
                              onTap: widget.onTap,
                              readOnly: widget.isVisible,
                              controller: widget.controller,
                              keyboardType: widget.keyboard,
                              decoration: InputDecoration(
                                hintText: widget.hint,
                                labelText: widget.label,
                              ),
                            )
                          : DatePickerDialog(
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1990),
                              lastDate: DateTime(2005))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
