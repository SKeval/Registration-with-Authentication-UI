// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profilelists/Common/Alert%20Button.dart';
import 'package:profilelists/Common/Data.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/raw.dart';
import 'package:profilelists/login_ff.dart';
import 'Model.dart';
import 'Common/Alert Button.dart';

class Page2 extends StatefulWidget {
  List<Model> model = [];

  Page2({
    super.key,
  });

  @override
  State<Page2> createState() => _Page2State();
}

String Dateformat(DateTime date) {
  DateFormat formatter = DateFormat('dd-MMM-yyyy');
  return formatter.format(date);
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Diolog.showAwesome(context, "Log Out?", "Are you Sure?");
              },
              icon: const Icon(Icons.logout_rounded))
        ],
        title: const Text("View Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMsg("All Profile Deleted !!");
                        DataList.clear();
                      });
                    },
                    child: const Text("Remove All"))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: DataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    color: Colors.brown[100],
                    elevation: 20,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CircleAvatar(
                                  child: Icon(Icons.person),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    raw(title: "Name : "),
                                    raw(title: "Mobile No : "),
                                    raw(title: "Email : "),
                                    raw(title: "Birth Date : "),
                                    raw(title: "Password : "),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    raw(title: DataList[index].name),
                                    raw(title: DataList[index].number),
                                    raw(title: DataList[index].email),
                                    raw(
                                        title:
                                            "${Dateformat(DataList[index].birthdate)}    ${DataList[index].time.format(context)}"),
                                    raw(title: DataList[index].password),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showMsg("Profile Deleted !!");
                                    DataList.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
