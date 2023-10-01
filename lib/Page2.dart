// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:profilelists/Common/Alert%20Button.dart';
import 'package:profilelists/Common/Data.dart';
import 'package:profilelists/Common/ShowMsg.dart';
import 'package:profilelists/Common/raw.dart';
import 'package:profilelists/Common/sharedPreference.dart';
import 'Model.dart';

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
  List details = [];

  @override
  void initState() {
    //
    super.initState();

    showValues().then((value) {
      for (var element in value.keys) {
        details.add(value[element]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Diolog.showAlertDiolog(context, "Log Out?", "Are you Sure?");
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
                        details.clear();
                      });
                    },
                    child: const Text("Remove All"))
              ],
            ),
          ),
          Card(
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
                            raw(title: details[0]),
                            raw(title: details[1]),
                            raw(title: details[2]),
                            raw(title: details[3]),
                            raw(title: details[4]),
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
                            details.removeAt(0);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ))),
              ],
            ),
          ),

          /*
          Expanded(
            child: ListView.builder(
              itemCount: details.length,
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
                                    raw(title: details[0]),
                                    raw(title: details[1]),
                                    raw(title: details[2]),
                                    raw(title: details[3]),
                                    raw(title: details[4]),
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
      
      */
        ],
      ),
    );
  }
}
