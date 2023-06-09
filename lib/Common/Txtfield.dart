// ignore_for_file: file_names, must_be_immutable, unused_import

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

  Txtfield(
      {super.key,
      this.label,
      this.hint,
      this.keyboard = TextInputType.text,
      this.icon,
      this.date,
      this.controller});

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
                          ? TextField(
                              controller: widget.controller,
                              onSubmitted: (value) {
                                if (value.isEmpty) {
                                  showMsg("Please Enter ${widget.label}");
                                  return;
                                }
                              },
                              onEditingComplete: () {
                                if (widget.keyboard == TextInputType.number) {
                                  if (widget.controller!.text
                                      .contains(RegExp(r'[a-z A-Z]'))) {
                                    showMsg("Please Enter Number Only");
                                  }
                                }
                                if (widget.keyboard == TextInputType.text) {
                                  if (widget.controller!.text
                                      .contains(RegExp(r'[0-9]'))) {
                                    showMsg("Please Enter Letter Only");
                                  }
                                }
                                if (widget.keyboard ==
                                    TextInputType.emailAddress) {
                                  if (widget.controller!.text
                                      .contains(RegExp(r'[a-z@A-Z]'))) {
                                  } else {
                                    showMsg("Please Enter Valid Email Address");
                                  }
                                }
                              },
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
